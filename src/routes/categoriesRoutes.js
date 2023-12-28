const express = require('express');

const categoriesRouter = express.Router();

// routes
// GET /api/categories - grazina kategorijas su id
categoriesRouter.get('/api/categories', async (req, res) => {
  // kreiptis i db ir grazinti categorijas (dbQueryWithData)
  res.json('getting all cats');
});

module.exports = categoriesRouter;
