# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

###
initialize = ->
  goo = google.maps
  map = new (goo.Map)(document.getElementById('map-canvas'),
    center: new (goo.LatLng)(52.52, 13.40)
    zoom: 10)
  App =
    map: map
    bounds: new (goo.LatLngBounds)
    directionsService: new (goo.DirectionsService)
    directionsDisplay1: new (goo.DirectionsRenderer)(
      map: map
      preserveViewport: true
      suppressMarkers: true
      polylineOptions: strokeColor: 'red'
      panel: document.getElementById('panel').appendChild(document.createElement('li')))
    directionsDisplay2: new (goo.DirectionsRenderer)(
      map: map
      preserveViewport: true
      suppressMarkers: true
      polylineOptions: strokeColor: 'blue'
      panel: document.getElementById('panel').appendChild(document.createElement('li')))
    directionsDisplay3: new (goo.DirectionsRenderer)(
      map: map
      preserveViewport: true
      suppressMarkers: true
      polylineOptions: strokeColor: 'yellow'
      panel: document.getElementById('panel').appendChild(document.createElement('li')))
  startLeg =
    origin: 'Helsinki'
    destination: 'Turku'
    travelMode: goo.TravelMode.DRIVING
  middleLeg =
    origin: 'Helsinki'
    destination: 'Turku'
    travelMode: goo.TravelMode.TRANSIT
  endLeg =
    origin: 'Helsinki'
    destination: 'Oulu'
    travelMode: goo.TravelMode.FLYING
  App.directionsService.route startLeg, (result, status) ->
    if status == google.maps.DirectionsStatus.OK
      App.directionsDisplay1.setDirections result
      App.map.fitBounds App.bounds.union(result.routes[0].bounds)
    return
  App.directionsService.route middleLeg, (result, status) ->
    if status == google.maps.DirectionsStatus.OK
      App.directionsDisplay2.setDirections result
      App.map.fitBounds App.bounds.union(result.routes[0].bounds)
    return
  App.directionsService.route endLeg, (result, status) ->
    if status == google.maps.DirectionsStatus.OK
      App.directionsDisplay3.setDirections result
      App.map.fitBounds App.bounds.union(result.routes[0].bounds)
    return
  return

google.maps.event.addDomListener window, 'load', initialize
###
