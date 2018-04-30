Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users

  root 'pages#welcome_page'
  get '/agb', to:'pages#agb_page'

end
