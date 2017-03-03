require 'rails_helper'

RSpec.describe RestaurantsController, type: :controller do
  let(:restaurant) { create :restaurant }
  let(:invalid_attributes) { {name: nil, address: nil} }
  let(:valid_attributes) { build(:restaurant).attributes }


  describe "GET #index" do
    subject { get :index }

    it_behaves_like 'template rendering action', :index
    it "assigns all pizzas as @pizzas" do
      get :index
      expect(assigns(:restaurants)).to eq([restaurant])
    end
  end

  describe "GET #show" do
    subject { get :show, params: { id: restaurant.id } }
    it_behaves_like 'template rendering action', :show

    it "assigns the requested restaurant as @restaurant" do
      get :show, params: { id: restaurant.id }
      expect(assigns(:restaurant)).to eq(restaurant)
    end
  end

  describe "GET #new" do
    subject { get :new }
    it_behaves_like 'template rendering action', :new

    it "assigns a new restaurant as @restaurant" do
      get :new, params: {}
      expect(assigns(:restaurant)).to be_a_new(Restaurant)
    end
  end

  describe "GET #edit" do
    let(:restaurant) { create :restaurant }
    subject { get :edit, params: { id: restaurant.id } }

    it_behaves_like 'template rendering action', :edit
  end

  describe "POST #create" do
    let!(:params) { { restaurant: valid_attributes } }
    subject { post :create, params: params }
    context "with valid params" do
      it { is_expected.to redirect_to restaurant_path(Restaurant.last) }

      it 'flashes info' do
        subject
        expect(flash[:notice]).to eq('Restaurant was successfully created.')
      end

      it 'creates restaurant' do
        expect{ subject }.to change(Restaurant, :count).by(1)
      end

      it "assigns a newly created restaurant as @restaurant" do
        post :create, params: {restaurant: valid_attributes}
        expect(assigns(:restaurant)).to be_a(Restaurant)
        expect(assigns(:restaurant)).to be_persisted
      end
    end

    context "with invalid params" do
      include_context 'record save failure'
      it_behaves_like 'template rendering action', :new

      it "assigns a newly created but unsaved restaurant as @restaurant" do
        post :create, params: {restaurant: invalid_attributes }
        expect(assigns(:restaurant)).to be_a_new(Restaurant)
      end

      it "re-renders the 'new' template" do
        post :create, params: {restaurant: invalid_attributes }
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    let!(:restaurant) { create :restaurant, name: 'Avanti', address: 'Różana 33',
      opening_time: '1000-01-01 10:40:16', closing_time: '1972-02-03 12:40:16'}
    let(:name) { 'Walter' }
    let(:address) { 'White 44' }
    let(:opening_time) { '2000-01-01 08:30:16 UTC' }
    let(:closing_time) { '2000-01-01 20:00:16 UTC' }
    let(:opening_day) { 'Tuesday' }
    let(:closing_day) { 'Saturday' }
    let!(:params) do
      { id: restaurant.id, restaurant: { name: name, address: address, opening_time: opening_time, closing_time: closing_time,
         opening_day: opening_day, closing_day: closing_day} }
    end
    subject { put :update, params: params }

    context "with valid params" do
      it { is_expected.to redirect_to restaurant }

      it 'flashes info' do
        subject
        expect(flash[:notice]).to eq('Restaurant was successfully updated.')
      end

      context 'when updates restaurant with new attribute' do
        subject { -> { put :update, params: params } }
        it { is_expected.to change{ restaurant.reload.name }.to(name) }
        it { is_expected.to change{ restaurant.reload.address }.to(address) }
        it { is_expected.to change{ restaurant.reload.opening_time.utc.to_s }.to( opening_time ) }
        it { is_expected.to change{ restaurant.reload.closing_time.utc.to_s }.to( closing_time ) }
        it { is_expected.to change{ restaurant.reload.opening_day }.to( opening_day ) }
        it { is_expected.to change{ restaurant.reload.closing_day }.to( closing_day ) }
      end
    end

    context "with invalid params" do
      include_context 'record save failure'

      it_behaves_like 'template rendering action', :edit
      it "assigns the restaurant as @restaurant" do
        put :update, params: {id: restaurant.to_param, restaurant: invalid_attributes}
        expect(assigns(:restaurant)).to eq(restaurant)
      end
    end
  end

  describe "DELETE #destroy" do
    let!(:restaurant) { create :restaurant }
    subject { delete :destroy, params: { id: restaurant.id } }

    it { is_expected.to redirect_to restaurants_path }

    it 'flashes info' do
      subject
      expect(flash[:notice]).to eq('Restaurant was successfully destroyed.')
    end

    it 'destroys restaurant' do
      expect{ subject }.to change(Restaurant, :count).by(-1)
    end
  end
end
