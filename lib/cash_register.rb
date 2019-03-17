require 'pry'

class CashRegister
    attr_accessor :discount, :total, :item_list, :quantity, :price


    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @item_list=[]
    end

    def add_item(item, price, quantity = 1)
        if quantity > 1
            line = {item => price}
        quantity.times do self.item_list << line
            self.total= self.total + price
        end
        else
            line = {item => (price*quantity)}
            self.item_list << line
            self.total= self.total + price
        end
        self.total
    end

    def apply_discount
        if self.discount > 0
        discount = self.discount.to_f/100.0
        self.total = self.total - (self.total*discount)
        "After the discount, the total comes to $#{self.total.ceil}."
        elsif self.discount == 0
            "There is no discount to apply."
       end
    end
      
    def items
       list = self.item_list.map{|item| item.keys}
       list.flatten
    end

    def void_last_transaction
        last_transaction = self.item_list.last
        self.total = self.total - last_transaction.values[0].to_f
        self.item_list.last.clear
    end

end
