class Transaction
  @@id = 0
  @@transactions = []
  attr_reader :customer, :product, :id
  def initialize(customer, product)
    @customer = customer
    @product = product
    product.conduct_transaction
    @@id = @@id + 1
    @id = @@id
    @@transactions << self
  end
  def self.all
    @@transactions
  end
  def self.find(id)
    @@transactions[id - 1]
  end
  def self.delete_trans(trans)
    @@transactions.delete(trans)
  end
  def self.print
    puts "\n****Printing Transaction*****"
    @@transactions.each do |trans|
      puts trans.customer.print
      puts trans.product.print
    end
    puts "****End Printing Transaction*****\n\n"
  end
end