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
  get 'employee_active' => 'employees#active', as: :active_employees
  get 'employee_inactive' => 'employees#inactive', as: :inactive_employees
  get 'younger' => 'employees#younger', as: :younger_employees
  get 'older' => 'employees#older', as: :older_employees
  get 'regulars' => 'employees#regulars', as: :regulars_employees
  get 'managers' => 'employees#managers', as: :managers_employees
  get 'admins' => 'employees#admins', as: :admins_employees
  
  
  # links for assignments scopes
  get 'past' => 'assignments#past', as: :past_assignments
  get 'current' => 'assignments#current', as: :current_assignments
  get 'by_store' => 'assignments#by_store', as: :by_store_assignments
  get 'by_employee' => 'assignments#by_employee', as: :by_employee_assignments
  get 'for_store' => 'assignments#for_store', as: :for_store_assignments
  get 'get_store' => 'assignments#get_store', as: :get_store_assignments
 
  #page routes for the footer
  get 'home' => 'home#home', as: :main
  get 'about' => 'home#about', as: :about
  get 'contact' => 'home#contact', as: :contact
  
  # Set the root url
  root :to => 'home#home'  
end
