Bloodhound::Application.routes.draw do
  resources :projects do
    resources :pivotal_tracker_activities, only: [:index]
    resources :github_activities, only: [:index]
  end

  match 'hook/:service/:api_key' => 'hook#receive', via: :post
end
