Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  resources :profiles, only: [:new, :create, :show]
  resources :vacuancy_jobs, only: [:index, :new, :create, :show] do
    get 'search_candidate', on: :collection
    get 'search_headhunter', on: :collection
    resources :comment_of_rejects, only: [:new, :create]
  end
  resources :job_applications, only: [:index, :new, :create, :show, :destroy]
  resources :comment_of_profiles, only: [:create]
  resources :favorites, only: [:create]
end
