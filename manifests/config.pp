# @summary Configures the Choria Server
#
# @private
class choria_aaasvc::config {
  assert_private()

  # Ensure that the userlist file that we provision is also going to
  # be configured in the main config file
  $userlist_config = {
    'userlist_authenticator' => {
      'users_file' => $choria_aaasvc::userlist_file,
    }
  }
  $config = $choria_aaasvc::config + $userlist_config
  $choria_config = $choria_aaasvc::choria_config
  $user_config = $choria_aaasvc::user_config

  # Configure the various config files
  file{$choria_aaasvc::choria_config_file:
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0640',
    content => choria::hash2config($choria_config),
    notify  => Class['choria_aaasvc::service'],
    require => Class['choria_aaasvc::install']
  }
  file{$choria_aaasvc::config_file:
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0640',
    content => to_json_pretty($config),
    notify  => Class['choria_aaasvc::service'],
    require => Class['choria_aaasvc::install']
  }
  # The user list file is automatically reread if it's updated so we don't
  # need to restart the service
  file{$choria_aaasvc::userlist_file:
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0640',
    content => to_json_pretty($user_config),
    require => Class['choria_aaasvc::install']
  }
}
