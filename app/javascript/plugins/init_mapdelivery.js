import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';

const initMapDelivery = () => {
  const mapElement = document.getElementById('delivery-map');
  const fitMapToMarkers = (map, markers) => {
    const bounds = new mapboxgl.LngLatBounds();
    markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
    map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
  };

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'delivery-map',
      style: 'mapbox://styles/mapbox/light-v10',
      zoom: 12
    });

    const orders = document.querySelectorAll('.route-order-infos');
    let coords = "3.201368808746338,50.70328140258789";

    orders.forEach((order) => {
      coords += `;${order.dataset.coord}`;
    });

    fetch(`https://api.mapbox.com/optimized-trips/v1/mapbox/driving/${coords}?steps=true&geometries=geojson&access_token=${mapboxgl.accessToken}`)
      .then(response => response.json())
      .then((data) => {
        console.log(data);
      });

    // Ne pas modif \\
    const markers = JSON.parse(mapElement.dataset.markers);
    markers.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);
      const markerNew = new mapboxgl.Marker()
        .setLngLat([marker.lng, marker.lat])
        .setPopup(popup)
        .addTo(map);
        
      if (marker["id"] == "0") {
        markerNew.getElement().firstChild.firstChild.firstChild.nextSibling.style.fill="#bc9545";
      }

    })

    fitMapToMarkers(map, markers);
  }
};

export { initMapDelivery };
