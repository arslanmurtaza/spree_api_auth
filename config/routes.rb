Spree::Core::Engine.add_routes do
  # Add your extension routes here
  namespace :api, defaults: {format: 'json'} do
    resource :users do
        #resource :v1 do
        member do
            puts("estoy en el router")
          post :sign_up
          post :sign_in
        end
    #end
    end
  end
end
