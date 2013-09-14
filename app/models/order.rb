class Order < ActiveRecord::Base
  has_many :line_items, :dependent => :destroy
  attr_accessible :address, :email, :name, :pay_type
  PAYMENT_TYPES = ["Check", "CreditCard", "purchase order"]
  def add_line_items_from_cart(cart)
   cart.line_item.each do |item|
      item.cart_id = nil
      line_items << item
  end
 end
 
end
