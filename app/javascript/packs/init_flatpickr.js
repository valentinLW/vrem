import flatpickr from "flatpickr";

function datepickr() {

flatpickr(".datepicker", {
  altInput: true,
  enableTime: true
});
console.log("hello")
}

export {
  datepickr
}
