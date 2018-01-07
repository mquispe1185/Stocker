// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).on('turbolinks:load', function(){

    $('#horario_fecha_inicio').datepicker({
 	 dateFormat: "dd-mm-yy"
	}).datepicker("setDate", new Date());
    
    $('#horario_fecha_final').datepicker({
 	 dateFormat: "dd-mm-yy"
	}).datepicker("setDate", new Date());

	    

    });