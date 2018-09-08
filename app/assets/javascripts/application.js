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
//= require social-share-button
//= require jquery
//= require jquery_ujs
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .



 //début du code de la map

  var ny = gon.mapLatLong;
	var name = gon.mapName
// création de la map
var map = L.map('map').setView(ny, 16);

// création du calque images
L.tileLayer('http://korona.geog.uni-heidelberg.de/tiles/roads/x={x}&y={y}&z={z}', {
	maxZoom: 20
}).addTo(map);

// ajout d'un markeur
var marker = L.marker(ny).addTo(map);

// ajout d'un popup
marker.bindPopup(name);

//fin du code de la map 
