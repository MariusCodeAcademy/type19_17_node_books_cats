const express = require('express');
const { dbQueryWithData } = require('../helper');

const booksRouter = express.Router();

// GET /api/books - grazina visas knygas
booksRouter.get('/api/books', async (req, res) => {
  // kreiptis i db ir grazinti categorijas (dbQueryWithData)
  const sql = 'SELECT * FROM books WHERE isDeleted=0';
  const [rows, error] = await dbQueryWithData(sql);
  if (error) {
    res.status(500).json({ error: 'Internal server error' });
    return;
  }
  res.json(rows);
});
// GET /api/books/archive - grazina visas istrintas knygas

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
booksRouter.delete('/api/books/:bookId', async (req, res) => {
  const bookId = +req.params.bookId;
  // const sql = 'DELETE FROM books WHERE book_id=? LIMIT 1';
  const sql = `
  UPDATE books
  SET isDeleted=1
  WHERE book_id=?
  LIMIT 1
  `;
  const [rows, error] = await dbQueryWithData(sql, [bookId]);
  if (error) {
    res.status(500).json({ error: 'Internal server error' });
    return;
  }
  if (rows.affectedRows === 1) {
    res.json({ msg: 'book deleted' });
    return;
  }
  res.status(400).json(rows);
});

// POST - sukuria nauja knyga
// sukurti front-end papke
// index.html sugeneruoti seleta su kategorijos kaip pavadinimais ir id kaip values

module.exports = booksRouter;
