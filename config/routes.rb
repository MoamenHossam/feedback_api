Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => "/sidekiq"
  namespace 'api'do
  namespace 'v1'do
post '/feedbacks/' , to: 'feedbacks#create'
get '/feedbacks/count/:id', to: 'feedbacks#count'
get '/feedbacks/:number', to: 'feedbacks#show'
get '/feedbacks', to: 'feedbacks#index'
  end
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
