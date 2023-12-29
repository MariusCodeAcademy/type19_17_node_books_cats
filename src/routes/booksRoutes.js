const express = require('express');
const { dbQueryWithData } = require('../helper');

const booksRouter = express.Router();

// GET /api/books - grazina visas knygas su kategorijos pav
booksRouter.get('/api/books', async (req, res) => {
  // kreiptis i db ir grazinti categorijas (dbQueryWithData)
  // const sql = 'SELECT * FROM books WHERE isDeleted=0';
  const sql = `
  SELECT book_id, title, author,year, categories.category, isDeleted
  FROM books
  JOIN categories
  ON books.cat_id=categories.cat_id
  WHERE isDeleted=0
  `;
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
booksRouter.post('/api/books/', async (req, res) => {
  const { title, author, year, cat_id: catId } = req.body;
  const argArr = [title, author, year, catId];
  const sql =
    'INSERT INTO books (title, author, year, cat_id) VALUES (?,?,?,?)';

  const [rowsObj, error] = await dbQueryWithData(sql, argArr);

  if (error) {
    console.log('error ===', error);
    res.status(500).json({ error: 'Internal server error' });
    return;
  }
  res.json(rowsObj);
});

// sukurti front-end papke
// index.html sugeneruoti seleta su kategorijos kaip pavadinimais ir id kaip values

module.exports = booksRouter;
