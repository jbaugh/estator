class PropertiesController < ApplicationController
  before_filter :setup_search


  def new
    @property = Property.new

    respond_to do |format|
      format.html { render }
    end
  end

  def create
    @property = Property.new(params[:property])
    success = @property.save

    respond_to do |format|
      format.html do 
        if success
          flash[:notice] = "You have listed this property!"
          redirect_to property_path(@property)
        else
          flash[:error] = "Failed to list property: #{@property.errors.full_messages.to_sentence}"
          render :new
        end
        
      end

      format.json do 
        render json: {property: @property, success: success }
      end
    end
  end

  def index
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @properties }
    end
  end

  def show
    @property = Property.find(params[:id])

    respond_to do |format|
      format.html { render }
      format.json { render json: @property }
    end
  end

  def rentals
    @properties = @properties.rentals

    respond_to do |format|
      format.html { render :index }
      format.json { render json: @properties }
    end
  end

  def for_sale
    @properties = @properties.for_sale
    
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @properties }
    end
  end

  def houses
    @properties = @properties.houses
    
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @properties }
    end
  end

  def condos
    @properties = @properties.condos
    
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @properties }
    end
  end

  def apartments
    @properties = @properties.apartments
    
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @properties }
    end
  end

  def recent
    @properties = @properties.recent
    
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @properties }
    end
  end

  private

  def setup_search
    # Start with all available properties
    @properties = Property.available
    @search_options = {}

    # Run through each passed param, and call the appropriate scope, building the AR relation

    {
      :beds => :at_least_beds,
      :baths => :at_least_baths,
      :price_min => :more_expensive_than,
      :price_max => :cheaper_than,
      :square_feet_min => :more_sq_ft_than,
      :square_feet_max => :less_sq_ft_than,
      :lot_size_min => :more_lot_size_than,
      :lot_size_max => :less_lot_size_than,
      :year_min => :newer_than,
      :year_max => :older_than,
    }.each do |option, scope|
      if params[option].present?
        # Sets the search options so it can be used to populate the search form
        @search_options[option] = params[option]

        # Dyanmically chains a scope onto the AR relation
        @properties = @properties.send(scope, @search_options[option])
      end
    end

  end
end
