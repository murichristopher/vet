class CustomersController < ApplicationController
  before_action :set_customer, only: %i[show edit update destroy]
  add_breadcrumb "Tutores", :customers_path


  # GET /customers or /customers.json
  def index
    @customers = Customer.all
  end

  # GET /customers/1 or /customers/1.json
  def show
    add_breadcrumb "Tutor: #{@customer.full_name}"

    @logo = "#{Rails.root}/app/assets/images/hospitalvet2.png"
    pdf = Prawn::Document.new
    pdf.text("Prawn Rocks")
    pdf.render_file('prawn.pdf')

    @termos = [
      'Termo 1',
      'Termo 2',
      'Termo 3'
    ]

    respond_to do |format|
      format.html
      format.pdf { render pdf: 'termos' }
    end
  end

  # GET /customers/new
  def new
    add_breadcrumb "Novo tutor", :new_customer_path

    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit; end

  # POST /customers or /customers.json
  def create
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        format.html do
          redirect_to customer_url(@customer), notice: "Customer was successfully created."
        end
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1 or /customers/1.json
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html do
          redirect_to customer_url(@customer), notice: "Customer was successfully updated."
        end
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1 or /customers/1.json
  def destroy
    @customer.destroy

    respond_to do |format|
      format.html { redirect_to customers_url, notice: "Customer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_customer
    @customer = Customer.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def customer_params
    params.require(:customer).permit(:full_name, :registry_code, :identification_code, :zip_code,
                                     :phone_number)
  end
end
