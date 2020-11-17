class VehiclesController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @vehicles = Vehicle.all
  end

  def new
    @vehicle = Vehicle.new
    @models = []
    load_brands
  end

  def edit
    @vehicle = Vehicle.find(params[:id])
    load_brands
    @models = HTTParty.get("http://fipeapi.appspot.com/api/1/carros/veiculos/#{@vehicle.brand}.json").parsed_response
  end

  def create
    Vehicle.create(vehicle_params)
    redirect_to vehicles_path
  end

  def update
    @vehicle = Vehicle.find(params[:id])
 
    if @vehicle.update(vehicle_params)
      redirect_to vehicles_path
    else
      render 'edit'
    end
  end

  private

  def vehicle_params
    params.require(:vehicle).permit(:license_plate, :brand, :model, :year_model, :year_manufacture)
  end

  def load_brands
    @brands = HTTParty.get('http://fipeapi.appspot.com/api/1/carros/marcas.json').parsed_response
  end
end
