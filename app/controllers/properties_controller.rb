class PropertiesController < ApplicationController
  before_filter :setup_search
  def index
    @properties = Property.available.where(@search_params)
  end

  def show
    @properties = Property.find(params[:id])
  end

  def rentals
    @properties = Property.available.rentals.where(@search_params)
    render action: :index
  end

  def for_sale
    @properties = Property.available.for_sale.where(@search_params)
    render action: :index
  end

  def houses
    @properties = Property.available.houses.where(@search_params)
    render action: :index
  end

  def condos
    @properties = Property.available.condos.where(@search_params)
    render action: :index
  end

  def apartments
    @properties = Property.available.apartments.where(@search_params)
    render action: :index
  end

  def recent
    @properties = Property.available.recent.where(@search_params)
    render action: :index
  end

  private

  def setup_search
    @search_options = {
      :price_min => params[:price_min],
      :price_max => params[:price_max],
      :beds => params[:beds],
      :baths => params[:baths],
      :square_feet_min => params[:square_feet_min],
      :square_feet_max => params[:square_feet_max],
      :lot_size_min => params[:lot_size_min],
      :lot_size_max => params[:lot_size_max],
      :year_min => params[:year_min],
      :year_max => params[:year_max]
    }

    @search_params = []

    @search_params << "bedrooms > #{@search_options[:beds]}" if @search_options[:beds].present?
    @search_params << "baths > #{@search_options[:baths]}" if @search_options[:baths].present?

    @search_params << "price > #{@search_options[:price_min]}" if @search_options[:price_min].present?
    @search_params << "square_feet > #{@search_options[:square_feet_min]}" if @search_options[:square_feet_min].present?
    @search_params << "lot_size > #{@search_options[:lot_size_min]}" if @search_options[:lot_size_min].present?
    @search_params << "year_built > #{@search_options[:year_min]}" if @search_options[:year_min].present?

    @search_params << "price < #{@search_options[:price_max]}" if @search_options[:price_max].present?
    @search_params << "square_feet < #{@search_options[:square_feet_max]}" if @search_options[:square_feet_max].present?
    @search_params << "lot_size < #{@search_options[:lot_size_max]}" if @search_options[:lot_size_max].present?
    @search_params << "year_built < #{@search_options[:year_max]}" if @search_options[:year_max].present?

    @search_params = @search_params.join(" AND ")
  end
end
