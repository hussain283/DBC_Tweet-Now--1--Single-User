$(document).ready(function() {
  //var screen_name = $('#user').attr('data-screen-name');
  
  //$('#loader').append('<img src="ajax-loader.gif">');

  // $.ajax({
  //   type: 'get',
  //   url: '/' + screen_name + '/get_tweets'
  // }).done(function(data){

  //   var initial = 0;
  //   $.each(data,function(){
  //     var element = '<li>' + this.tweet.content + '</li>'
  //     setTimeout(function(){
  //       $('ul').prepend(element);
  //       $('ul > li:first-child').hide().fadeIn();
  //     }, initial = initial + 500);
  //   });
  //   setTimeout(function() {
  //     $('#loader').find('img').fadeOut(function(){
  //       $(this).remove();
  //     });  
  //   }, initial + 250)
    
  // });

  $('#tweet_form').on('submit',function(e){
    e.preventDefault();
    var data = $(this).serialize();


    $('#tweet_form input').attr('disabled','disabled');
    $('#loader').fadeIn();
    $('#loader p').text("Tweeting!!")

    console.log(data);
    $.ajax({
      url: '/tweet',
      type: 'post',
      data: data
    }).done(function(data){
      $('#loader p').text("Success!")

      $('#loader').fadeOut();
      $('#tweet_form input').removeAttr('disabled');
      $('#tweet_form textarea').val("");


    });
  });


});
