import flatpickr from "flatpickr";

function datepickr() {

flatpickr(".datepicker", {
  altInput: true,
  enableTime: true
});
}

export {
  datepickr
}
