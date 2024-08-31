

const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const { prisma } = require('../db');
const { findUserByEmail } = require('../services/user.services');
// create a new user
const reigsterUser = async (req, res) => {
    const { name, email, password } = req.body;
    let hashedPassword;
    try{
        hashedPassword = await bcrypt.hash(password, 10);
    }   catch (error) {
        res.status(500).json({ error: 'Failed to create user', message: error.message });
    }
    if (!name || !email || !password) {
        return res.status(400).json({ error: 'Name, email, and password are required' });
    }
    const existingUser = await findUserByEmail(email);
    // const existingUser = await prisma.user.findUnique({ where: { email } });    

    if (existingUser) {
        return res.status(400).json({ error: 'Email Already Registered..!' });
    }
    try {
        const newUser = await prisma.user.create({
            data: {
                name,
                email,
                // password,
                password: hashedPassword,
            },
        });
        res.json(newUser);
    } catch (error) {
        res.status(500).json({ error: 'Failed to create user', message: error.message });
    }
};

// login a user
const loginUser = async (req, res) => {
    const { email, password } = req.body;
    if (!email || !password) {
        return res.status(400).json({ error: 'Email and password are required' });
    }
    const user = await findUserByEmail(email);
    if (!user) {
        return res.status(400).json({ error: 'Invalid credentials' });
    }
    const passwordMatch = await bcrypt.compare(password, user.password);
    if (!passwordMatch) {
        return res.status(400).json({ error: 'Invalid credentials' });
    }
    const token = jwt.sign({ id: user.id, email: user.email }, process.env.JWT_SECRET);
    res.json({ token });
};
module.exports = { reigsterUser,loginUser };