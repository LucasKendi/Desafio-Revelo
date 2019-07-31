require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "GET requests" do
    Post.new(title: 'Cartões de crédito', text: 'Texto sobre cartões').save

    it 'ensures index loads' do
      get '/'
      expect(response).to render_template(:index)
    end

    it 'ensures new loads' do
      get '/new'
      expect(response).to render_template(:new)
    end

    it 'ensures show loads' do
      get '/cartoes-de-credito'
      expect(response).to render_template(:show)
    end

    it 'ensures edit loads' do
      get '/cartoes-de-credito/edit'
      expect(response).to render_template(:edit)
    end
  end

  describe "POST requests" do
    it 'ensures create works' do
      post '/', :params => {:post => {title: 'Cartões de cŕedito', text: 'Teste'} }
      expect(response).to redirect_to('/cartoes-de-credito')
    end

    it 'ensures creation fail reloads' do
      post '/', :params => {:post => {title: '', text: ''} }
      expect(response).to render_template(:new)
    end

    it 'ensures update works' do
      Post.new(title: 'Titulo antigo', text: 'Texto antigo').save

      put '/titulo-antigo', :params => {:post => {title: 'Titulo novo', text: 'Texto novo'}}
      expect(response).to redirect_to('/titulo-novo')
    end

    it 'ensures update fails reloads' do
      Post.new(title: 'Titulo antigo', text: 'Texto antigo').save

      put '/titulo-antigo', :params => {:post => {title: '', text: ''}}
      expect(response).to render_template(:edit)
    end

    it 'ensures delete works' do
      Post.new(title: 'To be deleted', text: 'Destroyed').save
      get '/to-be-deleted'
      expect(response).to render_template(:show)

      delete '/to-be-deleted'
      get '/to-be-deleted'
      expect(response).to have_http_status(:not_found)

    end
  end
end
