require 'spec_helper'

describe Property do
  describe "recent" do
    it "finds a recent property" do
      name = "Test Recent #{Property.count}"
      Property.create({name: name})
      Property.recent.last.name.should == name
    end

    it "doesn't find an old property" do
      name = "Test Recent #{Property.count}"
      p = Property.create({name: name})
      p.created_at = 1.month.ago
      p.save
      Property.recent.should be_empty
    end
  end


  describe "available" do
    it "finds an available property" do
      name = "Test Available #{Property.count}"
      Property.create({name: name, status: Property::STATUS[:for_sale]})
      Property.available.last.name.should == name
    end

    it "finds an available property" do
      name = "Test Available #{Property.count}"
      Property.create({name: name, status: Property::STATUS[:for_rent]})
      Property.available.last.name.should == name
    end

    it "doesn't find an unavailable property" do
      name = "Test Available #{Property.count}"
      Property.create({name: name, status: Property::STATUS[:not_available]})
      Property.available.should be_empty
    end
  end


  describe "rentals" do
    it "finds a rental property" do
      name = "Test Rental #{Property.count}"
      Property.create({name: name, status: Property::STATUS[:for_rent]})
      Property.rentals.last.name.should == name
    end

    it "doesn't find a for sale property" do
      name = "Test Rental #{Property.count}"
      Property.create({name: name, status: Property::STATUS[:for_sale]})
      Property.rentals.should be_empty
    end
  end


  describe "for_sale" do
    it "finds a for sale property" do
      name = "Test For Sale #{Property.count}"
      Property.create({name: name, status: Property::STATUS[:for_sale]})
      Property.for_sale.last.name.should == name
    end

    it "doesn't find a rental property" do
      name = "Test For Sale #{Property.count}"
      Property.create({name: name, status: Property::STATUS[:for_rent]})
      Property.for_sale.should be_empty
    end
  end

  describe "apartments" do
    it "finds an apartment property" do
      name = "Test Apartments #{Property.count}"
      Property.create({name: name, property_type: Property::TYPE[:apartment]})
      Property.apartments.last.name.should == name
    end

    it "doesn't find a non-apartment property" do
      name = "Test Apartments #{Property.count}"
      Property.create({name: name, property_type: Property::TYPE[:condo]})
      Property.apartments.should be_empty
    end
  end

  describe "houses" do
    it "finds a condo property" do
      name = "Test House #{Property.count}"
      Property.create({name: name, property_type: Property::TYPE[:house]})
      Property.houses.last.name.should == name
    end

    it "doesn't find a non-condo property" do
      name = "Test House #{Property.count}"
      Property.create({name: name, property_type: Property::TYPE[:apartment]})
      Property.houses.should be_empty
    end
  end

  describe "condos" do
    it "finds a condo property" do
      name = "Test Condo #{Property.count}"
      Property.create({name: name, property_type: Property::TYPE[:condo]})
      Property.condos.last.name.should == name
    end

    it "doesn't find a non-condo property" do
      name = "Test Condo #{Property.count}"
      Property.create({name: name, property_type: Property::TYPE[:house]})
      Property.condos.should be_empty
    end
  end
end
