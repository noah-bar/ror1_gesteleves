Rails.application.routes.draw do
  root to: 'person_sessions#new'
  resources :students
  resources :teachers
  resources :classrooms
  resources :branches
  resources :lessons
  resources :exams
  resources :semesters, expect: [:show]
  resources :notes, only: [:create]
  resources :person_sessions, only: [:new, :create]
  delete 'logout', controller: :person_sessions, action: :destroy
end
