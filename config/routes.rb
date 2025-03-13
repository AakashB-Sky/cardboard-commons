Rails.application.routes.draw do
  # Routes for the Friend request resource:

  # CREATE
  post("/insert_friend_request", { :controller => "friend_requests", :action => "create" })
          
  # READ
  get("/friend_requests", { :controller => "friend_requests", :action => "index" })
  
  get("/friend_requests/:path_id", { :controller => "friend_requests", :action => "show" })
  
  # UPDATE
  
  post("/modify_friend_request/:path_id", { :controller => "friend_requests", :action => "update" })
  
  # DELETE
  get("/delete_friend_request/:path_id", { :controller => "friend_requests", :action => "destroy" })

  #------------------------------

  # Routes for the Event invitation resource:

  # CREATE
  post("/insert_event_invitation", { :controller => "event_invitations", :action => "create" })
          
  # READ
  get("/event_invitations", { :controller => "event_invitations", :action => "index" })
  
  get("/event_invitations/:path_id", { :controller => "event_invitations", :action => "show" })
  
  # UPDATE
  
  post("/modify_event_invitation/:path_id", { :controller => "event_invitations", :action => "update" })
  
  # DELETE
  get("/delete_event_invitation/:path_id", { :controller => "event_invitations", :action => "destroy" })

  #------------------------------

  # Routes for the Event join request resource:

  # CREATE
  post("/insert_event_join_request", { :controller => "event_join_requests", :action => "create" })
          
  # READ
  get("/event_join_requests", { :controller => "event_join_requests", :action => "index" })
  
  get("/event_join_requests/:path_id", { :controller => "event_join_requests", :action => "show" })
  
  # UPDATE
  
  post("/modify_event_join_request/:path_id", { :controller => "event_join_requests", :action => "update" })
  
  # DELETE
  get("/delete_event_join_request/:path_id", { :controller => "event_join_requests", :action => "destroy" })

  #------------------------------

  # Routes for the Friendship resource:

  # CREATE
  post("/insert_friendship", { :controller => "friendships", :action => "create" })
          
  # READ
  get("/friendships", { :controller => "friendships", :action => "index" })
  
  get("/friendships/:path_id", { :controller => "friendships", :action => "show" })
  
  # UPDATE
  
  post("/modify_friendship/:path_id", { :controller => "friendships", :action => "update" })
  
  # DELETE
  get("/delete_friendship/:path_id", { :controller => "friendships", :action => "destroy" })

  #------------------------------

  # Routes for the Game resource:

  # CREATE
  post("/insert_game", { :controller => "games", :action => "create" })
          
  # READ
  get("/games", { :controller => "games", :action => "index" })
  
  get("/games/:path_id", { :controller => "games", :action => "show" })
  
  # UPDATE
  
  post("/modify_game/:path_id", { :controller => "games", :action => "update" })
  
  # DELETE
  get("/delete_game/:path_id", { :controller => "games", :action => "destroy" })

  #------------------------------

  # Routes for the Event registration resource:

  # CREATE
  post("/insert_event_registration", { :controller => "event_registrations", :action => "create" })
          
  # READ
  get("/event_registrations", { :controller => "event_registrations", :action => "index" })
  
  get("/event_registrations/:path_id", { :controller => "event_registrations", :action => "show" })
  
  # UPDATE
  
  post("/modify_event_registration/:path_id", { :controller => "event_registrations", :action => "update" })
  
  # DELETE
  get("/delete_event_registration/:path_id", { :controller => "event_registrations", :action => "destroy" })

  #------------------------------

  devise_for :users

  # Routes for the Event resource:

  # CREATE
  post("/insert_event", { :controller => "events", :action => "create" })
          
  # READ
  get("/events", { :controller => "events", :action => "index" })
  
  get("/events/:path_id", { :controller => "events", :action => "show" })
  
  # UPDATE
  
  post("/modify_event/:path_id", { :controller => "events", :action => "update" })
  
  # DELETE
  get("/delete_event/:path_id", { :controller => "events", :action => "destroy" })

  #------------------------------

  # This is a blank app! Pick your first screen, build out the RCAV, and go from there. E.g.:

  # get "/your_first_screen" => "pages#first"

  root to: "events#index"
  
end
