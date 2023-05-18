Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'main#hello'

  get 'create', to: 'create_words_set#createSet'
  post 'submit', to: 'create_words_set#submit'

  get 'addWords/:id', to: 'add_words#addWords', as: :addWords
  post '/addWords', to: 'add_words#submit'


end