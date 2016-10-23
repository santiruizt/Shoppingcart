class ShoppingCart
	
	attr_accessor :items

  def initialize
    @items = []
  end
end


class Item 

	attr_accessor :name, :price

  def initialize(name, price)
      @name = name
      @price = price

  end

end

class Houseware < Item
  def price
    if price > 100
      then @price = price - price * 5%
    else price = price()
  end
end

class Fruit < Item
  def price
    @price = @price

      #Something special may go here too...
  end
end

fruit = Fruit.new("Banana", 10)
fruit = Fruit.new("Orange Juice", 10)
fruit = Fruit.new("Rice", 1)
houseware = Houseware.new("Vacuum Cleaner", 150)
houseware = Houseware.new("Anchovies", 2)





