class PropertiesController < ApplicationController
  before_action :set_property, only: %i[ show edit update destroy ]

  def index
    @properties = Property.all
  end

  def show
  end

  def new
    @property = Property.new
  end

  def edit
  end

  def create
    @property = Property.new(property_params)

    respond_to
      if @property.save
        redirect_to @property, notice: "Property was successfully created."
      else
         render :new, status: :unprocessable_entity
      end
    end
  end

  def update
    respond_to do |format|
      if @property.update(property_params)
        redirect_to @property, notice: "Property was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
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
      params.require(:property).permit(:name, :price, :address, :age, :remarks)
    end
end
