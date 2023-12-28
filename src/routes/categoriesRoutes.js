const express = require('express');
const { dbQueryWithData } = require('../helper');

const categoriesRouter = express.Router();

// routes
// GET /api/categories - grazina kategorijas su id
categoriesRouter.get('/api/categories', async (req, res) => {
  // kreiptis i db ir grazinti categorijas (dbQueryWithData)
  const sql = 'SELECT * FROM categories';
  const [rows, error] = await dbQueryWithData(sql);
  if (error) {
    res.status(500).json({ error: 'Internal server error' });
    return;
  }
  res.json(rows);
});

// POST /api/categories - sukuria nauja kategorija

// sukurti front-end papke
// index.html sugeneruoti seleta su kategorijos kaip pavadinimais ir id kaip values

module.exports = categoriesRouter;
