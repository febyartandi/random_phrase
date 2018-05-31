Rails.application.routes.draw do

  root 'phrases#index'
  
  get '/random' => 'phrases#random'
  get '/clear' => 'phrases#clear'
end
