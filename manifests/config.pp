# @summary Configures the Choria Server
#
# @private
class choria_aaasvc::config {
  assert_private()

  $config = $choria_aaasvc::config
  $choria_config = $choria_aaasvc::choria_config

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
}
