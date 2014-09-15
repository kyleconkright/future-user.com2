$ ->

	#videos

	holder = $('#video #holder')
	id = 'AycZ_9goeS4'
	holder.html('<iframe width="853" height="480" src="//www.youtube.com/embed/'+id+'" frameborder="0" allowfullscreen></iframe>').fitVids()
	controller = $('#video #controller')
	currentVideo = holder.html


	$.getJSON 'https://gdata.youtube.com/feeds/api/playlists/PLwiBGptTigOof7ZhEIH_Pl8jksfvSM7oE?alt=jsonc&v=2', (results) ->
		$.each results.data.items, ->
			pic = this.video.thumbnail.hqDefault
			id = this.video.id
			title = this.video.title
			$('<div class="control" data-id="'+id+'" data-tooltip="'+title+'"><span style="background-image: url('+pic+');"></span></div>')
			.appendTo controller
		$('#controller .control').on 'click', ->
			id = $(@).data('id')
			holder.html('<iframe width="853" height="480" src="//www.youtube.com/embed/'+id+'?autoplay=1" frameborder="0" allowfullscreen></iframe>').fitVids()


	#mailinglist

	$form = $('.mailinglist form')

	$form.submit (e)->
		e.preventDefault()
		$this = $(@)
		$.ajax
			type: 'GET'
			url: 'http://future-user.us9.list-manage.com/subscribe/post?u=1aaae805b3c032b8fa73fa7ba&amp;id=8e8d1d3ca6&c=?'
			data: $this.serialize()
			dataType: 'json'
			contentType: "application/json; charset=utf-8"
			success: (data) ->
				$('input#mce-EMAIL').val('thanks')


	#singles

	$.ajax
		url: 'data/data.json'
		type: 'get'
		dataType: 'json'
		success: (results)->
			$.each (results.singles), ->
				$('
					<div class="single">
						<h3>'+this.title+'</h3>
						<img class="cover" src="assets/img/singles/'+this.art+'">
						<div class="single-links">
							<a href="'+this.itunes+'"><img src="assets/img/itunes.png"></a>
							<a href="'+this.spotify+'"><img src="assets/img/spotify.png"></a>
							<a href="'+this.beats+'"><img src="assets/img/beats.png"></a>
						</div>
					</div>
				').appendTo('#singles')


