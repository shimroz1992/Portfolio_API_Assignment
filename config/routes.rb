# frozen_string_literal: true

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  namespace :api do
    namespace :v1 do
      resources :stocks, only: %i[index show create update destroy]
      get '/portfolio', to: 'portfolio#index'
      get '/portfolio/:id', to: 'portfolio#show'
      get '/holdings/:id', to: 'portfolio#holdings'
      get '/returns/:id', to: 'portfolio#returns'

      post '/addTrade', to: 'trades#create_trade'
      post '/updateTrade/:id', to: 'trades#update_trade'
      delete '/removeTrade/:id', to: 'trades#remove_trade'
    end
  end
end
