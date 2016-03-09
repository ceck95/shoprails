class LineItemsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:create,:index]
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]
  before_action :authorize,only: [:new,:edit]
  before_action :is_admin ,:if => "session[:user_id]",only: [:new,:edit]
  # GET /line_items
  # GET /line_items.json
  def index
    @line_items = LineItem.where(cart_id: session[:cart_id])
  end

  # GET /line_items/1
  # GET /line_items/1.json
  def show
  end

  # GET /line_items/new
  def new
    @line_item = LineItem.new
  end

  # GET /line_items/1/edit
  def edit
  @line_item = LineItem.find(params[:id])
  respond_to { |format| format.html }
  end

  # POST /line_items
  # POST /line_items.json
  def create
    product = Product.find(params[ :product_id])
    @line_item = @cart.add_product(product.id)
      respond_to do |format|
        if @line_item.save
          format.html { redirect_to store_url, notice: 'Line item was successfully created.' }
          format.js {@current_item = @line_item}
          format.json { render :show, status: :created, location: @line_item }
        else
          format.html { render :new }
          format.js
          format.json { render json: @line_item.errors, status: :unprocessable_entity }
        end
      end
  end

  # PATCH/PUT /line_items/1
  # PATCH/PUT /line_items/1.json
  def update
    @line_item = LineItem.find(params[:id])
    @line_item.quantity = params[:line_item][:quantity]
    respond_to do |format|
      if @line_item.update(line_item_params)
        format.html { redirect_to my_carts_url,notice: 'Update successfully.' }
        format.json { render :show, status: :ok, location: @line_item }
      else
        format.html { redirect_to my_carts_url,notice: 'Fail.' }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    @line_item.destroy
    respond_to do |format|
      format.html { redirect_to my_carts_url, notice: 'Delete product successfully.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_item_params
      params.require(:line_item).permit(:cart_id,:product_id,:quantity)
    end
end