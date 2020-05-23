Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  resources :profiles, only: [:new, :create, :show]
  resources :vacuancy_jobs, only: [:index, :new, :create, :show] do
    get 'search_candidate', on: :collection
    get 'search_headhunter', on: :collection
  end
  resources :job_applications, only: [:index, :new, :create, :show]
  resources :comment_of_profiles, only: [:create]
end
