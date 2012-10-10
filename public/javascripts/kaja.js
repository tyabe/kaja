$(function(){

  // **********************
  // init
  // **********************
  $.fx.interval = 30;
  var $KajaContainer = $('#KajaContainer');
  var KajaContainerWidth = 0;
  var flowtingStatus = {
    flag:0,
    scrolltop:0,
    top:0,
    left:0,
    width:0,
    margin:10,
    padding:0,
    innerPadding:10
  };

  $KajaContainer.find('.kaja').wookmark({
    autoResize: true,
    container: $KajaContainer,
    offset: 10,
    itemWidth: 280
  });

  // **********************
  // event
  // **********************
  $(document).on('click', '#KajaContainer .kaja', function(){
    var width = $('body').width();
    var height = $('body').height();

    if( $(this).is('.flowting') ){
      $(this).fadeOut('normal', function(){
        $(this).remove();
      });
      removebg();
    } else if( $KajaContainer.find('.flowting').length ){
      $KajaContainer.find('.flowting').fadeOut('normal', function(){
        $(this).remove();
      });
      removebg();
    } else {
      var $this = $(this);
      var $kaja = $this.clone();
      var top = $(document).scrollTop();

      addbg( width, height );

      $kaja.css({
        top: top
      }).addClass('flowting').addClass('hide');
      $('#KajaContainer').append( $kaja );
      $kaja.find('.hide').removeClass('hide');
      $kaja.fadeIn();
    }
  });

  $(document).on('click', '#KajaContainer .kaja a', function(e){
    e.stopPropagation();
  });

  $(document).on('click', '#KajaContainer .flowting-bg', function(e){
    $KajaContainer.find('.flowting').fadeOut('normal', function(){
      $(this).remove();
    });
    removebg();
  });

  $(window).on('resize', function(){
    if( $KajaContainer.find('.flowting-bg').length ){
      var width = $('body').width();
      var height = $('body').height();
      addbg( width, height, 'resize' );
    }
  });

  // **********************
  // functions
  // **********************
  function addbg( w, h, option ){
    var option = option || 'normal';
    var $KajaContainer = $('#KajaContainer');
    if( option == 'resize' ){
      $KajaContainer.find('.flowting-bg').css({
        width: w + 'px',
        height: h + 'px'
      });
    } else {
      var $flowtingbg = $('<div class="flowting-bg"/>');
      $flowtingbg.css({
        width: w + 'px',
        height: h + 'px',
        top: 0,
        left: 0,
        position: 'fixed',
        background: 'rgba(0,0,0,0.5)',
        zIndex: '1000'
      });
      $('#KajaContainer').prepend( $flowtingbg );
    }
  }

  function removebg(){
    var $KajaContainer = $('#KajaContainer');
    $KajaContainer.find('.flowting-bg').fadeOut('normal', function(){
      $KajaContainer.find('.flowting-bg').remove();
    });
  }
});
