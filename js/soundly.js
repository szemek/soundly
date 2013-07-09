require(['$api/models'], function(models) {

  $('#search').on('keyup', function(event) {
    var name = $(this).val();
    $.get('http://soundly.herokuapp.com/tracks/search', {name: name}, function(tracks){
      $('#tracks tr').remove();

      _.each(tracks, function(track){
        var compiled = _.template($('#track-item').html());
        var item = compiled({track: track});
        $('#tracks').append(item)
      });
    });
  });

});
