const { verifyToken } = require('../jwt');

const authenticate = async (req, res, next) => {
    try {
        // Get the authorization header from the request
        const authHeader = req.headers.authorization;

        if (!authHeader) {
            return res.status(401).json({ message: 'Unauthorized' });
        }

        // Extract the token from the authorization header
        const token = authHeader.split(' ')[1];

        // Verify the token using your authentication logic
        const user = verifyToken(token);

        if (!user) {
            return res.status(401).json({ message: 'Unauthorized' });
        }

        // Attach the authenticated user to the request object
        req.user = user;

        // Continue to the next middleware or route handler
        next();
    } catch (error) {
        console.error(error);
        return res.status(500).json({ message: 'Internal Server Error' });
    }
};

module.exports = authenticate;