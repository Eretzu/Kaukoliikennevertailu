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
    var goo         = google.maps,
        map         = new goo.Map(document.getElementById('map-canvas'),
                                  {
                                    center  : new goo.LatLng(52.52, 13.40),
                                    zoom    : 10
                                  }
                                 ),
        App         = { map               : map,
                        bounds            : new goo.LatLngBounds(),
                        directionsService : new goo.DirectionsService(),    
                        directionsDisplay1: new goo.DirectionsRenderer({
                                              map             : map,
                                              preserveViewport: true,
                                              suppressMarkers : true,
                                              polylineOptions : {strokeColor:'red'},
                                              panel           : document.getElementById('panel').appendChild(document.createElement('li'))}),
                        directionsDisplay2: new goo.DirectionsRenderer({
                                              map             : map,
                                              preserveViewport: true,
                                              suppressMarkers : true,
                                              polylineOptions : {strokeColor:'blue'},
                                              panel           : document.getElementById('panel').appendChild(document.createElement('li'))}),
                        directionsDisplay3: new goo.DirectionsRenderer({
                                              map             : map,
                                              preserveViewport: true,
                                              suppressMarkers : true,
                                              polylineOptions : {strokeColor:'yellow'},
                                              panel           : document.getElementById('panel').appendChild(document.createElement('li'))
                                              })
              
            },
         startLeg   = {  origin     :  'Rome',
                        destination :  'Paris',
                        travelMode  :  goo.TravelMode.DRIVING},        
         middleLeg  = {  origin     :  'Paris',
                        destination :  'Berlin',
                        travelMode  :  goo.TravelMode.TRANSIT},        
         endLeg     = { origin      :  'Berlin',
                        destination :  'Buxtehude',
                        travelMode  :  goo.TravelMode.BICYCLING};        
      
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
      
      App.directionsService.route(endLeg, function(result, status) {
        if (status == google.maps.DirectionsStatus.OK) {
          App.directionsDisplay3.setDirections(result);
          App.map.fitBounds(App.bounds.union(result.routes[0].bounds));
        }
      });
}


google.maps.event.addDomListener(window, 'load', initialize);
