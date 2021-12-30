Rails.application.routes.draw do
  root 'patients#index'

  resources :patients
  resources :physicians
  resources :diagnosis_items
  resources :appointments
end
