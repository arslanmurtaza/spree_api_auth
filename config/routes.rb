Spree::Core::Engine.add_routes do
#Spree::Core::Engine.routes.draw do
  # Add your extension routes here
  namespace :api, defaults: {format: 'json'} do
    #namespace :v1 do
    resource :users do
        #resource :v1 do
        member do
          #post :sign_up
          print("Hola routes")
          post :sign_in
        end
      #end
    end
  end
end
