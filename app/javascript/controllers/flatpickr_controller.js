import { Controller } from "@hotwired/stimulus";
import flatpickr from "flatpickr";
import confirmDatePlugin from 'flatpickr/dist/plugins/confirmDate/confirmDate';

// Connects to data-controller="flatpickr"

export default class extends Controller {
  static targets = [ 'dateInput' ]
  static values = { dates: Object }

  connect() {
    console.log('Hello', this.dateInputTarget, this.datesValue)
    // console.log(this.datesValue)
    // flatpickr(this.dateInputTarget, {
    //   "plugins": [new confirmDatePlugin({})],
    //   minDate: "today",

    // }, this.#options)

    this.#initFlatPickr()
  }

      #initFlatPickr() {
      flatpickr(this.dateInputTarget, this.#options());
      }


    #options() {
      return {

      enableTime: true,
      minDate: new Date(),
      disable: ["2025-01-30"]
      }
      }


    #parsedBookedDates() {
      return this.datesValue
      }

}
