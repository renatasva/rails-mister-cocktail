import $ from 'jquery';
import 'select2';

$('.select2').select2({
  placeholder: "Select an ingredient",
});

// Requiring CSS! Path is relative to ./node_modules
import 'select2/dist/css/select2.css';
