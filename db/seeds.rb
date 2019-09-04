# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# first_name
# last_name
# email
# password
# avatar
# background_img
# bio
# interests
# favorite_bands
# city


Post.destroy_all
Like.destroy_all
Comment.destroy_all
Follow.destroy_all
User.destroy_all

User.create(
    first_name: "Conrad",
    last_name: "Casper",
    email: "conradcasper@icloud.com",
    password: "password",
    avatar: "https://scontent-atl3-1.xx.fbcdn.net/v/t1.0-9/50878341_106590607123992_507388018802294784_n.jpg?_nc_cat=110&_nc_oc=AQkuHS6oxf0rn4IKzytg3PfxTEFIozx_nswTXJNuJOExA1nDkhOi6z5-qD1lkdzYdEI&_nc_ht=scontent-atl3-1.xx&oh=bb857ed07355282ea57d74535f1f36a3&oe=5E0CBC8B",
    background_img: "https://scontent-atl3-1.xx.fbcdn.net/v/t1.0-9/53868237_126469975136055_9159577800980561920_n.jpg?_nc_cat=110&_nc_oc=AQnjInRV4RTiQ56Pq0HS89htd7c71vqxHVlnmXBojJWy8riRG6TbertvIQKFs3tkJ9g&_nc_ht=scontent-atl3-1.xx&oh=d27198c2c32c798b883a9c5a7e036141&oe=5DCD3555",
    bio: "Hello World!",
    interests: "coding, long naps, making music, hiking",
    favorite_bands: "disclosure, fisher, chris lake, the bixel brothers, skrillex, diplo",
    city: "Atlanta"
)


250.times do
    User.create(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name ,
        email: Faker::Internet.email,
        password: "password",
        bio: Faker::Lorem.paragraph(sentence_count: 2, supplemental: false, random_sentences_to_add: 4),
        interests: Faker::Lorem.paragraph(sentence_count: 2, supplemental: false, random_sentences_to_add: 4),
        favorite_bands: Faker::Lorem.paragraph(sentence_count: 2, supplemental: false, random_sentences_to_add: 4),
        city: Faker::Address.city
    )
end


1500.times do
    user = User.all.sample
    Post.create(
        user_id: user.id,
        content: Faker::Lorem.paragraph(sentence_count: 2, supplemental: false, random_sentences_to_add: 4)
    )
end

1000.times do
    user = User.all.sample
    post = Post.all.sample
    Comment.create(
        post_id: post.id,
        user_id: user.id,
        content: Faker::Quote.famous_last_words
    )
end


3000.times do
    user = User.all.sample
    post = Post.all.sample
    Like.create(
        post_id: post.id,
        user_id: user.id
    )
end


400.times do
    follower = User.all.sample
    followee = User.all.sample
    Follow.create(
        follower_id: follower.id,
        followee_id: followee.id
    )
end