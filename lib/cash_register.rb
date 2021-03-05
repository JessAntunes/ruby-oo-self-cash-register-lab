require 'pry'
class CashRegister
   attr_accessor :total, :discount, :items, :last_transaction

    def initialize(discount = 0)
        @total = 0
        @items = []
        @last_transaction = 0.0
        @discount = discount
    end


   def add_item(title, price, quantity = 1)
        previous_total = @total
        @last_transaction = price * quantity
        @total += (price * quantity)
        while quantity > 0
            @items<<title
            quantity -= 1
        end  
    end


   def apply_discount
        if @total == 0 || @discount == 0
            return "There is no discount to apply."
        elsif  @discount > 0
            self.total -= (@total * (@discount.to_f / 100))
            return "After the discount, the total comes to $#{@total.to_int}." 
        end
   end

   def void_last_transaction

        @total -= @last_transaction   
   end

end
