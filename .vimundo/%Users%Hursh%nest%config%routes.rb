Vim�UnDo� ���i�<��(Iͤ>>q���r�I��;А��   
       post :upvotes                             RCU    _�                             ����                                                                                                                                                                                                                                                                                                                                       �          V       RB     �             �   /  resource :sessions, only: [:create, :destroy]       $  resource :waitlists, only: :create       N  resources :rooms, only: [:index, :create, :new, :show, :update, :destroy] do   /    resources :posts, only: [:create, :destroy]           member do         get :context         get :recommend       end       !    resources :share, only: [] do         collection do           post :email_users           post :facebook           post :twitter   	      end       end           collection do   /      get ':id/:inviter_hash', to: 'rooms#show'   3      get :get_link_info, to: 'link_info#link_info'         get :rooms_with_link         get :search       end     end       D  get 'link_info/image', to: 'link_info#image', as: :link_info_image       '  resources :posts, only: [:destroy] do   /    resource :hearts, only: [:create, :destroy]     end       ,  resource :users, only: [:update, :destroy]          # Because omniauth is annoying   6  get "/auth/gmail" => redirect("/auth/google_oauth2")       5  resources :users, only: [:index, :create, :show] do           collection do   D      get 'from_identifier/:identifier', to: 'users#from_identifier'         get 'top_mentions'   &      get 'search', to: 'users#search'   .      resources :notifications, only: [:index]       2      resource :notifications,  only: [:update] do           get :counts   	      end             #TODO: delete?   R      # Onboarding routes. All routing after first page is done via angular router   ;      get 'onboarding/find_friends', to: 'users#onboarding'   :      get 'onboarding/add_friends', to: 'users#onboarding'       6      get :current_user, to: "users#current_user_json"   V      get 'new_from_invitation/:identifier', to: 'users#new', as: :new_from_invitation             # Password reset routes          get :reset_password_prompt   "      post :request_reset_password   y      get 'reset_password_confirmation/:token', to: 'users#reset_password_confirmation', as: :reset_password_confirmation         post :reset_password       $      # For mobile, we skip Omniauth   C      get :twitter_callback, to: 'authed_services#twitter_callback'   E      get :facebook_callback, to: 'authed_services#facebook_callback'   ?      get :gmail_callback, to: 'authed_services#gmail_callback'       8      # For querying for tw/fb/gmail friends once authed   $      resource :friends, only: [] do   ;        get :twitter, to: 'authed_services#twitter_friends'   =        get :facebook, to: 'authed_services#facebook_friends'   7        get :gmail, to: 'authed_services#gmail_friends'   	      end       !      get :friend_recommendations       end               get :feed, to: 'users#feed'       =    resource :friendships, only: [:create, :update, :destroy]     end       "  resources :settings, only: [] do       collection do         get :confirm_email   %      post :resend_email_confirmation         post :add_device         delete :remove_device       end     end       #  resources :stars, only: [:create]   "  resource :stars, only: [:update]       ,  resources :friendships, only: [:update] do       collection do         post :create_all         post :recommend       end     end       /  get 'partials/*partial' => 'partials#partial'         get 'faq', to:'statics#faq'   .  get 'walkthrough', to: 'statics#walkthrough'     get 'tos', to: 'statics#tos'   &  get 'privacy', to: 'statics#privacy'   0  get "bringfriends", to: "statics#bringfriends"         # Dashboard routes   3  get '/dashboard', to: 'dashboards#index_template'   <  get 'dashboards/user_counts', to: 'dashboards#user_counts'   >  get 'dashboards/crystal_ball', to: "dashboards#crystal_ball"         namespace :dashboards do   C    resources :suggested_links, only: [:index, :create, :update] do   %      get :card_info, on: :collection       end     end       6  # These are for omniauth, which we bypass for mobile   H  match '/auth/twitter/callback', to: 'authed_services#twitter_callback'   J  match '/auth/facebook/callback', to: 'authed_services#facebook_callback'   L  match '/auth/google_oauth2/callback', to: 'authed_services#gmail_callback'   @  match '/auth/contacts/callback', to: 'users#contacts_callback'         # Unsubscribing   3  get '/unsubscribe', to: 'unsubscribe#unsubscribe'   E  get '/unsubscribe_category', to: 'unsubscribe#unsubscribe_category'         # Libby school test   4  get '/schools/:school_name', to: 'statics#schools'         # Livestaging   U  match '/dashboards/deploy_info', to: 'dashboards#deploy_info', :as => 'deploy_info'   m  match '/dashboards/livestaging_deploys', to: 'dashboards#livestaging_deploys', :as => 'livestaging_deploys'       
  # Errors   0  get '/500', to: 'errors#internal_server_error'   $  get '/404', to: 'errors#not_found'   '  get '/401', to: 'errors#unauthorized'   )  get '/400', to: 'errors#not_acceptable'         # Resque monitoring   ,  mount Resque::Server.new, :at => "/resque"         # Mail View     if Rails.env.development?   $    mount MailPreview => 'mail_view'     end5�_�                            ����                                                                                                                                                                                                                                                                                                                                                 V       RB     �                 5�_�                           ����                                                                                                                                                                                                                                                                                                                                                 V       RB     �         	      ,  match '/*path', to: "rooms#index_template"5�_�                           ����                                                                                                                                                                                                                                                                                                                                                 V       RB     �      	   	      !  root to: "rooms#index_template"5�_�                          ����                                                                                                                                                                                                                                                                                                                                                 V       RB     �      	   	        root to: "#index_template"5�_�                            ����                                                                                                                                                                                                                                                                                                                                                 V       RB    �                    A  # so we can still use the helpers, but angular handles the urls   (  resources :friendships, only: [:index]5�_�      	                      ����                                                                                                                                                                                                                                                                                                                                                  V       RB�    �                 require 'resque/server'5�_�      
           	           ����                                                                                                                                                                                                                                                                                                                                                  V       RB��     �             5�_�   	              
          ����                                                                                                                                                                                                                                                                                                                                                  V       RB��    �             5�_�   
                        ����                                                                                                                                                                                                                                                                                                                                                  V       RB�     �                /  get 'partials/*partial' => 'partials#partial'5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V       RB�     �             5�_�                           ����                                                                                                                                                                                                                                                                                                                                                  V       RB�     �             5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V       RB�     �                 5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V       RB�    �                 5�_�                           ����                                                                                                                                                                                                                                                                                                                                                  V       RB��     �                 �             5�_�                           ����                                                                                                                                                                                                                                                                                                                                                  V       RB��    �             5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             RCT�     �         	    �                 resources :cards5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             RCU      �                   �         
    5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             RCU     �                 5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             RCU    �         
          post :upvotes5�_�                           ����                                                                                                                                                                                                                                                                                                                                                 V       RB     �      	   	        root to: "#rindex_template"5��