// sukurti routeri
const express = require('express');

const booksRouter = express.Router();

// GET /api/books - grazina visas knygas

// GET /api/books/2 - grazina visa knygos su id 2 informacija

// DELETE /api/books/2 - grazina visa knygos su id 2 informacija

module.exports = booksRouter;
