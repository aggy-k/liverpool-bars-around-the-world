import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl'

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    // console.log('connected to map-controller')
    // console.log('apikey', this.apiKeyValue)
    // console.log('markers', this.markersValue)
    // console.log('el', this.element)
    const parent = this.element.parentNode;
    if (!parent.classList.contains("hidden")) this.createMap()
    this.onClassChange(parent, (observer) => console.log('Trigger onClassChange callback'))
  }

  createMap() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10"
    })
    this.map.on('render', () => this.map.resize())
    // console.log('map created')

    this.addMarkersToMap()
    this.fitMapToMarkers()
  }

  onClassChange(node, callback) {
    let lastClassString = node.classList.toString();
    // console.log('lastClassString', lastClassString)

    const mutationObserver = new MutationObserver((mutationList) => {
      for (const item of mutationList) {
        if (item.attributeName === "class") {
          const classString = node.classList.toString();
          // console.log('classString', classString)
          if (classString !== lastClassString) {
            if (node.classList.contains('hidden')) {
              this.map = null
              console.log('nullify map')
            } else {
              this.createMap()
            }
            callback(mutationObserver);
            lastClassString = classString;
            break;
          }
        }
      }
    });

    mutationObserver.observe(node, { attributes: true });

    return mutationObserver;
  }

  addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window_html)
      // const customMarker = document.createElement("div")
      // customMarker.innerHTML = marker.marker_html

      // new mapboxgl.Marker(customMarker)
      new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(this.map)
    })
  }

  fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }
}
