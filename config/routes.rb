CoderetreatLive::Application.routes.draw do
  resources :coderetreats, only: [] do
    get :running_today, :on => :collection

    resource :status, controller: "coderetreats/status", only: [:edit, :update]
  end
end
