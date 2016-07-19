# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

posts_range = (5..20).to_a
comments_range = (2..6).to_a

25.times do
  puts "[Adding Authors].."
  author = Author.create({
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    avatar: Faker::Avatar.image,
    phone_number: Faker::PhoneNumber.cell_phone,
    city: Faker::Address.city,
    state: Faker::Address.state,
    country: Faker::Address.country
  })

  posts_range.sample.times do
    puts "  |_ [Adding Posts for #{author.id} ].."
    post = Post.create({
      title:  Faker::Hacker.say_something_smart,
      body:   Faker::Hipster.paragraph(3),
      status: ['published', 'draft'].sample,
      published_at: Faker::Date.backward(180),
      author_id: author.id
    }) 

    comments_range.sample.times do 
      puts "    |_ [Adding Comments for #{post.id} ].."
      comment = Comment.create({
        title: Faker::Hipster.sentence,
        body: Faker::Hipster.sentence(4),
        post_id: post.id
      })
    end
  end

  authors = Author.ids
  Comment.find_each do |comment|
    comment.author_id = authors.sample
    comment.save
  end

end