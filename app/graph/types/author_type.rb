AuthorType = GraphQL::ObjectType.define do
  name "Author"
  description "A person who authors blog posts in our blog app"

  field :id, !types.Int
  field :firstName, !types.String, "Author's first name", property: :first_name
  field :full_name, !types.String, "Author's first name"
  field :last_name, !types.String, "Author's last name"
  field :email, !types.String, "Author's email"
  field :avatar, !types.String, "Author's avatar"
  
  field :posts do
    type    -> { types[!PostType] }
    resolve -> (author, args, ctx) { author.posts }
  end

end