class PizzasController < ApplicationController
  before_action :get_restaurant
  before_action :set_pizza, only: [:show, :edit, :update, :destroy]

  def get_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def index
    # binding.pry
    @pizzas = @restaurant.pizzas
  end

  def show
  end

  def new
    @pizza = Pizza.new
  end

  def edit
  end

  def create
    @pizza = @restaurant.pizzas.new(pizza_params)

    respond_to do |format|
      if @pizza.save
        format.html { redirect_to [@restaurant, @pizza], notice: 'Pizza was successfully created.' }
        format.json { render :show, status: :created, location: [@restaurant, @pizza] }
      else
        format.html { render :new }
        format.json { render json: @pizza.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @pizza.update(pizza_params)
        format.html { redirect_to [@restaurant, @pizza], notice: 'Pizza was successfully updated.' }
        format.json { render :show, status: :ok, location: [@restaurant, @pizza] }
      else
        format.html { render :edit }
        format.json { render json: @pizza.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @pizza.destroy
    respond_to do |format|
      format.html { redirect_to restaurant_pizzas_url, notice: 'Pizza was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_pizza
      @pizza = @restaurant.pizzas.find(params[:id])
    end

    def pizza_params
      params.require(:pizza).permit(:name, :price, :ingredients, :restaurant_id)
    end
end
