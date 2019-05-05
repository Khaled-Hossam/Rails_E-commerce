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
//= require jquery3
//= require bootstrap-sprockets
//= require_tree .

console.log("JS")

cart = {}


function get_cart(){
    $.ajax({
        type: "GET",
        url: "/api/me/cart/get",
        success: (res)=>{
            cart=res
        },
        error: ()=>{
            // redirectTo("/users/sign_in");
        }
      });
}


$(function(){
    $(".add-to-cart").click(function() {
        event.preventDefault()
        console.log('clicked')
    });
    get_cart()
})


function redirectTo(url){
    window.location.href = url;
}

function addSingleProductToCart(id){
    $.ajax({
        type: "POST",
        url: "api/me/cart/add_product",
            // e.preventDefault();
        data: {
            product_id: id,
        },
        success: (cart)=>{
            $('.shopping__cart').addClass('shopping__cart__on');
            $('.body__overlay').addClass('is-visible');
        },
        error: (error)=>{
            console.log(error)
            // redirectTo("/users/sign_in");
        }
      });
}
async function f(param) {
    return Promise.resolve()
  }
cart ={}





