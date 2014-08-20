Rails.application.routes.draw do
  root 'fb#index'
  get ':controller(/:action(/:id))'
end
