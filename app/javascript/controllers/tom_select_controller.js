import { Controller } from "@hotwired/stimulus"
import TomSelect from 'tom-select';

// Connects to data-controller="tom-select"
export default class extends Controller {
  connect() {
    console.log('connected to tom-select', this.element)
    new TomSelect(this.element, {
      // maxItems: null,
      maxOptions: 100,
    })
  }
}
