Rails.application.routes.draw do
  resources :projects
  resources :diseases
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users


  root 'pages#welcome_page'
  get '/welcome',to:'pages#welcome_page'
  get '/main',to:'pages#test_page'
  get '/agb', to:'pages#agb_page'
  get '/login', to:'pages#login_page'
  get '/impfpass', to:'pages#impfpass_page'
  get '/wikiMain', to:'pages#wikiMain_page'
  get '/gelbfieber', to:'pages#wikiGelbfieber_page'
  get '/socialProjects', to: 'pages#sozialeProjekte_page'
  get '/VeröffentlichungsAntrag', to: 'pages#pdf' , as: :ProjectFormular

end
