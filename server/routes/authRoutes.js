const express = require('express');
const { reigsterUser, loginUser } = require('../controllers/authControllers');

const router = express.Router();

router.get('/', (req, res) => {
    res.send('Welcome to the Auth routes');
});
router.post('/signup',reigsterUser);
router.post('/login',loginUser);

module.exports = router;