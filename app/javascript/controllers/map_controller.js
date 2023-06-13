import { Controller } from "@hotwired/stimulus"
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }
  connect() {
    mapboxgl.accessToken = this.apiKeyValue
    this.map = new mapboxgl.Map({
      container: this.element,
      projection: 'globe',
      style: "mapbox://styles/mapbox/satellite-streets-v12",
      center: [38.7077507, -9.1365919],
      zoom: 10
    });
    this.geocoder = new MapboxGeocoder({
      accessToken: this.apiKeyValue,
      types: "country,region,place,address"
    });
    this.geocoder.on("result", event => this.#setInputValue(event));
    this.geocoder.addTo(this.element);
    this.#addMarkersToMap();
    this.#fitMapToMarkers();
  }
  #setInputValue(event) {
    let location =  event.result.place_name
    let latitude = event.result.geometry.coordinates[0]
    let longitude = event.result.geometry.coordinates[1]
    console.log(event.result.geometry.coordinates[0])
    fetch("/store_demo_value", {
    method: "POST",
    headers: {
      "Content-Type": "application/json"
    },
    body: JSON.stringify({
      demoValue: location,
      demoLatitude: latitude,
      demoLongitude: longitude
    })
});
      new mapboxgl.Marker()
      .setLngLat([event.result.center[0], event.result.center[1]])
      .addTo(this.map)
      this.map.flyTo({
        center: [event.result.center[0], event.result.center[1]],
       // this animation is considered essential with respect to prefers-reduced-motion
        zoom: 10
      });
      // lastloc = [event.result.center[0], event.result.center[1]]
      console.log(event.result.center[0])
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window_html)
      new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(this.map)
    })
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }
}
