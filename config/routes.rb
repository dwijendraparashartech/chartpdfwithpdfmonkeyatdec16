Rails.application.routes.draw do
  get 'home/index'
  resources :orders
  root 'home#index'       
  # resources :contract_documents
  # resources :contracts
  resources :contract_documents, only: [:show, :index]
  get 'download', action: :download, controller: 'contract_documents'
end
