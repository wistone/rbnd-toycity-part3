require_relative "errors"

class Product
	@@products = []
	@@products_in_stock = []

	attr_reader :title, :price, :stock
	def initialize(options={})
		@@products.each do |product|
			if product.title == options[:title]
				raise DuplicateProductError, options[:title] + " already exists!"
			end
		end
		@title = options[:title]
		@price = options[:price]
		@stock = options[:stock]
		@@products << self
		if (options[:stock] > 0)
			@@products_in_stock << self
		end
	end
	def in_stock?
		@stock > 0
	end
  def self.all
    @@products
  end
  def self.find_by_title(title)
		@@products.each do |product|
			if product.title == title
				return product
			end
		end
	end
	def self.in_stock
		@@products_in_stock
	end
end