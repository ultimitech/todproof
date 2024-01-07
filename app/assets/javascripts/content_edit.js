$(document).ready(function() {

  // Reset timeout counter with each click or keydown event to prevent user from losing work when busy typing
  // counter is first started in show.html.erb (top)
  $(document).on('click keydown', function() {
    //alert('keyed');
    window.clearTimeout(timeoutHandle);
    timeoutHandle = window.setTimeout(function() { window.location = timeout_location; }, timeout_delay);
  });

  /* Activating Best In Place */
  //jQuery(".best_in_place").best_in_place();

  /*
  $('.best_in_place').bind('best_in_place:activate', function(){
     $(this).find('textarea').keydown(function(e) {
        console.log('keyCode = ' + e.keyCode);
        var $textarea = $(this);
        if(e.keyCode == 13 && !e.shiftKey) {
          console.log('13 detected !');
          e.preventDefault(); // Don't make a new line         
        }
      });
  });
  */

  /* sentence/show template has to be manually refreshed from the browser first, before this works! */
//  $(".text_area_tag").click(function() {
//    $('.submit_tag').hide();
//    $(this).parent().find('.submit_tag').slideDown();
    //$(this).parent().find('.submit_tag').slideToggle();
//  });
 
  /*
  $(".text_area_tag").focusout(function() {
    //$('.submit_tag').hide();
    //$(this).parent().find('.submit_tag').slideDown();
    $(this).parent().find('.submit_tag').slideToggle();
  });
  */

  /*
  $(".text_area_tag").blur(function() {
    //$('.submit_tag').hide();
    //$(this).parent().find('.submit_tag').slideDown();
    $(this).parent().find('.submit_tag').slideToggle();
  });
  */

  
  $(".presentable").click(function(event) {
    //var editable_id = event.target.id; 
    var presentable_id = this.id;
    console.log("presentable_id= " + presentable_id);
    var editable_id = presentable_id.slice(1); //remove prefix 'p' 
    console.log("editable_id= " + editable_id);
    $("#" + editable_id).show(); //show editable 
    $("#" + editable_id).parent().find('.submit_tag').slideDown(); //add submit button to editable
    $("#" + editable_id).parent().find('.cancel_tag').slideDown(); //add cancel button to editable
    $("#" + editable_id).parent().find('.clear_tag').slideDown(); //add clear button to editable
    $(this).hide(); //hide presentable 
    $("#" + editable_id).parent().find('.text_area_tag').focus();
  });

  //$(".editable").on('blur', (function(event) {
  $(".cancel_tag").click(function(event) {
  //$(".container").click(function(event) {
    $(".editable").hide();
    $(".presentable").show();
  });

  $(".clear_tag").click(function(event) { //believe this is simpler than click handler for .presentable, but don't want to tamper there now
    //find edit.id which ties all the icons together    
    var clear_id = this.id;
    console.log("clear_id= " + clear_id);
    var edit_id = clear_id.slice(1); //remove prefix 'c'

    //find the text_area_tag to clear and focus
    var text_area_id = "t" + edit_id;
    console.log("text_area_id=" + text_area_id);
    //$("#" + text_area_id).select();
    $("#" + text_area_id).html("");
    $("#" + text_area_id).focus();

    //find the hidden tag to set to the basis value
    var hidden_id = "h" + edit_id;
    console.log("hidden=" + hidden_id);
    //$("#" + hidden_id).val("C" + " h:" + hidden_id + " e:" + edit_id); //for debug
    $("#" + hidden_id).val("k"); //default "m" set in template
  });


  $("#blk").click(function(event) {
    $("#blk").val('');
    $("#rsub").val(''); //$("#rsub").prop("disabled", true); 
    $("#rsen").val('');  
  });

  $("#rsub").click(function(event) {
    $("#blk").val('');
    $("#rsub").val('');  
    $("#rsen").val('');  
  });
  
  $("#rsen").click(function(event) {
    $("#blk").val('');
    $("#rsub").val('');  
    $("#rsen").val('');  
  });

  // https://getbootstrap.com/docs/4.0/components/tooltips/
  $('[data-toggle="tooltip"]').tooltip(); //enable tooltips everywhere

});
