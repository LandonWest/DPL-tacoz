Rails.application.routes.draw do

  devise_for :users
  root 'site#index'
  get '/about' => 'site#about'
  get '/contact' => 'site#contact'
  post '/contact-submit' => 'site#contact_submit', as: :submit_contact
  resources :menu_items, only: [:index, :show], path: 'our-food'
  get '/our-vegetarian-food' => 'menu_items#vegetarian'
  resources :locations, only: [:index, :show]
  
  namespace :admin do  #all routes inside this bloc will have a /admin in front of them.
    get '/' => 'base#index' #base controller could be called anything (except admin)

    resources :menu_items
  end

end
