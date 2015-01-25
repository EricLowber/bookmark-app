class IncomingController < ApplicationController

  # http://stackoverflow.com/questions/1177863/how-do-i-ignore-the-authenticity-token-for-specific-actions-in-rails
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
     # Take a look at these in your server logs
     # to get a sense of what you're dealing with.
     puts "INCOMING PARAMS HERE: #{params.to_yaml}"

    # You put the message-splitting and business
    # magic here.
    

     user = User.find_by_email(params[:sender])  
     topic = Topic.find_by_name(params[:subject])

     url = /^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$/.match(params[stripped-html])[1]
   
    

     # Check if user is nil, if so, create and save a new user
     if user.nil? 
        user = User.new(
          email: params[:sender],
          password: 'helloworld')
        user.save
     end
    
     if topic.nil? 
        topic = Topic.new(
            name: params[:subject]
           )
        topic.save
     end
     # Check if the topic is nil, if so, create and save a new topic
    bookmark = user.bookmarks.new(url: url)
    bookmark.topic = topic
    bookmark.save
     # Now that we're sure we have a valid user and topic, build and save a new bookmark

    # Assuming all went well.
    head 200
  end
end

