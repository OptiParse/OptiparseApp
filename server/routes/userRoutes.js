const express = require('express');

const router = express.Router();

router.get('/', (req, res) => {
    res.send('Welcome to the User routes');
});

router.post('/makeTransaction',);

module.exports = router;