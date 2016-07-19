PostType = GraphQL::ObjectType.define do

  name "Post"
  description "An article that has been written by an Author"

  field :id, !types.Int
  field :title, !types.String
  field :body, !types.String
  field :status, !types.String
  field :published_at, !types.String
  field :author_id, !types.Int
  field :author do
    type AuthorType
    resolve -> (post, args, ctx) { post.author }
  end
  field :comments do 
    type    -> { types[!CommentType] }
    argument :limit, types.Int
    resolve -> (post, args, ctx) { post.comments.limit(args["limit"]) }
  end 

end