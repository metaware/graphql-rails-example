QueryType = GraphQL::ObjectType.define do
  name "Query"
  description "The query root of BlogSchema"

  field :author do
    type AuthorType
    argument :id, !types.ID
    resolve -> (obj, args, ctx) { Author.find(args["id"]) }
  end

  field :authors do
    type    -> { types[AuthorType] }
    argument :limit, types.Int
    resolve -> (obj, args, ctx) { Author.all.limit(args["limit"]) }
  end

  field :posts do
    type    -> { types[PostType] }
    argument :limit, !types.Int
    resolve -> (obj, args, ctx) { Post.all.limit(args["limit"]) }
  end

  field :latestPost do
    type PostType
    resolve -> (obj, args, ctx) { Post.last }
  end

  field :comments do
    type -> { types[CommentType] }
    argument :limit, !types.Int
    resolve -> (obj, args, ctx) { Comment.all.limit(args["limit"]) }
  end

end