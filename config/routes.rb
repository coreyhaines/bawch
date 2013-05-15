CoderetreatLive::Application.routes.draw do
  resources :coderetreats, only: [] do
    get :running_today, :on => :collection

    put :update_status, :on => :member

    resource :status, controller: "coderetreats/status", only: [:edit]
  end
end
