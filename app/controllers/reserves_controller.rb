class ReservesController < ApplicationController
  def index
    @reserves = Reserve.where(document: params[:document])
  end

  def new
    @reserve = Reserve.new
    @vehicle = Vehicle.find(params[:vehicle_id])
  end

  def create
    Reserve.create(reserve_params)
    flash[:notice] = 'Veiculo reservado com sucesso'
    redirect_to vehicles_path
  end

  private

  def reserve_params
    params.require(:reserve).permit(:vehicle_id, :cpf)
  end
end