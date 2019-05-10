class OrdersController < ApplicationController
  # load_and_authorize_resource
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token


  # GET /orders
  # GET /orders.json

  def index
    if current_user.role == "buyer"
    @orders = Order.get_orders_for_current_user(current_user)

    elsif current_user.role == "seller"
      @orderProducts = Order.get_items_in_order_for_user(current_user)

      render "index-seller"
      end

  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    
    Order.create(user: current_user, coupon_id: params[:coupon_id])
   
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def confirm
    @orderProduct=OrderProduct.where(id: params[:order_id])
    @orderProduct.update(status: 1)
    redirect_to "/orders"
  end

  def deliver
    @orderProduct=OrderProduct.where(id: params[:order_id])
    @orderProduct.update(status: 2)
    redirect_to "/orders"

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:state_id, :user_id, :coupon_id)
    end
end
