// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui.js
//= require dataTables/jquery.dataTables
//= require twitter/bootstrap
//= require angular
//= require angular-route
//= require main
//= require_tree ./angular
//= require_tree .

var dropZoneOne = document.querySelector('#drop-target-one');

// Get the draggable elements.
var dragElements = document.querySelectorAll('#drag-elements li');

// Track the element that is being dragged.
var elementDragged = null;

for (var i = 0; i < dragElements.length; i++) {

  // Event Listener for when the drag interaction starts.
  dragElements[i].addEventListener('dragstart', function(e) {
    e.dataTransfer.effectAllowed = 'move';
    e.dataTransfer.setData('text', this.innerHTML);
    elementDragged = this;
  });

  // Event Listener for when the drag interaction finishes.
  dragElements[i].addEventListener('dragend', function(e) {
    elementDragged = null;
  });

};

// Event Listener for when the dragged element is over the drop zone.
dropZoneOne.addEventListener('dragover', function(e) {
  if (e.preventDefault) {
    e.preventDefault();
  }

  e.dataTransfer.dropEffect = 'move';

  return false;
});

// Event Listener for when the dragged element enters the drop zone.
dropZoneOne.addEventListener('dragenter', function(e) {
  this.className = "over";
});

// Event Listener for when the dragged element leaves the drop zone.
dropZoneOne.addEventListener('dragleave', function(e) {
  this.className = "";
});

// Event Listener for when the dragged element dropped in the drop zone.
dropZoneOne.addEventListener('drop', function(e) {
  if (e.preventDefault) e.preventDefault(); 
  if (e.stopPropagation) e.stopPropagation();

  this.className = "chosen_courses";
  //this.innerHTML += elementDragged;
  document.querySelector('#drop-elements').appendChild(elementDragged);

  // Remove the element from the list.
  document.querySelector('#drag-elements').removeChild(elementDragged);

  return false;
});