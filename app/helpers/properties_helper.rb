module PropertiesHelper
  def bed_options_for_select(selected)
    options_for_select({
      '0+' => "0",
      '1+' => "1",
      '2+' => "2",
      '3+' => "3",
      '4+' => "4",
      '5+' => "5",
      '6+' => "6"
    }, selected)
  end

  def bath_options_for_select(selected)
    options_for_select({
      '1+' => "1",
      '1.5+' => "1.5",
      '2+' => "2",
      '3+' => "3",
      '4+' => "4",
      '5+' => "5",
      '6+' => "6"
    }, selected)
  end

  def display_price(property)
    if property.status == Property::STATUS[:for_rent]
      return "#{number_to_currency(property.price / 120)} per month"
    else
      return "#{number_to_currency(property.price)}"
    end
  end
end
