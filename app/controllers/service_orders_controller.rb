class ServiceOrdersController < ApplicationController
  before_action :set_service_order, only: %i[show edit update destroy]

  add_breadcrumb "Comandas", :service_orders_path

  # GET /service_orders or /service_orders.json
  def index
    @service_orders = ServiceOrder.all
  end

  # GET /service_orders/1 or /service_orders/1.json
  def show; end

  # GET /service_orders/new
  def new
    @service_order = ServiceOrder.new

    @service_order.pet_id = params["pet_id"]

    @service_order.customer_id = params["customer_id"]
  end

  # GET /service_orders/1/edit
  def edit; end

  # POST /service_orders or /service_orders.json
  def create
    @service_order = ServiceOrder.new(service_order_params)
    @service_order.price = InventoryItem.find(service_order_params[:inventory_item_id]).price
    respond_to do |format|
      if @service_order.save
        format.html do
          redirect_to service_order_url(@service_order),
                      notice: "Service order was successfully created."
        end
        format.json { render :show, status: :created, location: @service_order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @service_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /service_orders/1 or /service_orders/1.json
  def update
    respond_to do |format|
      if @service_order.update(service_order_params)
        format.html do
          redirect_to service_order_url(@service_order),
                      notice: "Service order was successfully updated."
        end
        format.json { render :show, status: :ok, location: @service_order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @service_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /service_orders/1 or /service_orders/1.json
  def destroy
    @service_order.destroy

    respond_to do |format|
      format.html do
        redirect_to service_orders_url, notice: "Service order was successfully destroyed."
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_service_order
    @service_order = ServiceOrder.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def service_order_params
    params.require(:service_order).permit(:customer_id, :pet_id, :description, :price,
                                          :inventory_item_id)
  end
end
