class WarehousesController < ApplicationController
	before_action :set_warehouse, only: [:show, :update, :edit, :destroy ]
	
	def show;	end

	def new
		@warehouse = Warehouse.new
	end

	def create 
		@warehouse = Warehouse.new(warehouse_params)
		if @warehouse.save()
			flash[:notice] = 'Galpão cadastrado com sucesso!'
			redirect_to root_path
		else
			flash.now[:notice] = 'Galpão não cadastrado!'
			render 'new'
		end	
	end

	def edit; end

	def update
		if @warehouse.update(warehouse_params)
			flash[:notice] = 'Galpão atualizdo com sucesso!'
			redirect_to warehouse_path(@warehouse.id)
		else
			flash.now[:notice] = 'Não foi possível atualizar!'
			render 'edit'
		end	
	end

	def destroy
		@warehouse.destroy
		redirect_to root_path
		flash[:notice] = 'Galpão removido com sucesso!'
	end

	private

	def set_warehouse
		@warehouse = Warehouse.find(params[:id])
	end

	def warehouse_params
		warehouse_params = params.require(:warehouse).permit(:name, :code, :city, :area, 
																     :address, :postal_code, :description)
	end
end