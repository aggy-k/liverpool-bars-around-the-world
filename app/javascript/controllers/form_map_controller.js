import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl'
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"

// Connects to data-controller="form-map"
export default class extends Controller {
  static values = {
    apiKey: String,
  }

  static targets = []

  connect() {
    const addressFieldWrapper = document.getElementById('venue_address_wrapper')
    const addressField = document.getElementById('venue_address')
    console.log('target', addressFieldWrapper)
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      center: [0.1276, 51.5072],
      zoom: 8,
      style: "mapbox://styles/mapbox/streets-v10"
    })
    this.geocoder = new MapboxGeocoder({
      accessToken: mapboxgl.accessToken,
      mapboxgl: mapboxgl,
      types: "country,region,place,postcode,locality,neighborhood,address,poi",
    })
    this.map.addControl(this.geocoder)
    this.geocoder.addTo(addressFieldWrapper)

    this.geocoder.on("result", event => this.#addAddressField(event))
    this.geocoder.on("clear", () => this.#clearAddressField)
  }

  #addAddressField(event) {
    console.log(event)
  }

  #clearAddressField() {

  }
}
