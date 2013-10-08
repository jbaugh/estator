require 'spec_helper'

describe PropertiesController do
  before(:each) do
    @relation = double('relation')
  end

  describe "collection" do
    before(:each) do
      Property.stub(:available).and_return(@relation)
    end

    describe "index" do
      it "should find properties" do
        @relation.should_not_receive(:where)
        get :index
      end
    end

    describe "rentals" do
      it "should find properties" do
        @relation.should_receive(:rentals).and_return(@relation)
        get :rentals
      end
    end

    describe "for_sale" do
      it "should find properties" do
        @relation.should_receive(:for_sale).and_return(@relation)
        get :for_sale
      end
    end

    describe "houses" do
      it "should find properties" do
        @relation.should_receive(:houses).and_return(@relation)
        get :houses
      end
    end

    describe "condos" do
      it "should find properties" do
        @relation.should_receive(:condos).and_return(@relation)
        get :condos
      end
    end

    describe "apartments" do
      it "should find properties" do
        @relation.should_receive(:apartments).and_return(@relation)
        get :apartments
      end
    end

    describe "recent" do
      it "should find properties" do
        @relation.should_receive(:recent).and_return(@relation)
        get :recent
      end
    end

    describe "setup_search" do
      before(:all) do
        @value = "1000"
      end

      it "should find properties" do
        @relation.should_receive(:more_expensive_than).with(@value)
        get :index, :price_min => @value
      end

      it "should find properties" do
        @relation.should_receive(:cheaper_than).with(@value)
        get :index, :price_max => @value
      end

      it "should find properties" do
        @relation.should_receive(:at_least_beds).with(@value)
        get :index, :beds => @value
      end

      it "should find properties" do
        @relation.should_receive(:at_least_baths).with(@value)
        get :index, :baths => @value
      end

      it "should find properties" do
        @relation.should_receive(:more_sq_ft_than).with(@value)
        get :index, :square_feet_min => @value
      end

      it "should find properties" do
        @relation.should_receive(:less_sq_ft_than).with(@value)
        get :index, :square_feet_max => @value
      end

      it "should find properties" do
        @relation.should_receive(:more_lot_size_than).with(@value)
        get :index, :lot_size_min => @value
      end

      it "should find properties" do
        @relation.should_receive(:less_lot_size_than).with(@value)
        get :index, :lot_size_max => @value
      end

      it "should find properties" do
        @relation.should_receive(:newer_than).with(@value)
        get :index, :year_min => @value
      end

      it "should find properties" do
        @relation.should_receive(:older_than).with(@value)
        get :index, :year_max => @value
      end
    end

  end
end
