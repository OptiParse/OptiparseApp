const { prisma } = require("../db");

const makeTransaction = async (req, res) => {
    const { amount, merchant, date } = req.body;
    if (!amount || !merchant || !date) {
        return res.status(400).json({ error: 'Amount, date and Mechant name are required' });
    }
    
    // Create the transaction
    try{
        const newTransaction = await prisma.transaction.create({
            data: {
                amount,
                merchant,
                date,
                // userId: req.user.id,
                user: {
                    connect: {
                        id: req.user.id,
                    },
                },
            },
        });
        res.json(newTransaction);
    } catch (error) {
        res.status(500).json({ error: 'An error occurred while creating the transaction', message: error.message });
    }
}
const getTransactions = async (req, res) => {
    const transactions = await prisma.transaction.findMany({
        where: {
            userId: req.user.id,
        },
    });
    res.json(transactions);
}


module.exports = { makeTransaction, getTransactions };