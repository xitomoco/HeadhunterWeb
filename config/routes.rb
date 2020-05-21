Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  resources :profiles, only: [:new, :create, :show]
  resources :vacuancy_jobs, only: [:index, :new, :create, :show] do
    get 'search_candidate', on: :collection
  end
  resources :job_applications, only: [:index, :new, :create, :show]
end
