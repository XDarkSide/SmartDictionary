Rails.application.routes.draw do
  resources :category_items
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'main#hello'

  post '/create', to: 'main#submit'

  get 'create', to: 'create_words_set#createSet'
  post 'submit', to: 'create_words_set#submit'
  post '/delete', to: 'main#delete'

  get 'addWords/:id', to: 'add_words#addWords', as: :addWords
  post '/addWords', to: 'add_words#submit'


end