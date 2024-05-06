import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl'
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"

// Connects to data-controller="form-map"
export default class extends Controller {
  static values = {
    apiKey: String,
  }

  static targets = ['addressFieldWrapper', 'addressField', 'latField', 'lngField', 'map']

  connect() {
    // const addressFieldWrapper = document.getElementById('venue_address_wrapper')
    // const addressField = document.getElementById('venue_address')
    // console.log('targets?', this.targets)
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.mapTarget,
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
    // this.geocoder.addTo(this.addressFieldWrapperTarget)

    this.geocoder.on("result", event => this.#addAddressField(event))
    this.geocoder.on("clear", () => this.#clearAddressField)
    this.map.on("click", event => console.log('map click', event))
  }

  #addAddressField(event) {
    // console.log(event)
    const { center, place_name } = event.result;
    this.lngFieldTarget.value = center[0];
    this.latFieldTarget.value = center[1];
    // console.log({ place_name });
    // console.log('addressFieldTarget', this.addressFieldTarget);
    this.addressFieldTarget.value = place_name;
  }

  #clearAddressField() {

  }
}
