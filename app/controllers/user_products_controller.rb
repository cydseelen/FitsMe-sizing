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

private

def user_product_params
    params.require(:user_product).permit(:product_size_id, :customer_datum_id)
  end

end
