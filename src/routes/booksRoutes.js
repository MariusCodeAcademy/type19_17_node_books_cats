const express = require('express');
const { dbQueryWithData } = require('../helper');

const booksRouter = express.Router();

// GET /api/books - grazina visas knygas
booksRouter.get('/api/books', async (req, res) => {
  // kreiptis i db ir grazinti categorijas (dbQueryWithData)
  const sql = 'SELECT * FROM books';
  const [rows, error] = await dbQueryWithData(sql);
  if (error) {
    res.status(500).json({ error: 'Internal server error' });
    return;
  }
  res.json(rows);
});

// GET /api/books/2 - grazina visa knygos su id 2 informacija
booksRouter.get('/api/books/:bookId', async (req, res) => {
  const bookId = +req.params.bookId;
  const sql = 'SELECT * FROM books WHERE book_id=?';
  const [rows, error] = await dbQueryWithData(sql, [bookId]);
  if (error) {
    res.status(500).json({ error: 'Internal server error' });
    return;
  }
  res.json(rows[0]);
});

// DELETE /api/books/2 - grazina visa knygos su id 2 informacija

module.exports = booksRouter;
