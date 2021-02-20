class BrandsController < ApplicationController
    include Pundit
    skip_after_action :verify_authorized, only: [:home, :new, :create]
    before_action :skip_authorization

    skip_before_action :authenticate_user!, only: [:home, :new, :destroy, :show, :index]

    def home
    end
    
    def new
      @brand = Brand.new
      authorize @brand
    end

    def create
      @brand = Brand.new(brand_params)
      authorize @brand

      @brand.user = current_user
      if @brand.save
        redirect_to new_brand_product_path(@brand)
      
      else
        render 'new'
      end
    end

    def show
      @brand = Brand.find(params[:id])
      authorize @brand

    end
  
    def index
      @brands = policy_scope(Brand)
    end

    def destroy
        @brand = Brand.find(params[:id])
        @brand.destroy
        redirect_to root_path
        authorize @brand
    end

    private

    def brand_params
      params.require(:brand).permit(:name)
    end
end
