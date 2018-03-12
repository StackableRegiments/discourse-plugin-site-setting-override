# name: discourse-plugin-unwise-authentication
# about: Authentication enabling self signup without email and administrator replacement password specification.  Sets password restrictions to dangerously lax.
# version: 0.0.1
# authors: Stackable Regiments

enabled_site_setting :unwise_authentication

def setMin(field,min)
  puts("Finding field",field)
  f = SiteSetting.find_by(name: field)
  puts(f.instance_methods)
  puts(f.methods)
  #f.min = min
  f.value = min
  f.save!
end


after_initialize do
  setMin('min_password_length',1)
  setMin('min_admin_password_length',1)
  SiteSetting.block_common_passwords = false
end
