Rails.application.routes.draw do
  resources :students
  resources :teachers
  resources :classrooms
  resources :branches
end
