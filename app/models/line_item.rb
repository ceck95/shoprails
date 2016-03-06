class LineItem < ActiveRecord::Base
  validates :quantity, :presence => { message:"Không được bỏ trống" }
  belongs_to :order
  belongs_to :product
  belongs_to :cart
  def total_price
  	product.price * quantity	
  end
end
