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
    try {
    const transactions = await prisma.transaction.findMany();
      res.json(transactions);
    } catch (error) {
      console.error(error);
      res.status(500).json({ error: 'An error occurred while fetching transactions.' });
    }
  };
  

const addCategoryToTransaction = async (req, res) => {
    const { transactionId, categoryId } = req.body;
    if (!transactionId || !categoryId) {
        return res.status(400).json({ error: 'Transaction ID and Category ID are required' });
    }
    try {
        const updatedTransaction = await prisma.transaction.update({
            where: {
                id: transactionId,
            },
            data: {
                category: {
                    connect: {
                        id: categoryId,
                    },
                },
            },
        });
        res.json(updatedTransaction);
    } catch (error) {
        res.status(500).json({ error: 'An error occurred while updating the transaction', message: error.message });
    }
};

module.exports = { makeTransaction, getTransactions,addCategoryToTransaction };