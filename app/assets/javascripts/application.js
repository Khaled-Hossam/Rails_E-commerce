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
//= require bootstrap-sprockets
//= require activestorage
//= require turbolinks
//= require_tree .



function redirectTo(url) {
    window.location.href = url;
}





$(function () {


    const cart = new function () {
        this.products = []
        this.last = { resp: null, action: null }

        // endpoint resource 
        this.resource = {
            'get_products': {
                'type': 'GET',
                'url': "/api/me/cart/get_products",
            },
            'add_product': {
                'type': "POST",
                'url': "api/me/cart/add_product",
            },
            'update_product': {
                type: "PUT",
                url: "/api/me/cart/update_product",
            },
            'remove_product': {
                type: "DELETE",
                url: "/api/me/cart/remove_product",
            }
        }



        this.fetch_products = function (callback) {

            $.ajax({
                ... this.resource.get_products,
                success: (res) => {
                    this.products = res
                    callback(res)
                },
                error: () => {
                    redirectTo("/users/sign_in");
                }
            });
        }


        this.add_product = function (id, callback) {
            $.ajax({
                ... this.resource.add_product,
                data: {
                    product_id: id,
                },
                success: (resp) => {
                    this.last.resp = resp
                    this.last.action = 'remove'
                    this.fetchAndNotifyAll()
                    callback()
                },
                error: (error) => {
                    redirectTo("/users/sign_in");
                }
            });
        }


        this.update_product = function (product_id, quantity, callback) {
            $.ajax({
                ... this.resource.update_product,
                data: {
                    product_id: product_id,
                    quantity: quantity,
                },
                success: (resp) => {
                    this.last.resp = resp
                    this.last.action = 'update'
                    this.fetchAndNotifyAll()

                    callback()
                },
                error: (error) => {
                }
            });
        }


        this.remove_product = function (product_id, callback) {
            $.ajax({
                ... this.resource.remove_product,
                data: {
                    product_id: product_id,
                },
                success: (resp) => {
                    this.last.resp = resp
                    this.last.action = 'remove'
                    this.fetchAndNotifyAll()

                    callback()
                },
                error: (error) => {

                }
            });
        }
        this.observers = []
        this.subscribe = (observer) => {
            this.observers.push(observer)
        }

        this.fetchAndNotifyAll = function () {
            this.fetch_products(this.notifyAll)
        }

        this.notifyAll = (products) => {
            this.observers.forEach(o => {
                o.notify(products)
            })
        }


        this.getItemsCount = function () {
            let sum = 0
            this.products.forEach((cp) => {
                sum += cp.quantity
            })
            return sum
        }
        this.getTotalPrice = function () {
            let sum = 0
            this.products.forEach((cp) => {
                sum += (cp.quantity * cp.product.price)
            })
            return sum
        }
    }
    const cpTemplate = new function () {
        this.temp = $('.cp__mock__template').find('.shp__single__product')

        this.generateFor = function (id, name, price, quantity) {
            t = this.temp.clone()
            $(t).attr('product_id', id)
            t.find('.cp__name').text(name)
            t.find('.cp__subtotal__price').text(quantity * price)
            t.find('.cp__quantity').text(quantity)
            return t
        }
    }



    const cartOverlay = new function () {
        this.products = []
        this.show = function () {
            $('.shopping__cart').addClass('shopping__cart__on')
            $('.body__overlay').addClass('is-visible')
        }

        this.update = function (data) {

            $('.htc__qua').text(cart.getItemsCount())

            $('.total__price').text(cart.getTotalPrice())

            $('.shp__cart__wrap').empty()
            data.forEach(function (item) {
                $('.shp__cart__wrap').append(
                    cpTemplate.generateFor(
                        item.product.id,
                        item.product.name,
                        item.product.price,
                        item.quantity)
                )
            })
            $('.remove__cp').click(function () {
                event.preventDefault()
                let node = $(event.target).parents('.shp__single__product')
                let product_id = node.attr('product_id')
                cart.remove_product(product_id, function () {
                    $(node).remove()
                })
            })
        }

        this.updateAndShow = function () {
            this.update()
            this.show()
        }
        this.notify = (products) => {
            this.update(products)
        }
        this.init = function () {

            cart.fetch_products((data) => {
                this.update(data)
            })
        }
        this.init()
        cart.subscribe(this)
    }


    $(".add_to_cart").click(function () {
        event.preventDefault()
        node = event.target
        if ($(node).is('i'))
            node = node.parentNode
        product_id = node.getAttribute('product_id')
        cart.add_product(product_id, () => {
            cartOverlay.show()
        })
    });


    /// cart page ============================= 

    const cartTable = new function () {
        this.update = function () {
            if (cart.last.action === 'remove') {
                $(`tr[product_id^='${cart.last.resp.product.id}']`).remove()
            }

            $('.order__total__value').text(cart.getTotalPrice())
        }
        cart.subscribe(this)

        this.notify = () => {
            this.update()
        }
    }

    $('.select__quantity').click(() => {
        let product_node = event.target.parentNode.parentNode
        let product_id = product_node.getAttribute('product_id')
        let quantity = event.target.value
        let product_price = $(product_node).find('.product-price').text()


        cart.update_product(product_id, quantity, function () {
            $(product_node).find('.product-subtotal').text(product_price * quantity)
        })

    })

    $(".product-remove").click(function () {
        let product_node = event.target.parentNode
        if ($(product_node).is('a'))
            product_node = product_node.parentNode.parentNode

        let product_id = product_node.getAttribute('product_id')
        cart.remove_product(product_id, () => {
            $(product_node).remove()
        })

    });


    $('.cart__menu').on('click', function (e) {
        $('.shopping__cart').addClass('shopping__cart__on');
        $('.body__overlay').addClass('is-visible');
    })


    //// COUPON     ---------------------------

    let used_coupon = {}

    $('.validate__coupon').click( function(){
        event.preventDefault()
        let ping =false
        let pong =false

        coupon_name = $('.coupon__name').val()
        if(coupon_name == 'Ping'){
            ping = true     
            $('.coupon__message').text('Pong')
        } 
        else if (coupon_name == 'Pong') {
            pong = true
            $('.coupon__message').text('Enjoy our free coupon: "Best Buds" ')
        }
        else{

            $.ajax({
                type: 'GET',
                url: '/api/me/coupons/check',
                data: {
                    coupon_name: $('.coupon__name').val(),
                },
                success: (resp) => {
                    console.log('resp', resp.valid)

                    if (resp.valid)
                        valid_coupon()
                    else 
                        invalid_coupon()

                },
                error: (error) => {
                    invalid_coupon()

                }
            });
        }
    })
    function valid_coupon(){
        $('.coupon__message').text('Coupon accepted')
        $('.coupon__message').removeClass('fail')
        $('.coupon__message').addClass('success')
        order.setCoupon(resp.data)
    }


    function invalid_coupon(){
        $('.coupon__message').text('Invalid Coupon')
        $('.coupon__message').removeClass('success')
        $('.coupon__message').addClass('fail')
        order.setCoupon({})

    }

    /// ORDER ------------------
   
    const order = new function (){
        this.cart_price = 0
        this.products={}
        this.discount_amount = 0
        this.total_order_price = 0
        this.coupon = { }

        cart.fetch_products((p)=>{
            this.products =p
            this.cart_price = cart.getTotalPrice()
            this.updateOrder()

        })
        this.notify = (p)=>{
            this.products = p
            this.cart_price = cart.getTotalPrice()
            this.updateOrder()

        }
        this.setCoupon = function(coupon){
            this.coupon = coupon
            this.updateOrder()
            
        }
        this.updateDiscountAmount = function (){
            this.discount_amount = Math.min(
                this.coupon.discount_percentage * this.cart_price /100 || 0,
                this.coupon.max_discount_amount || 0
                )
        }

        this.updateOrderTotalPrice =function(){
               this.total_order_price = this.cart_price - this.discount_amount
        }

        this.updateView = function(){
            $('.cart__total__value').text(this.cart_price)
            $('.discount__amount').text(this.discount_amount)
            $('.order__total__value').text(this.total_order_price)
            if (this.discount_amount > 0){
                $('.cart__total__value').addClass('discount')
            }else{
                $('.cart__total__value').removeClass('discount')

            }

        }

        this.updateOrder= function(){
            this.updateDiscountAmount()
            this.updateOrderTotalPrice()
            this.updateView()
        }
        
        this.create = function(){
            $.ajax({
                type: 'POST',
                url: '/orders',
                dataType: 'json',
                contentType: 'application/json',
                data: JSON.stringify({
                    coupon_id: this.coupon.id || null,
                    products:  extract(this.products),   
                }),
                success: (resp) => {
                   alert('success')
                },
                error: (error) => {
                    alert('')
                }
            });
        }
        cart.subscribe(this)
    }
    function extract(products){
        a=[]
        products.forEach((cp)=>{
            a.push({
                product_id: cp.product.id,
                quantity: cp.quantity,
                purchased_price: cp.product.price 
            }) 
        })
        return a
    }
    

    $('.place__order').click(function(){
        event.preventDefault()
                    

        order.create()
    })

})


