const mysql = require('mysql2/promise');
const { dbConfig } = require('./config');

async function dbQueryWithData(sql, argArr = []) {
  let conn;
  try {
    // prisijungti prie DB
    conn = await mysql.createConnection(dbConfig);
    // atlikti veikma
    const [rows, fields] = await conn.execute(sql, argArr);
    console.log('fields ===', fields);
    // grazinti duomenis
    return [rows, null];
  } catch (error) {
    return [null, error];
  } finally {
    // atsijungti nuo DB
    if (conn) conn.end();
  }
}

module.exports = {
  dbQueryWithData,
};
