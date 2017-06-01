class Products::ProductsController < ApplicationController

  before_action :authenticate_alex!, except: [:index, :show]

  def index
  	@products = Product.all
  end

  def show
    @product = Product.friendly.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to product_path(@product)
    else
      render 'new'
    end
  end

  def edit
    @product = Product.friendly.find(params[:id])
  end

  def update
    @product = Product.friendly.find(params[:id])
    if @product.update_attributes(product_params)
      redirect_to product_path(@product)
    else
      render 'edit'
    end
  end

  def destroy
    @product = Product.friendly.find(params[:id]).destroy
    redirect_to root_url
  end

  private

    def product_params
      params.require(:product).permit(:title, :description, :mini_description, :element, :base_price, :shipping_price, :total_price, :quantity, :cause, :amount_to_product, :amount_to_cause, :amount_to_company, :size, :color, :image1, :image2, :image3, :slug)
    end

    def authenticate_alex!
      @user = current_user
      redirect_to products_path if @user.username != "alexheil"
    end

end