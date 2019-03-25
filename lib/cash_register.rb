class CashRegister 
  attr_accessor :total, :discount, :item, :last_transaction
  
  def initialize(discount = 0) 
    @total = 0 
    @discount = discount
    @items = []
  end
  
  def total 
    @total
  end 
  
  def add_item(item_name, price, quantity = 1)
    if quantity > 1
      i = 0
      while i < quantity
        @items << item_name
        i += 1
      end
    else
      @items << item_name
    end
    @total += price*quantity
    @last_transaction = @total
    @total
  end
  
  def apply_discount()
    if @discount > 0
      @discount = @discount/100.to_f
      @total = @total - (@total * (@discount))
      "After the discount, the total comes to $#{@total.to_i}."
    else
      "There is no discount to apply."
    end
  end
  
  def items
    @items 
  end
  
  def void_last_transaction
    @total -= last_transaction
  end
end
