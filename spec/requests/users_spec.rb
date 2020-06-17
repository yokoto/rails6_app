# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'UsersController', type: :request do
  describe 'GET #index' do
    it 'Successful display of users#index' do
      get users_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET #new' do
    it 'Successful display of users#new' do
      get new_user_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST #create' do
    context 'Successful create user' do
      let(:valid_params) { FactoryBot.attributes_for(:user) }
      it 'request and redirect' do
        post users_path, params: { user: valid_params }
        expect(response).to have_http_status(302)
        expect(response).to redirect_to User.last
      end

      it 'user registered' do
        expect do
          post users_path, params: { user: valid_params }
        end.to change(User, :count).by(1)
      end
    end

    context 'Failed create user' do
      let(:invalid_params) { FactoryBot.attributes_for(:user, name: '') }
      it 'request and error_message' do
        post users_path, params: { user: invalid_params }
        expect(response).to have_http_status(200)
        expect(response.body).to include '入力内容を確認してください。'
      end

      it 'not user registered' do
        expect do
          post users_path, params: { user: invalid_params }
        end.to_not change(User, :count)
      end
    end
  end

  describe 'GET #show' do
    let(:user) { create(:user) }
    it 'Successful display of users#show' do
      get users_path(user.id)
      expect(response).to have_http_status(200)
    end
  end
end
