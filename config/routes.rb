Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :stores
  resources :assignments
  resources :employees
  resources :home
  
  # Additional routes we've created for this project
  get 'active' => 'stores#active', as: :active_stores
  get 'inactive' => 'stores#inactive', as: :inactive_stores
 
  #page routes for the footer
  get 'home' => 'home#home', as: :main
  get 'about' => 'home#about', as: :about
  get 'contact' => 'home#contact', as: :contact
  
  # Set the root url
  root :to => 'home#home'  
end
