import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="pages"
export default class extends Controller {
  static values = { goToExplore: Boolean }
  static targets = [ 'explore' ]

  connect() {
    // console.log(123, 'value', this.goToExploreValue, typeof this.goToExploreValue)
    // console.log('exploreTarget?', this.exploreTarget)

    // if (this.goToExploreValue) {
    //   console.log('hello?')
    //   this.exploreTarget.scrollIntoView({
    //     behavior: 'smooth'
    //   })
    // }
  }
}
