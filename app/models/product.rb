class Product < ApplicationRecord
	belongs_to :user
	has_many :tags, dependent: :destroy
	has_many :categories, through: :tags
  after_validation :set_new_price, on: [ :create, :update ]

	def self.category_with(name)
    	Category.find_by!(name: name).products
  	end

  	def category_list
    	categories.map(&:name).join(', ')
  	end

  	def category_list=(names)
    	self.categories = names.split(',').map do |n|
      		Category.where(name: n.strip).first_or_create!
    	end
  	end

    def self.search_by(search_term)
      where("LOWER(name) LIKE :search_term OR 
        LOWER(size) LIKE :search_term OR 
        LOWER(price_out) LIKE :search_term OR
        LOWER(date_in) LIKE :search_term OR
        LOWER(sale) LIKE :search_term", search_term: "%#{search_term.downcase}%")
    end

    def set_new_price
      self.price_sale = price_out * (1-sale.to_f/100)
    end 
end
