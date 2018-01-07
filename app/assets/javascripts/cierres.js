$(document).on('turbolinks:load', function(){

    $('#fechas_fecha_inicio').datepicker({
 	 dateFormat: "dd-mm-yy"
	}).datepicker("setDate", new Date());
    
    $('#fechas_fecha_final').datepicker({
 	 dateFormat: "dd-mm-yy"
	}).datepicker("setDate", new Date());

	   $('#balance_fecha_inicio').datepicker({
 	 dateFormat: "dd-mm-yy"
	}).datepicker("setDate", new Date());
    
    $('#balance_fecha_final').datepicker({
 	 dateFormat: "dd-mm-yy"
	}).datepicker("setDate", new Date());

    });