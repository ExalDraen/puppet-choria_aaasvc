# @summary Configure an MCO client to interact with the Choria AAA svc
#
# @example
#   include choria_aaasvc::client
class choria_aaasvc::client {

  # Install the `login` application for mco to allow users to log in
  # to AAA
  $libdir = lookup('mcollective::libdir')
  $file = 'application/login.rb'
  file{"${libdir}/mcollective/${file}":
    ensure => 'present',
    source => "puppet:///modules/${module_name}/mcollective/${file}",
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }

}
