Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :stores
  resources :assignments
  resources :employees
  resources :home
  
  # links for store scopes
  get 'active' => 'stores#active', as: :active_stores
  get 'inactive' => 'stores#inactive', as: :inactive_stores
  
  # links for employee scopes
  get 'active' => 'employees#active', as: :active_employees
  get 'inactive' => 'employees#inactive', as: :inactive_employees
  get 'younger_than_18' => 'employees#younger_than_18', as: :younger_employees
  get '18_or_older' => 'employees#18_or_older', as: :older_employees
  get 'regulars' => 'employees#regulars', as: :regulars_employees
  get 'managers' => 'employees#managers', as: :managers_employees
  get 'admins' => 'employees#admins', as: :admins_employees
 
  #page routes for the footer
  get 'home' => 'home#home', as: :main
  get 'about' => 'home#about', as: :about
  get 'contact' => 'home#contact', as: :contact
  
  # Set the root url
  root :to => 'home#home'  
end
