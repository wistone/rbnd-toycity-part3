class Product
	@@products = []

	attr_accessor :title, :price, :stock 
	def initialize(options={})
		@@products.each do |product|
			if product.title == options[:title]
				raise DumplecatedProductError
			end
		end
		@title = options[:title]
		@price = options[:price]
		@stock = options[:stock]
		@@products << self
	end
  def self.all
    @@products
  end
end