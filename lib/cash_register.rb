require "pry"
class CashRegister
  attr_accessor :total, :items, :price, :discount

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
    @price = []
  end

  def add_item(item, price, quantity=1)
    self.price << (price * quantity)
    self.total += (quantity * price)
    quantity.times do 
      self.items << item
    end
  end

  def apply_discount
    if discount > 0
      self.total -= (total * (discount * 0.01))
      return "After the discount, the total comes to $#{total.to_i}."
    end
    return "There is no discount to apply."
  end

  def void_last_transaction
    self.total -= self.price[-1] 
    if self.items.length == 0
      self.total = 0.0
    end
  end

end
