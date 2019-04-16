Rails.application.routes.draw do
  resources :flavors
  resources :shift_jobs
  resources :jobs
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :stores
  resources :assignments
  resources :employees
  resources :home
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :shifts
  
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
  get 'for_employees' => 'assignments#for_employees', as: :for_employees_assignments
  get 'for_managers' => 'assignments#for_managers', as: :for_managers_assignments
  get 'for_admins' => 'assignments#for_admins', as: :for_admins_assignments
  get 'for_one' => 'assignments#for_one', as: :for_one_assignments
  get 'for_two' => 'assignments#for_two', as: :for_two_assignments
  get 'for_three' => 'assignments#for_three', as: :for_three_assignments
  get 'for_four' => 'assignments#for_four', as: :for_four_assignments
  get 'for_five' => 'assignments#for_five', as: :for_five_assignments
  get 'for_six' => 'assignments#for_six', as: :for_six_assignments
  
 
  #page routes for the footer
  get 'home' => 'home#home', as: :main
  get 'about' => 'home#about', as: :about
  get 'contact' => 'home#contact', as: :contact
  
  
  #links for login and logout
  get 'sessions/new', to: 'sessions#new', as: :login
  get 'sessions/destroy', to: 'sessions#destroy', as: :logout

  # Set the root url
  root :to => 'sessions#new'
  
end
