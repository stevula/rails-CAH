require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  let(:game)         {build(:game)}
  let(:invalid_game) {build(:invalid_game)}

  describe 'GET #new' do
    before(:each) {get :new, game: game}

    it 'assigns a new game to @game'

    it 'renders the new template' do
      get :new
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
    it 'assigns the requested game to @game'

    it 'renders the show template'
  end
end
