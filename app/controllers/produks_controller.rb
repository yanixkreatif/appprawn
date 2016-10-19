class ProduksController < ApplicationController
  before_action :set_produk, only: [:show, :edit, :update, :destroy]

  # GET /produks
  # GET /produks.json
  def index
    @produks = Produk.all

     if params[:first_button]
      pdf = ProdukPdf.new(@produks)
      send_data pdf.render, filename: 'produk.pdf', type: 'application/pdf',disposition: 'inline'
     end

  end

  # GET /produks/1
  # GET /produks/1.json
  def show
  end

  # GET /produks/new
  def new
    @produk = Produk.new
  end

  # GET /produks/1/edit
  def edit
  end

  # POST /produks
  # POST /produks.json
  def create
    @produk = Produk.new(produk_params)

    respond_to do |format|
      if @produk.save
        format.html { redirect_to @produk, notice: 'Produk was successfully created.' }
        format.json { render :show, status: :created, location: @produk }
      else
        format.html { render :new }
        format.json { render json: @produk.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /produks/1
  # PATCH/PUT /produks/1.json
  def update
    respond_to do |format|
      if @produk.update(produk_params)
        format.html { redirect_to @produk, notice: 'Produk was successfully updated.' }
        format.json { render :show, status: :ok, location: @produk }
      else
        format.html { render :edit }
        format.json { render json: @produk.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /produks/1
  # DELETE /produks/1.json
  def destroy
    @produk.destroy
    respond_to do |format|
      format.html { redirect_to produks_url, notice: 'Produk was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_produk
      @produk = Produk.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def produk_params
      params.require(:produk).permit(:nama, :stok)
    end
end
