Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api, format: "json" do
    namespace :v1 do
      resources :auth do
        collection do
          post '/login', action: :login
        end
      end

      resources :bills
      resources :budgets
      resources :customer_transactions
      resources :products
      resources :request_jp_moneys
      resources :time_sheets
      resources :users
    end
  end
end
