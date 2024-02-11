class ServiceQueueItemsController < ApplicationController
  before_action :set_service_queue_item, only: %i[show edit update destroy]

  add_breadcrumb "Esteira", :service_order_service_queue_items_path

  # GET /service_queue_items or /service_queue_items.json
  def index
    @service_queue_items = ServiceQueueItem.all.order(created_at: :desc)
  end

  # GET /service_queue_items/1 or /service_queue_items/1.json
  def show; end

  # GET /service_queue_items/new
  def new
    @service_order = ServiceOrder.find(params[:service_order_id]) # Assuming you have this ID passed in
    @service_queue_item = ServiceQueueItem.new
  end

  # GET /service_queue_items/1/edit
  def edit; end

  # POST /service_queue_items or /service_queue_items.json
  def create
    @service_queue_item = ServiceQueueItem.new(service_queue_item_params)

    respond_to do |format|
      if @service_queue_item.save
        format.html do
          redirect_to service_order_service_queue_items_path(@service_queue_item),
                      notice: "Service queue item was successfully created."
        end
        format.json { render :show, status: :created, location: @service_queue_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @service_queue_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /service_queue_items/1 or /service_queue_items/1.json
  def update
    respond_to do |format|
      if @service_queue_item.update(service_queue_item_params)
        format.html do
          redirect_to service_order_service_queue_item_path(@service_order, @service_queue_item)
        end
        format.json { render :show, status: :ok, location: @service_queue_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @service_queue_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /service_queue_items/1 or /service_queue_items/1.json
  def destroy
    @service_queue_item.destroy

    respond_to do |format|
      format.html do
        redirect_to service_queue_items_url,
                    notice: "Service queue item was successfully destroyed."
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_service_queue_item
    @service_queue_item = ServiceQueueItem.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def service_queue_item_params
    params.require(:service_queue_item).permit(:customer_id, :pet_id, :queue_name, :status,
                                               :urgency)
  end
end
