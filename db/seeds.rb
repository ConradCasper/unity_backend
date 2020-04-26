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

backgrounds = ["https://images.unsplash.com/photo-1578491133524-f33d9c7a7484?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=3423&q=80",
                "https://images.unsplash.com/photo-1587657565520-6c0c23cf68c7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2250&q=80",
                "https://images.unsplash.com/photo-1587588354456-ae376af71a25?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2250&q=80",
                "https://images.unsplash.com/photo-1586191582109-7e0c712e9460?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2249&q=80",
                "https://images.unsplash.com/photo-1587321819113-cc19ebc6e5e3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=3300&q=80"
]


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
    avatar: "https://imgur.com/L9JTgkr",
    background_img: "https://images.unsplash.com/photo-1506850981415-e1911e907185?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2250&q=80",
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
        city: Faker::Address.city,
        avatar: Faker::Avatar.image,
        background_img: backgrounds.sample
    )
end

pictures = []

1000.times do
    image = Faker::LoremFlickr.image
    pictures << image
end


1000.times do
    user = User.all.sample
    Post.create(
        user_id: user.id,
        content: Faker::Lorem.paragraph(sentence_count: 2, supplemental: false, random_sentences_to_add: 4),
        img_url: pictures.sample
    )
end

1750.times do
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


600.times do
    follower = User.all.sample
    followee = User.all.sample
    Follow.create(
        follower_id: follower.id,
        followee_id: followee.id
    )
end