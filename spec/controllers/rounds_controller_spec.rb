require 'rails_helper'

RSpec.describe RoundsController, type: :controller do
  let(:game)          {create(:game)}
  let(:built_round)   {build(:round)}
  let(:invalid_round) {build(:invalid_round)}
  let(:created_round) {create(:round)}

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'saves the new round to the database' do
        expect{post :create, round: attributes_for(:round), game_id: game}.to change{Round.count}.by(1)
      end

      it 'redirects to the new round\'s show page' do
        post :create, round: attributes_for(:round), game_id: game
        expect(response).to redirect_to game_round_path(game, Round.last)
      end
    end

    context 'with invalid attributes' do
      it 'does not save the new round to the database' do
        expect{post :create, round: attributes_for(:invalid_round), game_id: game}.not_to change{Round.count}
      end

      it 'raises/logs an error'
    end
  end

  describe 'GET #show' do
    before(:each) {get :show, id: created_round, game_id: created_round.game}

    it 'assigns the requested round to @round' do
      expect(assigns(:round)).to eq created_round
    end

    it 'renders the show template' do
      expect(response).to render_template :show
    end
  end
end
