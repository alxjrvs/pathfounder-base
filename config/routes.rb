Rails.application.routes.draw do
  root to: "characters#new"

  resources :characters, only: [:new, :create, :show] do
    member do
      get 'edit_general_info', as: :edit_general_info
      post 'update_general_info', as: :update_general_info

      get 'edit_stats', as: :edit_stats
      post 'update_stats', as: :update_stats

      get 'edit_skills', as: :edit_skills
      post 'update_skills', as: :update_skills

      get 'edit_feats', as: :edit_feats
      post 'update_feats', as: :update_feats

      get 'edit_pf_class', as: :edit_pf_class
      post 'update_pf_class', as: :update_pf_class

      get 'edit_race', as: :edit_race
      post 'update_race', as: :update_race
      
      get 'edit_items', as: :edit_items
      post 'update_items', as: :update_items
    end
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
