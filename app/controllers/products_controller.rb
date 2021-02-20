class ProductsController < ApplicationController
  include Pundit
  skip_after_action :verify_authorized, only: [:home, :new, :create]
  before_action :skip_authorization #

  skip_before_action :authenticate_user!, only: [:home, :new, :create]

  def new
    @brand = Brand.find(params[:brand_id])
    @product = Product.new
    authorize @product
  end
  
  def create
    @product = Product.new(product_params)
    @brand = Brand.find(params[:brand_id])
    @product.brand = @brand
    authorize @product

    if @product.save!
      # redirect_to new_product_product_size_path(@product)
      redirect_to new_product_product_size_path(@product)
    else
      render 'new'
    end
  end

  def show
    @product = Product.find(params[:id])
    authorize @product

  end

  def index
    @product = policy_scope(Product)
    @product = Product.all
  end

  def edit
    @product = Product.find(params[:id])
    authorize @product
  end
  
  def update
    @product = Product.find(params[:id])
    authorize @product
    @product.update(product_params)
    redirect_to product_path(@product)
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to root_path
    authorize @product
  end
  
  private
  
  def product_params
    params.require(:product).permit(:name, :garment_type, :fabric_type)
  end  
end
