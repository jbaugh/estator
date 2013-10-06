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
        @relation.should_receive(:where)
        get :index
      end
    end

    describe "rentals" do
      it "should find properties" do
        @relation.should_receive(:rentals).and_return(@relation)
        @relation.should_receive(:where)
        get :rentals
      end
    end

    describe "for_sale" do
      it "should find properties" do
        @relation.should_receive(:for_sale).and_return(@relation)
        @relation.should_receive(:where)
        get :for_sale
      end
    end

    describe "houses" do
      it "should find properties" do
        @relation.should_receive(:houses).and_return(@relation)
        @relation.should_receive(:where)
        get :houses
      end
    end

    describe "condos" do
      it "should find properties" do
        @relation.should_receive(:condos).and_return(@relation)
        @relation.should_receive(:where)
        get :condos
      end
    end

    describe "apartments" do
      it "should find properties" do
        @relation.should_receive(:apartments).and_return(@relation)
        @relation.should_receive(:where)
        get :apartments
      end
    end

    describe "recent" do
      it "should find properties" do
        @relation.should_receive(:recent).and_return(@relation)
        @relation.should_receive(:where)
        get :recent
      end
    end

  end
end
