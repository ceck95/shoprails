class LineItem < ActiveRecord::Base
  validates :quantity, :presence => { message:"Không được bỏ trống" }
  validates :quantity, numericality: {message:"Không phải số",greater_than_or_equal_to: 1}
  belongs_to :order
  belongs_to :product
  belongs_to :cart
  def total_price
  	product.price * quantity	
  end
end
