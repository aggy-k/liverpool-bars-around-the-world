import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="marker"
export default class extends Controller {
  connect() {
  }

  onMarkerClick(e) {
    console.log('======= marker dataset =====')
    console.log('target', e.target)
    console.log('currentTarget', e.currentTarget)
    console.log(e.currentTarget.dataset)
  }
}
