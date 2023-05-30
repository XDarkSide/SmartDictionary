Rails.application.routes.draw do
  resources :category_items
  
  root 'main#hello'
  
  post '/create', to: 'main#submit'
  
  get 'create', to: 'create_words_set#createSet'
  post 'submit', to: 'create_words_set#submit'
  post '/delete', to: 'main#delete'
  
  get 'addWords/:id', to: 'add_words#addWords', as: :addWords
  post '/addWords', to: 'add_words#submit'
  
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }

  delete '/users/sign_out', to: 'users/sessions#destroy', as: :destroy_user_sessio
end
