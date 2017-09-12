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
//= require jquery
//= require jquery_ujs
//= require rails-ujs
//= require bootstrap
//= require turbolinks
//= require bootstrap-datepicker
//= require moment
//= require bootstrap-datetimepicker
//= require_tree .
function remove_fields(link) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest(".fields").hide();
}

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g");
  var e = document.getElementById('booking_seats_count');
  var strSel = e.options[e.selectedIndex].value
  var count;

  for(count = 0; count < strSel; count++){

    //document.getElementById("transport_form").appendChild(content.replace(regexp, new_id));
   $(link).parent().after(content.replace(regexp, new_id));
   //document.getElementById("transport_form").appendChild(content.replace(regexp, new_id));
   new_id = new_id+1;
   //new_id = new Date().getTime();
   regexp = new RegExp("new_" + association, "g");
  }

  document.getElementById('submit').disabled = false;
  document.getElementById('booking_seats_count').disabled=true;
  var seats_count = document.createElement("input");
  seats_count.setAttribute("type", "hidden");
  seats_count.setAttribute("name", "booking[seats_count]");
  seats_count.setAttribute("value", document.getElementById('booking_seats_count').value);
  document.getElementById("transport_form").appendChild(seats_count);
  document.getElementById('add_passengers').style.display = "none";

}
