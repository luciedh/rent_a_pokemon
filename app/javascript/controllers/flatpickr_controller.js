import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";


// Connects to data-controller="flatpickr"
export default class extends Controller {
  // static targets = [ 'startInput', 'endInput' ]
  static targets = [ 'startInput' ]
  static values = { dates: Object }


  connect() {
      if (!document.querySelector(".flatpickr-calendar")) {
      this.#initFlatPickr()
      }
  }

  #initFlatPickr() {
    flatpickr(this.startInputTarget, this.#options());
    }

  #options() {
    return {
      ...this.#parsedBookedDates(),
      inline: true,
      minDate: new Date()
      // mode: 'range',
      //   "plugins": [new rangePlugin({ input: this.endInputTarget})]
      }
  }

  #parsedBookedDates() {
  return this.datesValue
  }
}
