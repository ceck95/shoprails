class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :edit, :update, :destroy]
  # GET /carts
  # GET /carts.json
  include CurrentCart
  before_action :set_cart
  def index
    @carts = Cart.where(id: session[:cart_id])
  end

  # GET /carts/1
  # GET /carts/1.json
  def show
  end

  # GET /carts/new
  def new
    @cart = Cart.new
  end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts
  # POST /carts.json
  def create
    @cart = Cart.new(cart_params)
    respond_to do |format|
      if @cart.save
        format.html { redirect_to @cart, notice: 'Cart was successfully created.' }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { render :new ,notice: 'Ban chua login' }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carts/1
  # PATCH/PUT /carts/1.json
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
      respond_to do |format|
        if @cart.line_items.empty?
        format.html { redirect_to store_url, notice: 'Blank cart.' }
        format.json { head :no_content }
        else
        session[:cart_id] = nil
        @cart.destroy
        format.html { redirect_to store_url, notice: 'Deleted all.' }
        format.json { head :no_content }
        end
      end
  end

end
