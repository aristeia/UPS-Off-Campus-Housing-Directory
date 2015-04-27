Rails.application.config.middleware.use OmniAuth::Builder do

  # configure the shibboleth 'strategy' in OmniAuth:
  provider :shibboleth, {
    :shib_session_id_field     => "Shib-Session-ID",
    :shib_application_id_field => "Shib-Application-ID",
    :debug                     => false,
    :extra_fields => [
      :memberOf #nonstandard detail recorded here as well
    ],
    :info_fields => {
      :uid => "sAMAccountName",
      :name => "sAMAccountName",
      :email    => "mail",
      :last_name  => "surname",
      :first_name => "givenName",
      :memberOf => "memberOf"
    }
  }

end