module CentresHelper
  def address(centre)
      address = ''
      address = address + centre.address_line1 if centre.address_line1
      address = address + centre.address_line2 if centre.address_line2
      address = address + centre.address_line3 if centre.address_line3
      address = address + centre.landmark1 if centre.landmark1
      address = address + centre.pincode if centre.pincode
      address = address + centre.city if centre.city
      return address
  end

  def price(lab, test_ids, test_type)
    services = Service.where(centre_id: lab.id, serviceable_id: test_ids, serviceable_type: test_type)
    total_price = 0.0
    total_discount = 0.0
    services.each do |service|
      if service.price
        total_price = total_price + service.price
      end
      if service.dd_price
        total_discount = total_discount + service.dd_price
      end
    end
    return [total_price, (total_discount/total_price)*100,total_discount]
  end
end
