'use strict';
console.log('front.js file was loaded');

const els = {
  form: document.forms[0],
  select: document.getElementById('cat_id'),
  title: document.getElementById('title'),
  author: document.getElementById('author'),
  year: document.getElementById('year'),
};
const catUrl = 'http://localhost:3000/api/categories';

async function init() {
  getCategories();
}
init();

els.form.addEventListener('submit', handleNewBookSubmit);

function handleNewBookSubmit(event) {
  event.preventDefault();
  const newBookObj = {
    title: els.title.value.trim(),
    author: els.author.value.trim(),
    year: +els.year.value,
    cat_id: +els.select.value,
  };
  console.log('newBookObj ===', newBookObj);
}

// get all categories from http://localhost:3000/api/categories
// render options in select element

async function getCategories() {
  const [data, error] = await getDataFetch(catUrl);
  if (error) {
    console.log('error ===', error);
    return;
  }
  console.log('data ===', data);
  // loop over data
  data.forEach((catObj) => {
    // create option element
    const option = document.createElement('option');
    // set option value to catObj.id
    option.value = catObj.cat_id;
    // set option text to catObj.title
    option.textContent = catObj.category;
    // append option to select element
    els.select.appendChild(option);
  });
}

const newBook = {
  title: 'Book from Thunder Client',
  author: 'James Carr',
  year: 1884,
  cat_id: 2,
};

// helper fetch fn

async function getDataFetch(url) {
  try {
    const resp = await fetch(url);
    if (resp.ok === false) {
      // eslint-disable-next-line no-throw-literal
      throw {
        status: resp.status,
        message: resp.statusText,
      };
    }
    const data = await resp.json();
    return [data, null];
  } catch (error) {
    console.log('error getDataFetch ===', error);
    return [null, error];
  }
}
