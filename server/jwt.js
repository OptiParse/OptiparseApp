const jwt = require('jsonwebtoken');


// Define your secret key
const secretKey = env("SECRET_KEY");
const expiry = env("JWT_TOKEN_EXPIRATION");

// Generate a JWT token
function generateToken(payload) {
    // Can set token expiration time here but later we will set it in the .env file
    return jwt.sign(payload, secretKey, { expiresIn: expiry });
}

// Verify a JWT token
function verifyToken(token) {
    try {
        return jwt.verify(token, secretKey);
    } catch (error) {
        return null;
    }
}

// Export the functions
module.exports = {
    generateToken,
    verifyToken
};