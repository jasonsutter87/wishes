$(document).ready(function() {
	$('#cat-image-button').on('click', newCatImg)
});

function newCatImg(event){
	event.preventDefault()
	var url = $(this).attr('href')
	$.ajax({
		url: url,
		method: "GET"
	})
	.done(function(response){
		console.log(response)
		$('#the-cat-image').empty()
		$('#the-cat-image').append(response)
	})
}