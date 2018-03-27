# name: discourse-plugin-unwise-authentication
# about: Sets password restrictions to dangerously lax.
# version: 0.0.1
# authors: Stackable Regiments

enabled_site_setting :unwise_authentication_enabled


after_initialize do
register_asset "stylesheets/incognito.scss"
  SessionController.class_eval do

    skip_before_action :check_xhr

    def temporary_user
      username = UserNameSuggester.suggest(I18n.t(:anonymous).downcase)
      user = User.create!(
        password: SecureRandom.hex,
        email: "#{SecureRandom.hex}@anon.#{Discourse.current_hostname}",
        skip_email_validation:true,
        name:username,
        username:username,
        active:true,
        trust_level:1,
        manual_locked_trust_level:1,
        approved:true,
        approved_at:1.day.ago,
        created_at:1.day.ago
      )
      user.user_option.update_columns(
        email_private_messages:false,
        email_digests:false
      )
      user.email_tokens.update_all(confirmed: true)
      user.activate

      user.reload
      log_on_user(user)

      redirect_to "/"
    end
  end

  Discourse::Application.routes.append do
    get '/temporary_user' => 'session#temporary_user'
  end

end
