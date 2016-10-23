
class Product

  attr_accessor :name, :price

  def initialize(name, price, discount)
    @name = name
    @price = price
    @discount = discount
  end

  def discount
    @price - @price * @discount/100
  end
  
  def to_s
    "Product: #{@name}, Price: #{@price}, If Dicounts Apply: #{discount}%"  
  end
end

#add products to inventory
Banana =        Product.new("Banana", 10, 0)
OrangeJuice =   Product.new("Orange Juice", 10, 0)
Rice =          Product.new("Rice", 1, 0)
Anchovies =     Product.new("Anchovies", 2, 0)
VacuumCleaner = Product.new("Vacuum Cleaner", 150, 5)


puts "INVENTORY OF PRODUCTS"
puts "Category: Fruit"
puts Banana
puts OrangeJuice
puts Rice
puts Anchovies
puts "\nCategory: Houseware"
puts VacuumCleaner


#Add to cart


class Item < Product

	attr_accessor :product, :quantity

  def initialize(product, quantity)
      @product = product
      @quantity = quantity
  end

class Cart < Product
  
  attr_accessor :items

  def initialize
    @items = []
  end

  def add_to_cart(item, quantity=1)
    i = self.items.index { [x] x.product == item}
    i.nil? ? @items << Item.new(item, quantity) : self.items[i].quantity += quantity
  end

  def total_cart_items
    @items.inject(0) {|sum, p| sum += p.quantity}
  end 

  def total_cart_value
    @items.inject(0) {|sum, p| sum += p.product.price * quantity}

  def total_discounts
    VacuumCleaner = @items.index { |x| x.product.name == "Vacuum Cleaner" && x.price >= 100}
    if VacuumCleaner
      VacuumCleaner = @items.index { |x| x.prodcut.name == "Vacuum Cleaner"}
      total_discount = @items[VacuumCleaner].quantity * (@items[VacuumCleaner].product.price - @items[VacuumCleaner].product.discounted)
    end
    total_discount ||= 0  
  end 

end

cart = Cart.new()

#add the products you want

cart.add_to_cart(Banana, 1)
cart.add_to_cart(OrangeJuice, 1)
cart.add_to_cart(Rice, 1)
cart.add_to_cart(Anchovies, 1)
cart.add_to_cart(VacuumCleaner, 1)

puts "\nSHOPPPING CART"
puts cart.inspect


puts "SHOPPING CART SUMMARY"
cart.items.each do |i|
  puts "Product: #{i.product.name}, Quantity: #{i.quantity}, Total Price: $#{i.prodcut.price * i.quantity}"
end
puts "\nSUBTOTAL"
puts "The subtotal of your shopping cart is: $#{cart.total_cart_value}"

unless cart.total_discounts == 0
  puts "\nDISCOUNTS"
  puts "The total discount is: $#{cart.total_cart_value}"
end

puts "\nTOTAL"
puts "The total is: $#{cart.total_cart_value - cart.total_discounts}."
