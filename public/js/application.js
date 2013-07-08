$(document).ready(function() {
  var screen_name = $('#user').attr('data-screen-name');
  
  $('#loader').append('<img src="ajax-loader.gif">');

  console.log('hello');
  $.ajax({
    type: 'get',
    url: '/' + screen_name + '/get_tweets'
  }).done(function(data){

    var initial = 0;
    $.each(data,function(){
      var element = '<li>' + this.tweet.content + '</li>'
      setTimeout(function(){
        $('ul').prepend(element);
        $('ul > li:first-child').hide().fadeIn();
      }, initial = initial + 500);
    });
    setTimeout(function() {
      $('#loader').find('img').fadeOut(function(){
        $(this).remove();
      });  
    }, initial + 250)
    
  });
});
