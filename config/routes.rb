Rails.application.routes.draw do
  resources :movies, only: [:index] do
    collection do
      get :search
    end
  end

end
