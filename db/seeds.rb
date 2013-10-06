

1000.times do 
  sq_ft = 1500 + rand(1000)
  Property.where({
    name: "#{rand(3000)} Main St",
    property_type: rand(Property::TYPE.size),
    status: rand(Property::STATUS.size),
    price: 150000 + rand(100000),
    year_built: 1980 + rand(30),
    square_feet: sq_ft,
    lot_size: sq_ft + rand(500),
    baths: 0.5 + 0.5 * rand(4),
    bedrooms: rand(3),
    image_url: "/assets/#{rand(7)}.jpg"
  }).first_or_create
end