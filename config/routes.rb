Rails.application.routes.draw do
  get 'home/index'
  resources :orders
  root 'home#index'       
  resources :contract_documents
  # resources :contract_documents, only: [:show]
end
