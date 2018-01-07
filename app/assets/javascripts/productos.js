$(document).on('turbolinks:load', function(){

    $('#producto_vencimiento').datepicker({
 	 dateFormat: "dd-mm-yy"
	}).datepicker("setDate", new Date());
    


    });
