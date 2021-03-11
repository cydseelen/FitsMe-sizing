class UserProductsController < ApplicationController

  before_action :authenticate_user!, except: [:create, :show]
  #after_action :skip_pundit?, only: [:create]
  include Pundit
  #Pundit: white-list approach.
  skip_after_action :verify_authorized, except: :index, unless: :skip_pundit?
  skip_after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

skip_before_action :verify_authenticity_token, only: :create

  def show
    #@customer_datum = CustomerDatum.find(params[:id])
    #@product_sizes = @customer_datum.product_sizes
    @user_product = UserProduct.find(params[:id])
  end

  def create
    customer_datum = CustomerDatum.find(params[:customer_datum])
    @product = Product.find_by(name: "Navy Blazer") #this is where you have to add API logic(passed in the simple_form)

    winning_size = []
    @product.product_sizes.each do |product_size|
      #size = convert_size_to_value

      if @product.garment_type == "shirt" || @product.garment_type == "jacket" || @product.garment_type == "sweater"
        if product_size.bust_range.include?(customer_datum.bust_measurement_customer)
          winning_size << product_size.size_name
        end
        if product_size.waist_range.include?(customer_datum.waist_measurement_customer)
          winning_size << product_size.size_name
        end
      end

      if @product.garment_type == "pants"
        if product_size.hip_range.include?(customer_datum.hip_measurement_customer)
          winning_size << product_size.size_name
        end
        if product_size.length_range.include?(customer_datum.length_measurement_customer)
          winning_size << product_size.size_name
        end
      end

      if @product.garment_type == "skirt" || @product.garment_type == "dress"
        if product_size.hip_range.include?(customer_datum.hip_measurement_customer)
          winning_size << product_size.size_name
        end
        if product_size.waist_range.include?(customer_datum.waist_measurement_customer)
          winning_size << product_size.size_name
        end
      end
    end
    value_size = (["extra small", "small", "medium", "large", "extra large"] & winning_size).last
    #size = convert_back_to_name(value_size)
    product_size = ProductSize.find_by(size_name: value_size)
    @user_product = UserProduct.new(product_size: product_size, customer_datum: customer_datum)
    @user_product.save

  end


  private

  def user_product_params
    params.require(:user_product).permit(:product_size_id, :customer_datum_id)
  end

  def convert_size_to_value
    if product_size.size_name == "extra small"
      1
    elsif product_size.size_name == "small"
      2
    elsif product_size.size_name == "medium"
      3
    elsif product_size.size_name == "large"
      4
    elsif product_size.size_name == "extra large"
      5
    end
  end

  def convert_back_to_name(value_size)
    if product_size.size_name == 1
      "extra small"
    elsif product_size.size_name == 2
      "small"
    elsif product_size.size_name == 3
      "medium"
    elsif product_size.size_name == 4
      "large"
    elsif product_size.size_name == 5
      "extra large"
    end
  end

end
