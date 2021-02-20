class ProductSizesController < ApplicationController
    include Pundit
  skip_after_action :verify_authorized, only: [:home, :new, :create]
  before_action :skip_authorization #

  skip_before_action :authenticate_user!, only: [:home, :new, :create]

  def new
    @product_size = Product_Size.new
    authorize @product_size
  end
  
  def create
    @product_size = Product_Size.new(product_params)
    authorize @product_size

    @product_size.user = current_user
    if @product_size.save!
      redirect_to product_path(@product_size)
    else
      render 'new'
    end
  end

  def show
    @product_size = Product_Size.find(params[:id])
    authorize @product_size

  end

  def index
    @product_size = policy_scope(Product)
    @product_size = Product_Size.all
  end

  def edit
    @product_size = Product_Size.find(params[:id])
    authorize @product_size
  end
  
  def update
    @product_size = Product_Size.find(params[:id])
    authorize @product_size
    @product_size.update(product_params)
    redirect_to product_path(@product_size)
  end

  def destroy
    @product_size = Product_Size.find(params[:id])
    @product_size.destroy
    redirect_to root_path
    authorize @product_size
  end
  
  private
  
  def product_size_params
    params.require(:product_size).permit(:size_name, :hip_measurement, :bust_measurement, :waist_measurement, :length_measurement)
  end
end