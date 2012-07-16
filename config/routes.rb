Bloodhound::Application.routes.draw do
  resources :pivotal_tracker_activities

  resources :projects

  match 'hook/:service/:api_key' => 'hook#receive', via: :post
end
