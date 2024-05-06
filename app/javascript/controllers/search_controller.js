import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search"
export default class extends Controller {
  connect() {
  }

  scrollToVenues(e) {
    e.preventDefault()
    const el = document.getElementById('explore-venues');
    if (el) {
      el.scrollIntoView({ behavior: 'smooth' });
      setTimeout(() => {
        // console.log('inside settimeout')
        const bar = document.getElementById('navbar-searchbar')
        if (bar) {
          // console.log('bar found', bar)
          bar.focus()
        }
      }, 800)
    }
  }
}
