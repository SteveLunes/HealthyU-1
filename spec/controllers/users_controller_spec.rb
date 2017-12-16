require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
    it 'should render the new template' do
      get :new
      expect(response).to render_template('new')
    end
  end
  describe 'get index' do
    it 'should render the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end
  describe 'get show' do
    let!(:info) {User.create}
    before(:each) do
      get :show, id: info.id
    end
    it 'should find the user' do
      expect(assigns(:user)).to eql(info)
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
      @user1 = double('user1')
    end
    it 'redirects to the users page' do
      post :create, user: FactoryBot.attributes_for(:user)
      expect(response).to redirect_to('/users/1')
    end
  end
  # describe 'get edit' do
  #   let!(:info) {User.create}
  #   before do
  #     get :edit, id: info.id
  #   end
  #   it 'should find the user' do
  #     expect(assigns(:user)).to eql(info)
  #   end
  #   it 'should render the edit template' do
  #     expect(response).to render_template('edit')
  #   end
  # end
   describe 'destroy' do
     let!(:info) { FactoryBot.create(:user) }
     it 'destroys the user' do
       expect { delete :destroy, id: info.id
       }.to change(User, :count).by(-1)
     end
     it 'redirects to the users page' do
       delete :destroy, id: info.id
       expect(response).to redirect_to('/users')
     end
   end
end  
