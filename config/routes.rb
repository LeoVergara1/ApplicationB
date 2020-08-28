Rails.application.routes.draw do
  resources :shippings
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope 'delivery_tracking' do
    get '/:delivery' => 'delivery_tracking#shipp'
    get '/satatus_delivery/:delivery' => 'delivery_tracking#satatus_delivery'
  end
end
