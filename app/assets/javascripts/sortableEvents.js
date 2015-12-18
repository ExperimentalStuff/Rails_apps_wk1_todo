$(document).ready(function(){
	// make events sortable
	$("#sortable").sortable();
	$("#sortable").disableSelection();


	//create location object for ajax to send back
	$("#getOrder").on("click", function(){

		var idpos = {locations:[]};

		$(".event").each(function(){
			// get item id from dom (written in data-id)
			// use $(this).data() would result in select the entire object, causing circular reference
			var item = {"id":$(this).data('id')};
			// get item position with jquery 
			item["pos"]= ($(".event").index(this)+1);
			// push back to array for sending back
			idpos["locations"].push(item);
		});

		console.log(JSON.stringify(idpos));
		
		$.ajax({
			type: "POST",
			url: "events/location",
			contentType: "application/json",
			data: JSON.stringify(idpos)
		});

	});
});