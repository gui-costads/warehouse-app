class ProductModelsController < ApplicationController
	before_action :set_product_model, only: [:show, :update, :edit]
	before_action :set_suppliers, only: [:new, :create, :update, :edit]

  def index 
		@product_models = ProductModel.all
  end

	def show; end

	def new 
		@product_model = ProductModel.new
	end

	def create 
		@product_model = ProductModel.new(product_model_params)
			
		if @product_model.save()
		redirect_to product_models_path, notice: 'Modelo de produto cadastrado!'
		else
			flash.now[:notice] = 'Modelo de produto nao foi cadastrado!'
			render 'new'
		end
	end
	
	def edit;	end

	def update
		
		if @product_model.update(product_model_params)
	 	redirect_to product_models_path, notice: 'Modelo de produto atualizado com sucesso!'
		else 
			flash.now[:notice] = 'Não foi possivel atualizar Modelo de produto'
			render 'edit'
		end
	end

	private
		def product_model_params 
			product_model_params =  params.require(:product_model).permit(:name, :weight, :height, 
																																		:width, :depth, :sku, :supplier_id)
			end
		def set_product_model
			@product_model = ProductModel.find(params[:id])
		end

		def set_suppliers
			@suppliers = Supplier.all
		end
end