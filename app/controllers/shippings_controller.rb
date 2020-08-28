class ShippingsController < ApplicationController
  before_action :set_shipping, only: [:show, :update, :destroy]

  @@bunny_manager = BunnyManager.instance

  # GET /shippings
  def index
    @shippings = Shipping.all

    # pid = Process.fork do
    #   puts "start hello"
    #   sleep 5
    #   puts "end Hello"
    # end
    # Process.wait pid
    @@bunny_manager.find()

    render json: @shippings
  end

  # GET /shippings/1
  def show
    render json: @shipping
  end

  # POST /shippings
  def create
    @shipping = Shipping.new(shipping_params)

    if @shipping.save
      render json: @shipping, status: :created, location: @shipping
    else
      render json: @shipping.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /shippings/1
  def update
    if @shipping.update(shipping_params)
      render json: @shipping
    else
      render json: @shipping.errors, status: :unprocessable_entity
    end
  end

  # DELETE /shippings/1
  def destroy
    @shipping.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shipping
      @shipping = Shipping.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def shipping_params
      params.require(:shipping).permit(:name, :status, :delivery)
    end
end
