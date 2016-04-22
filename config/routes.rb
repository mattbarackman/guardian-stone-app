Rails.application.routes.draw do
  resources :devices, :except => [:destroy] do
    member do
      get :dashboard
      post :on
      post :off
    end
    resources :locations, :except => [:new, :edit, :update, :destroy]
  end
end
