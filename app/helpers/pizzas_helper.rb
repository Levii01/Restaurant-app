module PizzasHelper
  def price(amount)
    number_to_currency(amount, unit: "PLN", separator: ",", delimiter: "", format: "%n %u")
  end 
end
