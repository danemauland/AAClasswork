Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "static_pages#index"
  namespace :api, defaults: {format: :json} do 
    resources :atodos, only: [:index, :show, :create, :destroy, :update]
  end
end


# Application.routes.draw do

#   root :controller => 'static', :action => '/' 
#   # or
#   # root :controller => 'static', :action => '/public/index.html'

# end

# # elsewhere

# redirect_to root_path # redirect to /