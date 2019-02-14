module ApplicationHelper
    def number_to_pesos(number)
        number_to_currency(number, :unit => "$ ", :delimiter => ".", :precision => 0 )
    end
end
