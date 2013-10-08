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

  validates :name, presence: true
  validates :property_type, presence: true
  validates :status, presence: true
  validates :price, presence: true
  validates :year_built, presence: true
  validates :square_feet, presence: true
  validates :lot_size, presence: true
  validates :baths, presence: true
  validates :bedrooms, presence: true

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


  # Filtering scopes
  scope :at_least_beds, ->(num) { where("bedrooms >= ?", num) }
  scope :at_least_baths, ->(num) { where("baths >= ?", num) }

  scope :more_expensive_than, ->(num) { where("price > ?", num) }
  scope :cheaper_than, ->(num) { where("price < ?", num) }

  scope :more_sq_ft_than, ->(num) { where("square_feet > ?", num) }
  scope :less_sq_ft_than, ->(num) { where("square_feet < ?", num) }

  scope :more_lot_size_than, ->(num) { where("lot_size > ?", num) }
  scope :less_lot_size_than, ->(num) { where("lot_size < ?", num) }

  scope :newer_than, ->(num) { where("year_built > ?", num) }
  scope :older_than, ->(num) { where("year_built < ?", num) }

end
