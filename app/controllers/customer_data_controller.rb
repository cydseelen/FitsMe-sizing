class CustomerDataController < ApplicationController
  before_action :authenticate_user!
  include Pundit
  # Pundit: white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  def new
    @customer_datum = CustomerDatum.new
    authorize @customer_datum
  end

  def create
    @customer_datum = CustomerDatum.new(customer_data_params)
    @customer_datum.user = current_user
    @customer_datum.save

    authorize @customer_datum

    redirect_to user_product_path(@customer_datum)
  end

  private

  def customer_data_params
    params.require(:customer_datum).permit(:age, :height, :weight, :body_shape, :fit_preference)
  end

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
