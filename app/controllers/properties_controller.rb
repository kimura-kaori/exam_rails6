class PropertiesController < ApplicationController
  before_action :set_property, only: %i[ show edit update destroy ]

  def index
    @properties = Property.all
  end

  def show
  end

  def new
    @property = Property.new
    2.times do @property.nearest_stations.build
    end
  end

  def edit
  end

  def create
    @property = Property.new(property_params)
    if @property.save
      redirect_to @property, notice: "Property was successfully created."
    else
     render :new, status: :unprocessable_entity
    end
  end

  def update
    if @property.update(property_params)
      redirect_to @property, notice: "Property was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @property.destroy
    redirect_to properties_url, notice: "Property was successfully destroyed."
  end

  private
    def set_property
      @property = Property.find(params[:id])
    end

    def property_params
      params.require(:property).permit(:name, :price, :address, :age, :remarks,
        nearest_stations_attributes:[:id, :route_name, :station_name, :time,])
    end

end
