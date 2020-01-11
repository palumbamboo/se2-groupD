Rails.application.routes.draw do
  resources :timetables
  resources :notes
  resources :materials
  resources :principals
  resources :administrators
  resources :communications
  resources :assignments
  resources :attendances
  devise_for :users
  get 'welcome/index'
  get 'welcome/:id/choose_role', to: 'welcome#choose_role', as: 'welcome_role'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  resources :parents
  resources :students 
  resources :teachers
  resources :administrators
  resources :school_classes
  resources :lectures
  resources :marks
  resources :officers
  resources :passwords

  post 'lectures/:id/attendances', to: 'lectures#school_class_attendances'

  patch 'passwords/:id/edit', to: 'passwords#update'
  put 'users/:id', to: 'application#direct_user', as: 'user'

  get 'teachers/:id/lectures(/:school_class_id)', to: 'teachers#lectures', as: 'teacher_lectures'
  get 'teachers/:id/marks', to: 'teachers#marks', as: 'teacher_marks'

  get 'teachers/:id/notes', to: 'teachers#notes', as: 'teacher_notes'

  get 'teachers/:id/assignments(/:school_class_id)', to: 'teachers#assignments', as: 'teacher_assignments'
  post 'teachers/:id/assignments/:school_class_id/subjects/:sub', to: 'teachers#assignments_per_subject'

  get 'teachers/:id/materials(/:school_class_id)', to: 'teachers#materials', as: 'teacher_materials'
  post 'teachers/:id/materials/:school_class_id/subjects/:sub', to: 'teachers#materials_per_subject'

  get 'parents/:id/students(/:stud)', to: 'parents#students', as: 'parent_marks'
  post 'parents/:id/students/:stud/subjects/:sub', to: 'parents#marks_per_subject'

  get 'parents/:id/attendances(/:stud)(/:month)', to: 'parents#attendances', as: 'parent_attendances'

  get 'parents/:id/assignments(/:stud)', to: 'parents#assignments', as: 'parent_assignments'
  post 'parents/:id/assignments/:stud/subjects/:sub', to: 'parents#assignments_per_subject'

  get 'parents/:id/communications', to: 'parents#communications', as: 'parent_communications'

  get 'parents/:id/materials(/:stud)', to: 'parents#materials', as: 'parent_materials'
  post 'parents/:id/materials/:stud/subjects/:sub', to: 'parents#materials_per_subject'

  get 'parents/:id/notes(/:stud)', to: 'parents#notes', as: 'parent_notes'
  post 'parents/:id/notes/:stud/subjects/:sub', to: 'parents#notes_per_subject'

  get 'officers/:id/class_composition(/:class)', to: 'officers#class_composition', as: 'officer_classes'
  get 'officers/:id/parents', to: 'officers#parents', as: 'officer_parents'

  get 'officers/:id/communications', to: 'officers#communications', as: 'officer_communications'
  get 'officers/:id/timetables(/:class)', to: 'officers#timetables', as: 'officer_timetables'
  post 'timetables/:id/file_timetable', to: 'timetables#file_import' #corretto?

  post 'school_classes/update/:id', to: 'school_classes#update'
  post 'school_classes/:id/file', to: 'school_classes#file_import'

  post 'officers/:id/parents/:parent/enable', to: 'officers#enable'
  post 'officers/:id/students/new', to: 'students#new'
  get 'officers/:id/students', to: 'officers#students', as: 'officer_enrollment'

  get 'administrators/:id/users', to: 'administrators#users', as: 'administrator_users'
  get 'administrators/:id/add_user', to: 'administrators#add_user', as: 'administrator_add_user'

end
