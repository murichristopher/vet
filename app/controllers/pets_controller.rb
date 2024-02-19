class PetsController < ApplicationController
  before_action :set_pet, only: %i[show edit update destroy]

  add_breadcrumb "Pets", :pets_path

  # GET /pets or /pets.json
  def index
    @pets = Pet.active.search(params[:search]) if params[:search].present?
    @pets ||= Pet.all.active

    # @pets = @pets.page(params[:page])
  end

  # GET /pets/1 or /pets/1.json
  def show
    add_breadcrumb @pet.name
  end

  def new
    add_breadcrumb "Novo pet", :new_pet_path

    @pet = Pet.new
  end

  # GET /pets/1/edit
  def edit; end

  # POST /pets or /pets.json
  def create
    @pet = Pet.new(pet_params)

    respond_to do |format|
      if @pet.save
        format.html { redirect_to pets_path, notice: "Pet #{@pet.name} foi criado!" }
        format.json { render :show, status: :created, location: @pet }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pets/1 or /pets/1.json
  def update
    respond_to do |format|
      if @pet.update(pet_params)
        format.html { redirect_to pet_url(@pet), notice: "Petfoi atualizado!" }
        format.json { render :show, status: :ok, location: @pet }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pets/1 or /pets/1.json
  def destroy
    @pet.update(status: :inactive)

    respond_to do |format|
      format.html { redirect_to pets_url, notice: "Pet foi removido!" }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_pet
    @pet = Pet.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def pet_params
    params.require(:pet).permit(:name, :customer_id, :weight, :race, :image)
  end
end
