Rails.application.routes.draw do
  resources :students
  resources :teachers
  resources :classrooms
  resources :branches
  resources :lessons
  resources :exams
  resources :notes, only: [:create]
end
