class Customer
  @@customers = []
  attr_reader :name
  def initialize(options={})
    @@customers.each do |customer|
      if customer.name == options[:name]
        raise DuplicateCostomerError, "'#{options[:name]}' already exists"
      end
    end
    @name = options[:name]
    @@customers << self
  end
  def self.all
    @@customers
  end
  def self.find_by_name(name)
    @@customers.each do |customer|
      if customer.name == name
        return customer
      end
    end
  end
  def purchase(product)
    if (product.in_stock?)
      Transaction.new(self, product)
    else
      raise OutOfStockError, "'#{product.title}' is out of stock."
    end
  end
  def return(product)
    Transaction.all.each do |trans|
      if trans.customer == self && trans.product == product
        puts "here"
        trans.product.delete_transaction
        Transaction.delete_trans(trans)
      else
        raise TransactionNotExistError, "No Transaction '#{self.name}' with #{product.title}'."
      end
    end
  end
  def print
    "name: " + @name
  end
end