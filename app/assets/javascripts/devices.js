$(document).ready(function(){
  handler = Gmaps.build('Google');
  handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){
    markers = handler.addMarkers($('#markers').data().markers)
    handler.bounds.extendWith(markers);
    handler.fitMapToBounds();
  });
});
