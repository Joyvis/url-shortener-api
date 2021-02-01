Rails.application.routes.draw do
  resources :links, only: [:create]
  get '/:shortener_code', to: 'links#show'
end
