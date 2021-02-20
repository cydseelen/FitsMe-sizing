class UserProductsController < ApplicationController

  before_action :authenticate_user!
  include Pundit
  # Pundit: white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  def show
    @user_product = UserProduct.find(params[:customer_datum_id])
    authorize @user_product
  end

private

def user_product_params
    params.require(:user_product).permit(:product_size_id, :customer_datum_id)
  end

end
