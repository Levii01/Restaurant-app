require 'rails_helper'


RSpec.describe PizzasController, type: :controller do
  let(:restaurant) { create :restaurant }
  let(:pizza) { create :pizza, restaurant_id: restaurant.id}
  let(:valid_attributes) { {name: "Damn", price: 32.31, ingredients: "Tomato, Potato", restaurant_id: restaurant.id} }
  let(:invalid_attributes) { {name: nil, price: "five dollars", ingredients: nil } }

  describe "GET #index" do
    subject { get :index, params: { restaurant_id: pizza.restaurant.id } }
    it_behaves_like 'template rendering action', :index

    it "assigns all pizzas as @pizzas" do
      subject
      assert_response :success
      expect(assigns(:pizzas)).to eq([pizza])
    end
  end

  describe "GET #show" do
    subject { get :show, params: { restaurant_id: restaurant.id, id: pizza.id } }
    it_behaves_like 'template rendering action', :show

    it "assigns the requested pizza as @pizza" do
      subject
      expect(assigns(:pizza)).to eq(pizza)
    end
  end

  describe "GET #new" do
    subject { get :new, params: { restaurant_id: restaurant.id } }
    it_behaves_like 'template rendering action', :new

    it "assigns a new pizza as @pizza" do
      subject
      expect(assigns(:pizza)).to be_a_new(Pizza)
    end
  end

  describe "GET #edit" do
    subject { get :edit, params: { restaurant_id: restaurant.id, id: pizza.id} }
    it_behaves_like 'template rendering action', :edit

    it "assigns the requested pizza as @pizza" do
      subject
      expect(assigns(:pizza)).to eq(pizza)
    end
  end

  describe "POST #create" do
    subject { post :create, params: { restaurant_id: restaurant.id, pizza: valid_attributes} }

    context "with valid params" do
    it { is_expected.to redirect_to [Restaurant.last , Pizza.last] }

      it 'flashes info' do
        subject
        expect(flash[:notice]).to eq('Pizza was successfully created.')
      end

      it "creates a new Pizza" do
        expect { subject }.to change(Pizza, :count).by(1)
      end

      it "assigns a newly created pizza as @pizza" do
        subject
        expect(assigns(:pizza)).to be_a(Pizza)
        expect(assigns(:pizza)).to be_persisted
      end

      it "redirects to the created pizza" do
        subject
        expect(response).to redirect_to [Restaurant.last , Pizza.last]
      end
    end

    context "with invalid params" do
      include_context 'record save failure'
      it_behaves_like 'template rendering action', :new

      it "re-renders the 'new' template" do
        post :create, params: { restaurant_id: restaurant.id, pizza: invalid_attributes}
        subject
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    let(:maggy_restaurant) { create :restaurant, name: "Maggyes Gessler Restaurant" }
    let!(:update_pizza) { create :pizza, restaurant_id: maggy_restaurant.id }
    let(:name) { 'Gordon Ramsey Kirchen' }
    let(:price) { 120.84 }
    let(:ingredients) { 'Potato, Tomato' }
    let!(:params) do
      { restaurant_id: maggy_restaurant.id, id: update_pizza.id, pizza: { name: name, price: price, ingredients: ingredients } }
    end
    subject { put :update, params: params }

    context "with valid params" do
      it { is_expected.to redirect_to [maggy_restaurant, update_pizza] }

      it 'flashes info' do
        subject
        expect(flash[:notice]).to eq('Pizza was successfully updated.')
      end

      context 'when update pizza' do
        subject { -> { put :update, params: params } }
        it { is_expected.to change{ update_pizza.reload.name }.to(name) }
        it { is_expected.to change{ update_pizza.reload.price }.to(price) }
        it { is_expected.to change{ update_pizza.reload.ingredients }.to(ingredients) }
      end
    end

    context "with invalid params" do
      include_context 'record save failure'
      it_behaves_like 'template rendering action', :edit

      context 'when update pizza with invalid params' do
        subject { -> { put :update, params: { restaurant_id: restaurant.id, id: pizza.to_param, pizza: invalid_attributes} } }
        it { is_expected.to_not change{ pizza.reload.name } }
        it { is_expected.to_not change{ pizza.reload.price } }
        it { is_expected.to_not change{ pizza.reload.ingredients } }
      end
    end
  end

  describe "DELETE #destroy" do
    let!(:pizza) { create :pizza, restaurant_id: restaurant.id}
    subject { delete :destroy, params: { restaurant_id: restaurant.id, id: pizza.id } }

    it { is_expected.to redirect_to restaurant_pizzas_url }

    it 'flashes info' do
      subject
      expect(flash[:notice]).to eq('Pizza was successfully destroyed.')
    end

    it 'destroys the requested pizza' do
      expect{ subject }.to change(Pizza, :count).by(-1)
    end
  end
end
