// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require_tree .


function initialize() {
    var dep = document.getElementById("eka_input").value;
    var ar  = document.getElementById("arrive").value;
    var goo         = google.maps,
        map         = new goo.Map(document.getElementById('map-canvas'),
                                  {
                                    center  : new goo.LatLng(60.169727, 24.939840),
                                    zoom    : 6,
                                    styles : [
                                            {
                                                featureType : 'administrative',
                                                elementType : 'all',
                                                stylers     : [
                                                    {
                                                        visibility: 'on'
                                                    },
                                                    {
                                                        lightness: 33
                                                    }
                                                ]
                                            },
                                            {
                                                featureType: 'landscape',
                                                elementType: 'all',
                                                stylers: [
                                                    {
                                                        color: '#f2e5d4'
                                                    }
                                                ]
                                            },
                                            {
                                                featureType: 'poi.park',
                                                elementType: 'geometry',
                                                stylers: [
                                                    {
                                                        color: '#c5dac6'
                                                    }
                                                ]
                                            },
                                            {
                                                featureType: 'poi.park',
                                                elementType: "labels",
                                                stylers: [
                                                    {
                                                        visibility: 'on'
                                                    },
                                                    {
                                                        lightness: 20
                                                    }
                                                ]
                                            },
                                            {
                                                featureType: 'road',
                                                elementType: 'all',
                                                stylers: [
                                                    {
                                                        lightness: 20
                                                    }
                                                ]
                                            },
                                            {
                                                featureType: 'road.highway',
                                                elementType: 'geometry',
                                                stylers: [
                                                    {
                                                        color: '#c5c6c6'
                                                    }
                                                ]
                                            },
                                            {
                                                featureType: 'road.arterial',
                                                elementType: 'geometry',
                                                stylers: [
                                                    {
                                                        color: '#e4d7c6'
                                                    }
                                                ]
                                            },
                                            {
                                                featureType: 'road.local',
                                                elementType: 'geometry',
                                                stylers: [
                                                    {
                                                        color: '#fbfaf7'
                                                    }
                                                ]
                                            },
                                            {
                                                featureType: 'water',
                                                elementType: 'all',
                                                stylers: [
                                                    {
                                                        visibility: 'on'
                                                    },
                                                    {
                                                        color: '#acbcc9'
                                                    }
                                                ]
                                            }

                                    ]
                                  }
                                 ),
        App         = { map               : map,
                        bounds            : new goo.LatLngBounds(),
                        directionsService : new goo.DirectionsService(),
                        directionsDisplay1: new goo.DirectionsRenderer({
                                              map             : map,
                                              preserveViewport: true,
                                              suppressMarkers : true,
                                              polylineOptions : {strokeColor: '#03F3AB'},
                                              panel           : document.getElementById('panel').appendChild(document.createElement('li'))}),
                        directionsDisplay2: new goo.DirectionsRenderer({
                                              map             : map,
                                              preserveViewport: true,
                                              suppressMarkers : true,
                                              polylineOptions : {strokeColor: '#2F74D0'},
                                              panel           : document.getElementById('panel').appendChild(document.createElement('li'))})

            },
         startLeg   = {  origin     :  dep,
                        destination :  ar,
                        travelMode  :  goo.TravelMode.TRANSIT,
                        transitOptions: {
                            modes: ['TRAIN']
                        }
         }
         middleLeg  = {  origin     :  dep,
                        destination :  ar,
                        travelMode  :  goo.TravelMode.DRIVING};

      App.directionsService.route(startLeg, function(result, status) {
        if (status == google.maps.DirectionsStatus.OK) {
          App.directionsDisplay1.setDirections(result);
          App.map.fitBounds(App.bounds.union(result.routes[0].bounds));
        }
      }); 
      
      App.directionsService.route(middleLeg, function(result, status) {
        if (status == google.maps.DirectionsStatus.OK) {
          App.directionsDisplay2.setDirections(result);
          App.map.fitBounds(App.bounds.union(result.routes[0].bounds));
        }
      });

}


google.maps.event.addDomListener(window, 'load', initialize);
