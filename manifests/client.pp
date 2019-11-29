# @summary Configure an MCO client to interact with the Choria AAA svc
#
# @example
#   include choria_aaasvc::client
class choria_aaasvc::client (
  Hash $config
){
  $client_files = ['application/login.rb']
  mcollective::module_plugin{'login':
    config_name   => 'login',
    client_files  => $client_files,
    server_files  => [],
    client_config => $config,
  }
}
