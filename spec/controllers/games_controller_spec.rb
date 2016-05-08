require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  let(:built_game)   {build(:game)}
  let(:created_game) {create(:game)}

  describe 'GET #new' do
    before(:each) {get :new}

    it 'assigns a new game to @game' do
      expect(assigns(:game)).to be_a Game
      expect(assigns(:game).persisted?).to be false
    end

    it 'renders the new template' do
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'saves the new game to the database' do
        expect{post :create, game: attributes_for(:game)}.to change{Game.count}.by(1)
      end

      it 'redirects to the new game\'s show page' do
        post :create, game: attributes_for(:game)
        expect(response).to redirect_to Game.last
      end
    end

    context 'with invalid attributes' do
      it 'does not save the new game to the database' do
        expect{post :create, game: attributes_for(:invalid_game)}.not_to change{Game.count}
      end

      it 're-renders the new template' do
        post :create, game: attributes_for(:invalid_game)
        expect(response).to render_template :new
      end
    end
  end

  describe 'GET #show' do
    before(:each) {get :show, id: created_game}

    it 'assigns the requested game to @game' do
      expect(assigns(:game)).to eq created_game
    end

    it 'renders the show template' do
      expect(response).to render_template :show
    end
  end
end
