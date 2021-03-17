import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';

const initMapbox = () => {
  const mapElement = document.getElementById('map');
  const fitMapToMarkers = (map, markers) => {
    const bounds = new mapboxgl.LngLatBounds();
    markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
    map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
  };

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10'
    });

    const markers = JSON.parse(mapElement.dataset.markers);
    const orderItems = document.querySelectorAll('.list-order-item');

    markers.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);
      const markerNew = new mapboxgl.Marker()
        .setLngLat([marker.lng, marker.lat])
        .setPopup(popup)
        .addTo(map);
        
      if (marker["id"] == "0") {
        markerNew.getElement().firstChild.firstChild.firstChild.nextSibling.style.fill="#bc9545";
      }

      if (orderItems) {
        orderItems.forEach((order) => {
          if (marker["id"] == parseInt(order.dataset.customerid, 10)) {
            markerNew.getElement().firstChild.firstChild.firstChild.nextSibling.setAttribute("id", `marker-${order.dataset.customerid}`);
            if (order.dataset.groupid == "1") {
              markerNew.getElement().firstChild.firstChild.firstChild.nextSibling.style.fill="blue";
            } else if (order.dataset.groupid == "2") {
              markerNew.getElement().firstChild.firstChild.firstChild.nextSibling.style.fill="red";
            } else if (order.dataset.groupid == "3") {
              markerNew.getElement().firstChild.firstChild.firstChild.nextSibling.style.fill="green";
            } else
            markerNew.getElement().firstChild.firstChild.firstChild.nextSibling.style.fill="yellow";
            }
          });
        };
      })

    fitMapToMarkers(map, markers);
  }
};

export { initMapbox };
