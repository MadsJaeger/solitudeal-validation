Rails.application.routes.draw do
  resources :users
  mount SolitudealValidation::Engine => "/solitudeal_validation"
end
