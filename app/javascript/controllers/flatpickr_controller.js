import { Controller } from "@hotwired/stimulus";
import flatpickr from "flatpickr";

// Connects to data-controller="flatpickr"

export default class extends Controller {
  // retrieve target from the DOM
  static targets = [ 'startDateInput' ]
  static values = { dates: Object }


  connect() {

    flatpickr(this.startDateInputTarget, {
      altInput: true,
      dateFormat: "Y-m-d",
      disable: this.datesValue.disable,
      // minDate: "today"
    })
  }

    // flatpickr(this.dateInputTarget, {
    //   "plugins": [new confirmDatePlugin({})],
    //   minDate: "today",

    // }, this.#options)
/*

    #options() {
      return {

      enableTime: true,
      minDate: new Date(),
      disable: ["2025-01-30"]
      }
      }


    #parsedBookedDates() {
      return this.datesValue
      } */

}
