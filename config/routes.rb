Facturas::Application.routes.draw do
  get 'profile/new'

  root "pages#home"    
  get "home", to: "pages#home", as: "home"
  get "inside", to: "pages#inside", as: "inside"
  get "userinfo", to: "user_info#new", as: "userinfo"
    
  devise_for :users
  
  namespace :admin do
    root "base#index"
    resources :users
    resources :user_infos
  end
  
end
