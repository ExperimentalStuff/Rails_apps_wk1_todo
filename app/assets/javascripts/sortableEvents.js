$(document).ready(function(){
	$("#sortable").sortable();
	$("#sortable").disableSelection();

	$("#getOrder").on("click", function(){
		var idpos = [];
		$(".event").each(function(){
			var item = $(this).data();
			item["pos"]= $(".event").index($(this));
			idpos.push(item);
		});

		console.log(idpos);
	});
});