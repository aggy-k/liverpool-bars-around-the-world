import { Controller } from "@hotwired/stimulus"
import Choices from 'choices.js'

// Connects to data-controller="choices-js"
export default class extends Controller {
  connect() {
    this.choices = new Choices(this.element, {
      classNames: {
        // containerOuter: 'choices-outer',
        containerInner: 'choices-single-inner'
      }
    })
  }

  keyup(e) {
    console.log('keyup event', e.detail)
    // on search, start searching cities table and set option
  }
}
