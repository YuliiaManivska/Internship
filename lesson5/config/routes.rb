Rails.application.routes.draw do
  devise_for :users
  root "patients#index"

  resources :patients
  resources :physicians
  resources :diagnosis_items
  resources :appointments
end
