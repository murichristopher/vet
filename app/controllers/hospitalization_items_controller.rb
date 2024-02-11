class HospitalizationItemsController < ApplicationController
  before_action :set_hospitalization_item, only: %i[show edit update destroy]

  add_breadcrumb "Internação", :hospitalization_items_path

  # GET /hospitalization_items or /hospitalization_items.json
  def index
    @hospitalization_items = HospitalizationItem.all
  end

  # GET /hospitalization_items/1 or /hospitalization_items/1.json
  def show; end

  # GET /hospitalization_items/new
  def new
    @hospitalization_item = HospitalizationItem.new
  end

  # GET /hospitalization_items/1/edit
  def edit; end

  # POST /hospitalization_items or /hospitalization_items.json
  def create
    @hospitalization_item = HospitalizationItem.new(hospitalization_item_params)

    respond_to do |format|
      if @hospitalization_item.save
        format.html do
          redirect_to hospitalization_item_url(@hospitalization_item),
                      notice: "Hospitalization item was successfully created."
        end
        format.json { render :show, status: :created, location: @hospitalization_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @hospitalization_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hospitalization_items/1 or /hospitalization_items/1.json
  def update
    respond_to do |format|
      if @hospitalization_item.update(hospitalization_item_params)
        format.html do
          redirect_to hospitalization_item_url(@hospitalization_item),
                      notice: "Hospitalization item was successfully updated."
        end
        format.json { render :show, status: :ok, location: @hospitalization_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @hospitalization_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hospitalization_items/1 or /hospitalization_items/1.json
  def destroy
    @hospitalization_item.destroy

    respond_to do |format|
      format.html do
        redirect_to hospitalization_items_url,
                    notice: "Hospitalization item was successfully destroyed."
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_hospitalization_item
    @hospitalization_item = HospitalizationItem.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def hospitalization_item_params
    params.require(:hospitalization_item).permit(:pet_id, :status, :name)
  end
end
