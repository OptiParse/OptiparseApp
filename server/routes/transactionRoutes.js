const express = require('express');
const { getTransactions, makeTransaction } = require('../controllers/transactionController');
const router = express.Router();


router.get('/', (req, res) => {
    res.send(`Welcome to the Transaction routes, ${req.user.email}`);
});

router.post('/create', makeTransaction);
router.get('/all', getTransactions);


module.exports = router;