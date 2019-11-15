Rails.application.routes.draw do
  get 'welcome/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  resources :parents
  resources :students
  resources :teachers
  resources :school_classes
  resources :lectures
  resources :marks

  get 'parents/:id/show_marks' => 'parents#show_marks'

end


