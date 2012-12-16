CoderetreatLive::Application.routes.draw do
  resources :coderetreats, only: [] do
    get :running_today, :on => :collection
  end
end
