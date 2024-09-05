const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();

const createCategory = async (req, res) => {
  try {
    const { name } = req.body;
    const existingCategory = await prisma.category.findFirst({
      where: { name },
    });

    if (existingCategory) {
      res.status(400).json({ error: 'Category name already exists' });
      return;
    }

    const newCategory = await prisma.category.create({
      data: { name },
    });
    res.status(201).json(newCategory);
  } catch (error) {
    console.error('Error creating category:', error); // Log the full error
    res.status(500).json({ error: 'Failed to create category' });
  }
};


const getAllCategory = async (req, res) => {
  try {
    const categories = await prisma.category.findMany();
    res.status(200).json(categories);
  } catch (error) {
    res.status(500).json({ error: 'Failed to fetch categories' });
  }
};

const getCategoryById = async (req, res) => {
  try {
    const { id } = req.params;
    const category = await prisma.category.findUnique({
      where: { id: parseInt(id) },
    });
    if (category) {
      res.status(200).json(category);
    } else {
      res.status(404).json({ error: 'Category not found' });
    }
  } catch (error) {
    res.status(500).json({ error: 'Failed to fetch category' });
  }
};

const updateCategory = async (req, res) => {
  try {
    const { id } = req.params;
    const { name } = req.body;
    const updatedCategory = await prisma.category.update({
      where: { id: parseInt(id) },
      data: { name },
    });
    res.status(200).json(updatedCategory);
  } catch (error) {
    res.status(500).json({ error: 'Failed to update category' });
  }
};

const deleteCategory = async (req, res) => {
  try {
    const { id } = req.params;
    await prisma.category.delete({
      where: { id: parseInt(id) },
    });
    res.status(204).send();
  } catch (error) {
    res.status(500).json({ error: 'Failed to delete category' });
  }
};

module.exports = {
  createCategory,
  getAllCategory,
  getCategoryById,
  updateCategory,
  deleteCategory,
};