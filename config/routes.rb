Typio::Application.routes.draw do
  resources :notes

  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  root :to => "home#index"
end
#== Route Map
# Generated on 08 Oct 2013 23:57
#
#               new_user_session GET        /users/sign_in(.:format)                  devise/sessions#new
#                   user_session POST       /users/sign_in(.:format)                  devise/sessions#create
#           destroy_user_session DELETE     /users/sign_out(.:format)                 devise/sessions#destroy
#                  user_password POST       /users/password(.:format)                 devise/passwords#create
#              new_user_password GET        /users/password/new(.:format)             devise/passwords#new
#             edit_user_password GET        /users/password/edit(.:format)            devise/passwords#edit
#                                PATCH      /users/password(.:format)                 devise/passwords#update
#                                PUT        /users/password(.:format)                 devise/passwords#update
#       cancel_user_registration GET        /users/cancel(.:format)                   devise_invitable/registrations#cancel
#              user_registration POST       /users(.:format)                          devise_invitable/registrations#create
#          new_user_registration GET        /users/sign_up(.:format)                  devise_invitable/registrations#new
#         edit_user_registration GET        /users/edit(.:format)                     devise_invitable/registrations#edit
#                                PATCH      /users(.:format)                          devise_invitable/registrations#update
#                                PUT        /users(.:format)                          devise_invitable/registrations#update
#                                DELETE     /users(.:format)                          devise_invitable/registrations#destroy
#              user_confirmation POST       /users/confirmation(.:format)             devise/confirmations#create
#          new_user_confirmation GET        /users/confirmation/new(.:format)         devise/confirmations#new
#                                GET        /users/confirmation(.:format)             devise/confirmations#show
#         new_admin_user_session GET        /admin/login(.:format)                    active_admin/devise/sessions#new
#             admin_user_session POST       /admin/login(.:format)                    active_admin/devise/sessions#create
#     destroy_admin_user_session DELETE|GET /admin/logout(.:format)                   active_admin/devise/sessions#destroy
#            admin_user_password POST       /admin/password(.:format)                 active_admin/devise/passwords#create
#        new_admin_user_password GET        /admin/password/new(.:format)             active_admin/devise/passwords#new
#       edit_admin_user_password GET        /admin/password/edit(.:format)            active_admin/devise/passwords#edit
#                                PATCH      /admin/password(.:format)                 active_admin/devise/passwords#update
#                                PUT        /admin/password(.:format)                 active_admin/devise/passwords#update
#                     admin_root GET        /admin(.:format)                          admin/dashboard#index
# batch_action_admin_admin_users POST       /admin/admin_users/batch_action(.:format) admin/admin_users#batch_action
#              admin_admin_users GET        /admin/admin_users(.:format)              admin/admin_users#index
#                                POST       /admin/admin_users(.:format)              admin/admin_users#create
#           new_admin_admin_user GET        /admin/admin_users/new(.:format)          admin/admin_users#new
#          edit_admin_admin_user GET        /admin/admin_users/:id/edit(.:format)     admin/admin_users#edit
#               admin_admin_user GET        /admin/admin_users/:id(.:format)          admin/admin_users#show
#                                PATCH      /admin/admin_users/:id(.:format)          admin/admin_users#update
#                                PUT        /admin/admin_users/:id(.:format)          admin/admin_users#update
#                                DELETE     /admin/admin_users/:id(.:format)          admin/admin_users#destroy
#                admin_dashboard GET        /admin/dashboard(.:format)                admin/dashboard#index
#    batch_action_admin_comments POST       /admin/comments/batch_action(.:format)    admin/comments#batch_action
#                 admin_comments GET        /admin/comments(.:format)                 admin/comments#index
#                                POST       /admin/comments(.:format)                 admin/comments#create
#                  admin_comment GET        /admin/comments/:id(.:format)             admin/comments#show
#                           root GET        /                                         home#index
