// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery
//= require jquery.minicolors
//= require_tree .

$(document).ready(function(){
  $(".colors").minicolors({
    position: 'top left',
    inline: true
  });
})

function update_grid_color(object) {
	color_value = $(".colors").val();
	if(color_value == ''){
		alert('Please select color');
	}
	else{
		$(object).css("background-color",color_value);
		$.ajax({
      type: "POST",
      beforeSend: function(xhr) {
                    xhr.setRequestHeader('X-CSRF-Token', 
                    $('meta[name="csrf-token"]').attr('content'))
                  },
      url: "/user_color_board/update_user_grid_color",
      data: { user_color: {grid_postion: object.id, color_code: color_value} }
    });
	}

}

function refresh_grid(){
	$.ajax({
    type: "get",
    url: "/user_color_board/frequent_grid_updatation"
  });
}

window.setInterval(refresh_grid,15000);

