<template>
  <div ref='googleMap' class='google-map'></div>
</template>

<script>
  export default {
    name: "Map",
    data() {
      return {
        bounds: new google.maps.LatLngBounds(), // Авто масштабирование карты
        map: '',
        markers: [{
          position: {latitude: 55.1598193, longitude: 61.4144122},
          label: {text: 'C', color: "white"},
          title: 'Сфера. Психологический клуб'
        },
        ],
        mapOptions: {
          center: {lat: 55.1601, lng: 61.4138},
          zoomControl: true,
          zoom: 18,
          gestureHandling: 'cooperative'
        }
      }
    },

    mounted() {
      this.initMap();
    },

    methods: {
      initMap() {
        this.map = new google.maps.Map(this.$refs.googleMap, {
          ...this.mapOptions
        })

        this.markers.forEach((marker) => {
          const position = new google.maps.LatLng(marker.position.latitude, marker.position.longitude)
          marker.map = this.map
          marker.position = position

          // marker.
          new google.maps.Marker(marker)
        })


      }
    }
  }
</script>
