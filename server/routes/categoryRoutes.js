const express = require('express');
const { createCategory, getAllCategory, getCategoryById, updateCategory, deleteCategory } = require('../controllers/categoryController');
const router = express.Router();


router.get('/', (req, res) => {
    res.send(`Welcome to the Category routes, ${req.user.email}`);
});

router.post('/create', createCategory);
router.get('/all', getAllCategory);
router.get('/:id', getCategoryById);
router.put('/:id', updateCategory);
router.delete('/:id', deleteCategory);


module.exports = router; 