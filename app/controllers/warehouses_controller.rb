class WarehousesController < ApplicationController
    def show
    	@warehouse = Warehouse.find(params[:id])
    end

    def new
			@warehouse = Warehouse.new
    end

		def create 
			warehouse_params = params.require(:warehouse).permit(:name, :code, :city, :area, :address, :cep, :description)
			new_warehouse = Warehouse.new(warehouse_params)
			new_warehouse.save()

			flash[:notice] = "Galpão cadastrado com sucesso!"
			redirect_to root_path
		end
end