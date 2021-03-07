class UserProductsController < ApplicationController

  #before_action :authenticate_user!
  #include Pundit
  # Pundit: white-list approach.
  #after_action :verify_authorized, except: :index, unless: :skip_pundit?
  #after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  def show
    @customer_datum = CustomerDatum.find(params[:id])
    @product_sizes = @customer_datum.product_sizes

    authorize @customer_datum
    authorize @product_sizes
  end

  def create
    @customer_datum = CustomerDatum.find(params[:id])
    @product = @customer_datum.product

    authorize @customer_datum
    authorize @product

    winning_size = []
    @product.product_size.convert_size_to_value

    if product.garment == "shirt" || "jacket" || "sweater"
        if product_size.bust_range.include?(customer_datum.bust_measurement_customer)
          winning_size << size
        end
        if product_size.waist_range.include?(customer_datum.waist_measurement_customer)
          winning_size << size
        end
        value_size = winning_size.max
        size = value_size.convert_back_to_name

    end

    if product.garment == "pants"
        if product_size.hip_range.include?(customer_datum.hip_measurement_customer)
          winning_size << size
        end
        if product_size.length_range.include?(customer_datum.length_measurement_customer)
          winning_size << size
        end
        value_size = winning_size.max
        size = value_size.convert_back_to_name
    end

    if product.garment == "skirt" || "dress"
        if product_size.hip_range.include?(customer_datum.hip_measurement_customer)
          winning_size << size
        end
        if product_size.waist_range.include?(customer_datum.waist_measurement_customer)
          winning_size << size
        end
        value_size = winning_size.max
        size = value_size.convert_back_to_name
    end

    product = ProductSize.where(size_name: self.size)
    product_size = Userproduct.product_size
    customer = Userproduct.customer
  end


private

def user_product_params
  params.require(:user_product).permit(:product_size_id, :customer_datum_id)
end

def convert_size_to_value
  if product_size.size_name == "extra small"
    size = 1
  elsif
    product_size.size_name == "small"
    size = 2
  elsif
    product_size.size_name == "medium"
    size = 3
  elsif
    product_size.size_name == "large"
    size = 4
  elsif
    product_size.size_name == "extra large"
    size = 5
  end

  def convert_back_to_name
  if product_size.size_name == 1
    size_name = "extra small"
  elsif
    product_size.size_name == 2
    size_name = "extra small"
  elsif
    product_size.size_name == 3
    size_name = "extra small"
  elsif
    product_size.size_name == 4
    size_name = "extra small"
  elsif
    product_size.size_name == 5
    size_name = "extra small"
  end
end
end
end
