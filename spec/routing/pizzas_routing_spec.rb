require "rails_helper"

RSpec.describe PizzasController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/restaurants/1/pizzas").
      to route_to( controller: 'pizzas', action: 'index', restaurant_id: '1' )
    end

    it "routes to #new" do
      expect(:get => "/restaurants/1/pizzas/new").
      to route_to( controller: 'pizzas', action: 'new', restaurant_id: '1' )
    end

    it "routes to #show" do
      expect(:get => "/restaurants/1/pizzas/1").
      to route_to( controller: 'pizzas', action: 'show', restaurant_id: '1' , :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/restaurants/1/pizzas/1/edit").
      to route_to( controller: 'pizzas', action: 'edit', restaurant_id: '1', :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/restaurants/1/pizzas").
      to route_to( controller: 'pizzas', action: 'create', restaurant_id: '1' )
    end

    it "routes to #update via PUT" do
      expect(:put => "/restaurants/1/pizzas/1").
      to route_to( controller: 'pizzas', action: 'update', restaurant_id: '1' , :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/restaurants/1/pizzas/1").
      to route_to( controller: 'pizzas', action: 'update', restaurant_id: '1' , :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/restaurants/1/pizzas/1").
      to route_to( controller: 'pizzas', action: 'destroy', restaurant_id: '1' , :id => "1")
    end

  end
end
