class Property < ActiveRecord::Base
  acts_as_taggable

  # These two were originally tables, but I did not see them changing
  # and it makes the performance quite a bit better if we don't have to 
  # routinely join another table
  STATUS = {
    :for_sale       => 0,
    :for_rent       => 1,
    :not_available  => 2
  }

  TYPE = {
    :apartment      => 0,
    :condo          => 1,
    :house          => 2
  }

  attr_accessible :name, :property_type, :status, :price, :year_built, :square_feet,
                  :lot_size, :baths, :bedrooms, :image_url

  # Scopes for convenience
  scope :recent, -> { where("created_at > '#{1.week.ago.to_s(:db)}'") }
  scope :available, -> { where("status !=  #{STATUS[:not_available]}") }
  scope :rentals, -> { where(status: STATUS[:for_rent]) }
  scope :for_sale, -> { where(status: STATUS[:for_sale]) }
  scope :apartments, -> { where(property_type: TYPE[:apartment]) }
  scope :condos, -> { where(property_type: TYPE[:condo]) }
  scope :houses, -> { where(property_type: TYPE[:house]) }
end
