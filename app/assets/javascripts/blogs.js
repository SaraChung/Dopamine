// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

function show_text()
{
    document.getElementById("photo").style.display = "none";
    document.getElementById("text").style.display = "block";
    document.getElementById("text").className = "animated bounceInDown";
}
function show_photo()
{
    document.getElementById("text").style.display = "none";
    document.getElementById("photo").style.display = "block";
    document.getElementById("photo").className = "animated bounceInDown";
}
function close_text() {

    document.getElementById("text").className = "animated bounceOutUp";
    window.setTimeout(function() {
        document.getElementById("text").style.display = "none";
    }, 100 /* but after 2000 ms */);

}
function close_photo() {

    document.getElementById("photo").className = "animated bounceOutUp";
    window.setTimeout(function() {
        document.getElementById("photo").style.display = "none";
    }, 100 /* but after 2000 ms */);

}


$(document).ready(function(){
    $("#show-text-tab").click(function(){
        $("#show-tab").hide();
        $("#text").slideDown();
    });

    $("#show-photo-tab").click(function(){
        $("#show-tab").hide();
        $("#photo").slideDown();
    });
});