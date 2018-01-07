$(document).on('turbolinks:load', function(){

    $('#ventas_fecha_inicio').datepicker({
 	 dateFormat: "dd-mm-yy"
	}).datepicker("setDate", new Date());
    
    $('#ventas_fecha_final').datepicker({
 	 dateFormat: "dd-mm-yy"
	}).datepicker("setDate", new Date());

    });




