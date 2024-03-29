class Product < ActiveRecord::Base
   default_scope :order => 'title'
   has_many :line_items
   before_destroy :ensure_not_reference_by_any_line_item
   private
     def ensure_not_reference_by_any_line_item
        if line_items.empty?
             return true
         else
           errors.add(:base, 'Line Items present')
             return false
          end
       end
  attr_accessible :title, :description, :image_url, :price
  validates :title, :description, :image_url, :presence => true
  validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
  validates :title, :uniqueness => true
  validates :image_url, :format => {
  :with => %r{\.(gif|jpg|png)$}i,
  :message => 'must be a url in jpg png format'
  }
end
