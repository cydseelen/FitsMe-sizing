class CustomerDataController < ApplicationController
  def new
    @customer_datum = CustomerDatum.new
  end

  def create
    @customer_datum = CustomerDatum.find(params[:customer_datum_id])

    @customer_datum.save

    #authorize @customer_datum
  end

  private

  def customer_data_params
    params.require(:customer_datum).permit(:age, :height, :weight, :body_shape)
  end
end
