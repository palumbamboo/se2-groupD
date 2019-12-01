Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  resources :parents
  resources :students 
  resources :teachers
  resources :school_classes
  resources :lectures
  resources :marks
  resources :officers

  get 'teachers/:id/lectures(/:school_class_id)', to: 'teachers#lectures', as: 'teacher_lectures'
  get 'teachers/:id/marks', to: 'teachers#marks', as: 'teacher_marks'

  get 'parents/:id/students(/:stud)', to: 'parents#students', as: 'parent_marks'
  post 'parents/:id/students/:stud/subjects/:sub', to: 'parents#marks_per_subject'

  get 'officers/:id/parents', to: 'officers#parents', as: 'officer_parents'

  post 'officers/:id/parents/:parent/enable', to: 'officers#enable'

end
