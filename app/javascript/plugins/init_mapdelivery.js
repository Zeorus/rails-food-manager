import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';

const initMapDelivery = () => {
  const mapElement = document.getElementById('delivery-map');
  const fitMapToMarkers = (map, markers) => {
    const bounds = new mapboxgl.LngLatBounds();
    markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
    map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
  };

  if (mapElement) { 
    // Add your access token
    mapboxgl.accessToken = 'pk.eyJ1IjoiemVvcnVzIiwiYSI6ImNrbDI3ZzdtaTFoNGkycXAwczU5YnIwZnoifQ.4GavCrVJBbCpEJRX35kZ0Q';

    // Initialize a map
    const map = new mapboxgl.Map({
      container: 'delivery-map', // container id
      style: 'mapbox://styles/mapbox/light-v10', // stylesheet location
      // center: startLocation, // starting position
      zoom: 12 // starting zoom
    });
  
    // Initialize markers
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
    
    const startLocation = [3.201368808746338,50.70328140258789];
    // Create an empty GeoJSON feature collection, which will be used as the data source for the route before users add any new data
    const nothing = turf.featureCollection([]);

    map.on('load', function() {
      map.addSource('route', {
        type: 'geojson',
        data: nothing
      });
      map.addLayer({
        id: 'routeline-active',
        type: 'line',
        source: 'route',
        layout: {
          'line-join': 'round',
          'line-cap': 'round'
        },
        paint: {
          'line-color': '#3887be',
          'line-width': [
            "interpolate",
            ["linear"],
            ["zoom"],
            12, 3,
            22, 12
          ]
        }
      }, 'waterway-label');
      map.addLayer({
        id: 'routearrows',
        type: 'symbol',
        source: 'route',
        layout: {
          'symbol-placement': 'line',
          'text-field': '▶',
          'text-size': [
            "interpolate",
            ["linear"],
            ["zoom"],
            12, 24,
            22, 60
          ],
          'symbol-spacing': [
            "interpolate",
            ["linear"],
            ["zoom"],
            12, 30,
            22, 160
          ],
          'text-keep-upright': false
        },
        paint: {
          'text-color': '#3887be',
          'text-halo-color': 'hsl(55, 11%, 96%)',
          'text-halo-width': 3
        }
      }, 'waterway-label');

      displayRoute();
    });

    function displayRoute() {
      $.ajax({
        method: 'GET',
        url: assembleQueryURL(),
      }).done(function(data) {
        // Create a GeoJSON feature collection
        var routeGeoJSON = turf.featureCollection([turf.feature(data.trips[0].geometry)]);
    
        // If there is no route provided, reset
        if (!data.trips[0]) {
          routeGeoJSON = nothing;
        } else {
          // Update the `route` source by getting the route source
          // and setting the data equal to routeGeoJSON
          map.getSource('route')
            .setData(routeGeoJSON);
        }
      });
    }
  
    function assembleQueryURL() {
      const orders = document.querySelectorAll('.route-order-infos');
      let coords = "3.201368808746338,50.70328140258789";

      orders.forEach((order) => {
        coords += `;${order.dataset.coord}`;
      });
      
      return `https://api.mapbox.com/optimized-trips/v1/mapbox/driving/${coords}?overview=full&steps=true&geometries=geojson&source=first&access_token=${mapboxgl.accessToken}`
    }
  }
};

export { initMapDelivery };
