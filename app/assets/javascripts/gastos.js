$(document).on('turbolinks:load', function(){

    $('#fechagastos_fecha_inicio').datepicker({
 	 dateFormat: "dd-mm-yy"
	}).datepicker("setDate", new Date());
    
    $('#fechagastos_fecha_final').datepicker({
 	 dateFormat: "dd-mm-yy"
	}).datepicker("setDate", new Date());

    });
