(function() {
  $(function() {
    var $form, controller, currentVideo, holder, id;
    holder = $('#video #holder');
    id = 'AycZ_9goeS4';
    holder.html('<iframe width="853" height="480" src="//www.youtube.com/embed/' + id + '" frameborder="0" allowfullscreen></iframe>').fitVids();
    controller = $('#video #controller');
    currentVideo = holder.html;
    $.getJSON('https://gdata.youtube.com/feeds/api/playlists/PLwiBGptTigOof7ZhEIH_Pl8jksfvSM7oE?alt=jsonc&v=2', function(results) {
      $.each(results.data.items, function() {
        var pic, title;
        pic = this.video.thumbnail.hqDefault;
        id = this.video.id;
        title = this.video.title;
        return $('<div class="control" data-id="' + id + '" data-tooltip="' + title + '"><span style="background-image: url(' + pic + ');"></span></div>').appendTo(controller);
      });
      return $('#controller .control').on('click', function() {
        id = $(this).data('id');
        return holder.html('<iframe width="853" height="480" src="//www.youtube.com/embed/' + id + '?autoplay=1" frameborder="0" allowfullscreen></iframe>').fitVids();
      });
    });
    $form = $('.mailinglist form');
    return $form.submit(function(e) {
      var $this;
      e.preventDefault();
      $this = $(this);
      return $.ajax({
        type: 'GET',
        url: 'http://future-user.us9.list-manage.com/subscribe/post?u=1aaae805b3c032b8fa73fa7ba&amp;id=8e8d1d3ca6&c=?',
        data: $this.serialize(),
        dataType: 'json',
        contentType: "application/json; charset=utf-8",
        success: function(data) {
          return $('input#mce-EMAIL').val('thanks');
        }
      });
    });
  });

}).call(this);
