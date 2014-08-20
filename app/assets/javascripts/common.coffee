$(document).ready ->
  $(".related_search").click ->
    keyword = $(this).data("wd")
    window.open('http://www.baidu.com/s?wd=' + encodeURIComponent(keyword))
  $("body").scrollspy({ target: '.affix_menu' })
  $(window).scroll ->
    if($(this).scrollTop() != 0)
      $('#toTop').fadeIn()
    else
      $('#toTop').fadeOut()
  $('#toTop').click ->
    $('body,html').animate({scrollTop:0},800)

