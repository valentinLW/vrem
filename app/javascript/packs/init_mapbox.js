import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) {
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const marker = JSON.parse(mapElement.dataset.markers);
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/schrev/ckssyy5jo3otw17qhs27v707w',
      center: [ marker.lng, marker.lat ],
      zoom: 13
    });
     new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(map);
  }
};

export { initMapbox };
