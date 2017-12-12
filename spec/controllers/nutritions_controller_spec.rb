require 'rails_helper'

describe NutritionsController, type: :controller do    
  describe 'get index' do
    it 'should render the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end
  describe 'get show' do
    let!(:info) {Nutrition.create}
    before(:each) do
      get :show, id: info.id
    end
    it 'should find the nutrition' do
      expect(assigns(:nutrition)).to eql(info)
    end
    it 'should render the show template' do
      expect(response).to render_template('show')
    end
  end
  describe 'get new' do
    it 'should render the new template' do
      get :new
      expect(response).to render_template('new')
    end
  end
  describe 'POST #create' do
    before :each do
      @id1 = '1'
      @nutri1 = double('nutri1')
    end
    it 'redirects to the nutrition page' do
      post :create, nutrition: FactoryBot.attributes_for(:nutrition)
      expect(response).to redirect_to('/nutritions')
    end
  end
  describe 'get edit' do
    let!(:info) {Nutrition.create}
    before do
      get :edit, id: info.id
    end
    it 'should find the nutrition' do
      expect(assigns(:nutrition)).to eql(info)
    end
    it 'should render the edit template' do
      expect(response).to render_template('edit')
    end
  end
  describe 'put update' do
    let!(:info) {Nutrition.create}
    before(:each) do
      put :update, id: info.id, nutrition: FactoryBot.attributes_for(:nutrition, height: 0)
    end
    it 'updates the nutritions' do
      info.reload
      expect(info.height).to eql(0)
    end
  end
  describe 'destroy' do
    let!(:info) { FactoryBot.create(:nutrition) }
    it 'destroys the calories' do
      expect { delete :destroy, id: info.id
      }.to change(Nutrition, :count).by(-1)
    end
    it 'redirects to the nutrition page' do
      delete :destroy, id: info.id
      expect(response).to redirect_to('/nutritions')
    end
end
end