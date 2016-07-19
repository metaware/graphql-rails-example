CommentType = GraphQL::ObjectType.define do
  
  name "Comment"
  description "A comment that has been left by an Author"

  field :id, !types.ID
  field :title, !types.String
  field :body, !types.String
  field :author_id, !types.Int
  field :post_id, !types.Int
  
end