Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  resources :profiles, only: [:new, :create, :show]
  resources :vacuancy_jobs, only: [:index, :new, :create, :show]
  resources :job_applications, only: [:index, :new, :create, :show]
end
