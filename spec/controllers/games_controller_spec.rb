require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  let(:game) {build(:game)}

  describe 'GET #new' do
    before(:each) {get :new, game: game}

    it 'assigns a new game to @game' do
    end

    it 'renders the new template' do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'saves the new game to the database' do
      end

      it 'redirects to the game show page' do
        post :create, game: game
        expect(response).to redirect_to game
      end
    end

    context 'with invalid attributes' do
      it 'does not save the new game to the database' do
      end

      it 're-renders the new template' do
      end
    end
  end

  describe 'GET #show' do
    it 'assigns the requested game to @game' do
    end

    it 'renders the show template' do
      # get :show, id: 
    end
  end
end
