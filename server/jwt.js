const jwt = require('jsonwebtoken');
require("dotenv").config();

const secretKey = process.env.JWT_SECRET;
const expiry = process.env.JWT_TOKEN_EXPIRATION;

function generateToken(payload) {
    // Can set token expiration time here but later we will set it in the .env file
    return jwt.sign(payload, secretKey, { expiresIn: expiry });
}

function verifyToken(token) {
    try {
        return jwt.verify(token, secretKey);
    } catch (error) {
        return null;
    }
}

module.exports = {
    generateToken,
    verifyToken
};