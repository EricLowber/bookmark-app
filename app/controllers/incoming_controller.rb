class IncomingController < ApplicationController

  # http://stackoverflow.com/questions/1177863/how-do-i-ignore-the-authenticity-token-for-specific-actions-in-rails
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
     # Take a look at these in your server logs
     # to get a sense of what you're dealing with.
     puts "INCOMING PARAMS HERE: #{params}"

    # You put the message-splitting and business
    # magic here.
    

     user = User.find_by_email(params[:sender])  
     topic = params[:subject]
     url = params["stripped-text"]
     
     # Check if user is nil, if so, create and save a new user
     if user.nil? 
        user = User.new(
          email: params[:sender],
          password: 'helloworld')
        user.save
     end
    
     if topic.nil? 
        topic = Topic.new(
            name: params[:subject],
            user_id: user.id)
        topic.save
     end
     # Check if the topic is nil, if so, create and save a new topic
    bookmark = Bookmark.build(url: url, topic: topic)
    bookmark.save
     # Now that we're sure we have a valid user and topic, build and save a new bookmark

    # Assuming all went well.
    head 200
  end
end

