class UserProductsController < ApplicationController

  before_action :authenticate_user!, except: :create
  #include Pundit
  # Pundit: white-list approach.
  #after_action :verify_authorized, except: :index, unless: :skip_pundit?
  #after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

skip_before_action :verify_authenticity_token, only: :create
  def show
    @customer_datum = CustomerDatum.find(params[:id])
    @product_sizes = @customer_datum.product_sizes

    authorize @customer_datum
    authorize @product_sizes
  end

  def create
    customer_datum = CustomerDatum.find(params[:customer_datum])

    product = Product.find(params[:product])

    #authorize @customer_datum
    #authorize @product

    winning_size = []
    @product.product_sizes.each do |product_size|
      size = convert_size_to_value

      if product.garment == "shirt" || "jacket" || "sweater"
        if product_size.bust_range.include?(customer_datum.bust_measurement_customer)
          winning_size << size
        end
        if product_size.waist_range.include?(customer_datum.waist_measurement_customer)
          winning_size << size
        end
      end

      if product.garment == "pants"
        if product_size.hip_range.include?(customer_datum.hip_measurement_customer)
          winning_size << size
        end
        if product_size.length_range.include?(customer_datum.length_measurement_customer)
          winning_size << size
        end
      end

      if product.garment == "skirt" || "dress"
        if product_size.hip_range.include?(customer_datum.hip_measurement_customer)
          winning_size << size
        end
        if product_size.waist_range.include?(customer_datum.waist_measurement_customer)
          winning_size << size
        end
      end
    end
    value_size = winning_size.max
    size = convert_back_to_name(value_size)

    product = ProductSize.where(size_name: self.size)
    user_product = UserProduct.new(product_size: product, customer_datum: customer_datum)
    user_product.save
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
