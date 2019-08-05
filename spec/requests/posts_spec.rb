require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "GET requests" do
    Post.new(title: 'Cartões de crédito', text: 'Texto sobre cartões').save

    it 'loads index' do
      get(posts_path)
      expect(response).to render_template(:index)
    end

    it 'loads show' do
      get '/cartoes-de-credito'
      expect(response).to render_template(:show)
    end

    it 'will not load if post doesnt exists' do
      get '/non-existing-post'
      expect(response).to have_http_status(:not_found)
    end

    it 'loads edit' do
      get '/cartoes-de-credito/edit'
      expect(response).to render_template(:edit)
    end

    it 'will not edit if post doesnt exists' do
      get '/non-existing-post/edit'
      expect(response).to have_http_status(:not_found)
    end

  end

  describe "POST requests" do
    it 'ensures create works' do
      post '/', :params => {:post => {title: 'Cartoes de credito', text: 'Teste'} }, xhr: true
      get '/cartoes-de-credito'
      expect(response).to have_http_status(:ok)
    end

    it 'ensures create updates timeline' do
      post '/', :params => {:post => {title: 'Cartoes de credito', text: 'Teste'} }, xhr: true
      expect(response).to render_template('_post')
      expect(response.body).to include 'Cartoes de credito'
    end

    it 'ensures creation fail respond with errors' do
      post '/', :params => {:post => {title: '', text: ''} }, xhr: true
      expect(response.body).to include('["Title can\'t be blank","Text can\'t be blank"]')
    end

    it 'ensures update works' do
      Post.new(title: 'Titulo antigo', text: 'Texto antigo').save

      put '/titulo-antigo', :params => {:post => {title: 'Titulo novo', text: 'Texto novo'}}
      expect(response).to redirect_to('/titulo-novo')
    end

    it 'ensures update fails respond with errors' do
      Post.new(title: 'Titulo antigo', text: 'Texto antigo').save

      put '/titulo-antigo', :params => {:post => {title: '', text: ''}}
      expect(response.body).to include('["Title can\'t be blank","Text can\'t be blank"]')
    end

    it 'ensures delete works' do
      Post.new(title: 'To be deleted', text: 'Destroyed').save
      get '/to-be-deleted'
      expect(response).to have_http_status(:ok)

      delete '/to-be-deleted', xhr: true
      get '/to-be-deleted'
      expect(response).to have_http_status(:not_found)
    end

    it 'ensures delete update timeline' do
      Post.new(title: 'To be deleted', text: 'Destroyed').save
      visit(posts_path)
      expect(page).to have_selector("h3", text: 'To be deleted')
      delete '/to-be-deleted', xhr: true

      visit(posts_path)
      expect(page).not_to have_selector("h3", text: 'To be deleted')
    end
  end
end
