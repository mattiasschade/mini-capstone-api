Rails.application.routes.draw do
  get "/one_product" => "products#show"
  get "/all_products" => "products#all"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
