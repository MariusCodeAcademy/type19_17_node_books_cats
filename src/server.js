require('dotenv').config();
const express = require('express');
const morgan = require('morgan');
const cors = require('cors');
const mysql = require('mysql2/promise');
const { dbConfig } = require('./config');
const categoriesRouter = require('./routes/categoriesRoutes');
const booksRouter = require('./routes/booksRoutes');
const testConnection = require('./routes/msqlTestRoute');

const app = express();

const PORT = process.env.PORT || 5000;

// Middleware
app.use(express.json());
app.use(morgan('dev'));
app.use(cors());

// routes
app.get('/', (req, res) => {
  res.json('Hello World');
});

app.use('/', categoriesRouter);
app.use('/', booksRouter);

// testConnection();
// connect

app.listen(PORT, () => {
  console.log(`Server runing on http://localhost:${PORT}`);
});
