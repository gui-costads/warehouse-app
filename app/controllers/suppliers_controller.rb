class SuppliersController < ApplicationController
	before_action :set_supplier, only: [:show, :update, :edit ]

  def index 
		@suppliers = Supplier.all
	end

	def show;	end

	def new
		@supplier = Supplier.new
	end

	def create
		@supplier = Supplier.new(supplier_params)
		if @supplier.save()
			redirect_to suppliers_path, notice: 'Fornecedor cadastrado com sucesso!'
		else
			flash.now[:notice] = 'Fornecedor não cadastrado!'
			render 'new'
		end
	end
	
	def edit; end

	def update
		if @supplier.update(supplier_params)
			redirect_to supplier_path(@supplier.id), notice: 'Fornecedor atualizado com sucesso!'
		else
			flash.now[:notice] = "Não foi possível atualizar Fornecedor!"
			render 'edit'
		end
	end

	private

		def set_supplier
			@supplier = Supplier.find(params[:id])
		end

		def supplier_params
			supplier_params = params.require(:supplier).permit(:trade_name, :company_name, :registration_number,
															  	 :city, :state,	:address, :email, :phone_number)
		end
	end

