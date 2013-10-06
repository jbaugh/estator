

Property.where({
  name: '135 Funtime St',
  property_type: Property::TYPE[:condo],
  status: Property::STATUS[:for_sale],
  price: 200000,
  year_built: 2002,
  square_feet: 2103,
  lot_size: 2401,
  baths: 2.5,
  bedrooms: 3,
  image_url: ''
}).first_or_create
