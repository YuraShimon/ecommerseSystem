class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]


  # GET /products
  # GET /products.json
  def index
    params[:category] ? @products = Product.category_with(params[:category]) :
    @products = Product.all
    pp params[:amount]
    if params[:amount]
      min,max = params[:amount].split("-").map{|x|x=x.delete("$").to_i}
      pp min
      pp max
      @products.where!("price_sale > ? AND price_sale < ?",min,max)
    end
    if params[:search]
      @search_term = params[:search]
      @products = @products.search_by(@search_term)
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])
    @comments = Comment.where(product_id: @product.id)
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # PRODUCT /products
  # PRODUCT /products.json
  def create
    @product = current_user.products.build(product_params)
    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Ваш продукт створено!' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Продукт успішно змінено!' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Продукт знищено!' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :size, :price_in, :price_out,:price_sale, :product_id, :count, :date_in, :sale, :user_id, :category_list)
    end
end
