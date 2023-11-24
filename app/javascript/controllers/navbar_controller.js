import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  static targets = [ 'searchbar', 'exploreLink' ]
  static values = {
    homePath: Boolean
  }
  connect() {
    console.log('connected to navbar controller')
    // console.log('exploreLink', this.exploreLinkTarget)
    // console.log('searchbar', this.searchbarTarget)
    console.log('mapView', this.mapViewTarget)
    console.log(123, this.homePathValue)
    if (!this.homePathValue) {
      this.element.classList.add("bg-gray-50")
      this.exploreLinkTarget.classList.add("hidden")
      this.searchbarTarget.classList.remove("hidden")
    } else {
      this.element.classList.remove("bg-gray-50")
      this.exploreLinkTarget.classList.remove("hidden")
      this.searchbarTarget.classList.add("hidden")
    }
  }

  updateNavbar() {
    if (this.homePathValue && window.scrollY >= window.innerHeight) {
      this.element.classList.add("bg-gray-50")
      this.exploreLinkTarget.classList.add("hidden")
      this.searchbarTarget.classList.remove("hidden")
    } else {
      this.element.classList.remove("bg-gray-50")
      this.exploreLinkTarget.classList.remove("hidden")
      this.searchbarTarget.classList.add("hidden")
    }
  }
}
