Rails.application.routes.draw do
  resources :vaccination_cards
  resources :vaccinations
  resources :projects
  resources :diseases
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users


  root 'pages#welcome_page'
  get '/welcome',to:'pages#welcome_page'
  get '/main',to:'pages#test_page'
  get '/agb', to:'pages#agb_page'
  get '/accinfo', to:'pages#accountinfo.html'
  get '/note', to:'pages#notiz.html'
  get '/login', to:'pages#login_page'
  get '/impfpass', to:'pages#impfpass_page'
  get '/vaccination_information', to:'pages#vaccination_information'
  get '/VeröffentlichungsAntrag', to: 'pages#pdf' , as: :ProjectFormular
  get '/wikiMain', to:'diseases#wikiMain_page'
  get '/socialProjects', to: 'projects#sozialeProjekte_page'
end
