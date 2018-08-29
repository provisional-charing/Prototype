Rails.application.routes.draw do
  resources :notes
  resources :vaccination_cards
  resources :vaccinations
  resources :projects
  resources :diseases
  namespace :admin do
    resources :users
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users


  authenticated :user do
    root 'pages#test_page'#, as: :authenticated_root
  end

  root 'pages#welcome_page'
  get '/welcome',to:'pages#welcome_page'
  get '/main',to:'pages#test_page'
  get '/agb', to:'pages#agb_page'
  get '/note', to:'pages#notes_page', as: :custom_notes
  get '/login', to:'pages#login_page'
  get '/impfpass', to:'pages#impfpass_page'
  get '/vaccination_information', to:'pages#vaccination_information'
  get '/VeröffentlichungsAntrag', to: 'pages#pdf' , as: :ProjectFormular
  get '/wikiMain', to:'diseases#wikiMain_page'
  get '/socialProjects', to: 'projects#sozialeProjekte_page'
  get '/accinfo', to:'admin/users#normal_edit'
  get 'flysearch', to:'pages#flysearch'
  post '/user_own_update', to:'admin/users#normal_update', as: :user_normal_update
end
