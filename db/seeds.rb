
# Create Users
if Rails.env.development?
  User.create(name: "John Smith",
              email: "Email1@example.com",
              password: "123456", 
              birthdate: "1985/02/25")

  User.create(name: "Corven Dallas",
              email: "Email2@example.com",
              password: "123456", 
              birthdate: "1985/02/24")

  User.create(name: "Hans Grubber", 
              email: "Email3@example.com",
              password: "123456", 
              birthdate: "1985/02/23")


  # Create Posts

  User.first.posts.create(content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, 
                                    sed do eiusmod tempor incididunt ut labore et dolore 
                                    magna aliqua. Eget mauris pharetra et ultrices neque 
                                    ornare aenean euismod elementum.Venenatis lectus magna 
                                    fringilla urna porttitor rhoncus dolor. Aliquet 
                                    enim tortor at auctor.")

  User.second.posts.create(content: "Feugiat scelerisque varius morbi enim nunc faucibus a. 
                                     Vitae sapien pellentesque habitant morbi. Vitae ultricies 
                                     leo integer malesuada nunc vel risus commodo. 
                                     Integer quis auctor elit sed vulputate mi sit amet. 
                                     Diam vulputate ut pharetra sit amet aliquam id diam maecenas.")

  # Create Comments

  User.first.comments.create(post: Post.second,
                             content: "Nulla posuere sollicitudin aliquam ultrices sagittis 
                                       orci a scelerisque purus.")

  User.second.comments.create(post: Post.first,
                              content: "Facilisis gravida neque convallis a cras semper auctor 
                                        neque vitae. Cursus in hac habitasse platea dictumst quisque.")

  # Create Likes

  User.first.likes.create(likeable: Post.second)
end    