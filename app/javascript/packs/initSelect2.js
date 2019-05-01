import $ from 'jquery';
import 'select2';

const initSelect2 = () => {
  console.log("test")
  $('.select2').select2(); // (~ document.querySelectorAll)
};


export { initSelect2 };
