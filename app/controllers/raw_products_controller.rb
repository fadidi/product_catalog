class RawProductsController < ApplicationController
  # GET /raw_products
  # GET /raw_products.json
  def index
    @raw_products = RawProduct.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @raw_products }
    end
  end

  # GET /raw_products/1
  # GET /raw_products/1.json
  def show
    @raw_product = RawProduct.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @raw_product }
    end
  end

  # GET /raw_products/new
  # GET /raw_products/new.json
  def new
    @raw_product = RawProduct.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @raw_product }
    end
  end

  # GET /raw_products/1/edit
  def edit
    @raw_product = RawProduct.find(params[:id])
  end

  # POST /raw_products
  # POST /raw_products.json
  def create
    @raw_product = RawProduct.new(params[:raw_product])

    respond_to do |format|
      if @raw_product.save
        format.html { redirect_to @raw_product, notice: 'Raw product was successfully created.' }
        format.json { render json: @raw_product, status: :created, location: @raw_product }
      else
        format.html { render action: "new" }
        format.json { render json: @raw_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /raw_products/1
  # PUT /raw_products/1.json
  def update
    @raw_product = RawProduct.find(params[:id])

    respond_to do |format|
      if @raw_product.update_attributes(params[:raw_product])
        format.html { redirect_to @raw_product, notice: 'Raw product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @raw_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /raw_products/1
  # DELETE /raw_products/1.json
  def destroy
    @raw_product = RawProduct.find(params[:id])
    @raw_product.destroy

    respond_to do |format|
      format.html { redirect_to raw_products_url }
      format.json { head :no_content }
    end
  end
end
