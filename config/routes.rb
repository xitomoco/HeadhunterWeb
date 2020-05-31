Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  resources :profiles, only: [:new, :create, :show] do
    resources 'messages', only: [:index] do
      get 'message_rejects', on: :collection
      get 'message_proposals', on: :collection
    end
  end
  resources :vacuancy_jobs, only: [:index, :new, :create, :show] do
    get 'search_candidate', on: :collection
    get 'search_headhunter', on: :collection
    resources :comment_of_rejects, only: [:new, :create]
    resources :comment_of_proposals, only: [:new, :create, :edit, :update]
  end
  resources :job_applications, only: [:index, :new, :create, :show, :destroy]
  resources :comment_of_profiles, only: [:create]
  resources :favorites, only: [:create]
end
