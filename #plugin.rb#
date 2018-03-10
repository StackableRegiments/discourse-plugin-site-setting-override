# name: discourse-plugin-unwise-authentication
# about: Authentication enabling self signup without email and administrator replacement password specification
# version: 0.0.1
# authors: Stackable Regiments

add_admin_route 'password_management.title', 'password-management'

Discourse::Application.routes.append do
  get '/admin/plugins/discourse-plugin-unwise-authentication' => 'admin/plugins#index', constraints: StaffConstraint.new
end
