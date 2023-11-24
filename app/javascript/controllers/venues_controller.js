import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="venues"
export default class extends Controller {
  static targets = ["viewMap"]
  connect() {
    console.log(this.viewMapTarget)
  }

  updatePage() {
    if (window.scrollY >= window.innerHeight) {
      this.viewMapTarget.classList.add("fixed")
      this.viewMapTarget.classList.remove("hidden")
    } else {
      this.viewMapTarget.classList.remove("fixed")
      this.viewMapTarget.classList.add("hidden")
    }
  }
}
