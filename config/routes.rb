Rails.application.routes.draw do

  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/queries"
  end

  resources :queries, only: [:create]

  root to: redirect("/graphiql")

end
