# name: discourse-plugin-unwise-authentication
# about: Authentication enabling self signup without email and administrator replacement password specification.  Sets password restrictions to dangerously lax.
# version: 0.0.1
# authors: Stackable Regiments

enabled_site_setting :unwise_authentication_enabled

add_admin_route 'unwise_authentication.title', 'password_override'

Discourse::Application.routes.append
get '/admin/plugins/password_override' => 'admin/plugins#index', constraints: StaffConstraint.new
do
