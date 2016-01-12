Rails.application.routes.draw do
  root to: "characters#new"

  resources :characters, only: [:new, :create, :show] do
    resources :general_info, only: [:edit, :update]
    resources :stats, only: [:edit, :update]
    resources :skills, only: [:edit, :update]
    resources :feats, only: [:edit, :update]
    resources :pf_class, only: [:edit, :update]
    resources :race, only: [:edit, :update]
    resources :items, only: [:edit, :update]
  end

  namespace :api do
    namespace :v1 do
      resources :characters, only: [:create, :show, :update, :destroy] do
        resources :skill_lists, only: [:index, :create, :show, :update]
        resources :stat_blocks, only: [:index, :create, :show, :update]
        resources :pf_classes, only: [:index, :create, :show, :update]
        resources :races, only: [:index, :create, :show, :update]
        resources :feat_lists, only: [:index, :create, :show, :update]
        resources :armories, only: [:index, :create, :show, :update]
      end
    end
  end
end
