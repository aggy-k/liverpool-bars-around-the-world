import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="venues"
export default class extends Controller {
  static targets = ["viewMap", "mapContainer", "cardsContainer", "viewList"]
  connect() {
    // console.log(11, this.viewMapTarget)
    // console.log(22, this.cardsContainerTarget)
    console.log(33, this.mapContainerTarget)
    console.log(window.innerWidth)
    this.toggleShowMapContainer()
    window.addEventListener('resize', () => this.toggleShowMapContainer())
  }

  toggleShowMapContainer() {
    console.log('in toggleShowMapContainer')
    if (window.innerWidth < 1024) {
      this.mapContainerTarget.classList.add("hidden")
    } else {
      this.mapContainerTarget.classList.remove("hidden")
    }
  }

  updatePage() {
    if (window.scrollY >= window.innerHeight) {
      if (this.hasViewMapTarget) {
        this.viewMapTarget.classList.add("fixed")
        this.viewMapTarget.classList.remove("hidden")
      }
    } else {
      if (this.hasViewMapTarget) {
        this.viewMapTarget.classList.remove("fixed")
        this.viewMapTarget.classList.add("hidden")
      }
    }
  }

  switchToMap() {
    console.log('hello')
    this.viewMapTarget?.classList?.add("hidden")
    this.viewListTarget?.classList?.remove("hidden")
    this.cardsContainerTarget?.classList?.add("hidden")
    this.mapContainerTarget?.classList?.remove("hidden")
  }

  switchToList() {
    console.log('hello')
    this.viewMapTarget?.classList?.remove("hidden")
    this.viewListTarget?.classList?.add("hidden")
    this.cardsContainerTarget?.classList?.remove("hidden")
    this.mapContainerTarget?.classList?.add("hidden")
  }
}
