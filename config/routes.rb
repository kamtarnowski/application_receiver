Rails.application.routes.draw do

  resources :submissions, only: [:create, :new]

  root 'submissions#new'
  
end
