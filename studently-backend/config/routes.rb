Rails.application.routes.draw do
  scope :api, defaults: {format: :json} do
    resources :examples
    resources :parents
    resources :students
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
