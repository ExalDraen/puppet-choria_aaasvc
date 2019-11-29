# @summary Installs, configures and manages the Choria AAA system
#
# @param config_file The main choria AAA configuration file
# @param choria_config_file The AAA svc choria config file
# @param config The configuration for AAA svc
# @param choria_config The choria side configuration for AAA svc
# @param ensure Add or remove the software
# @param package_name The package to install
# @param service_name Name of the choria AAA service
# @param version The version of Choria AAA to install
#
# @example
#   include choria_aaasvc
class choria_aaasvc (
  Stdlib::Compat::Absolute_path $choria_config_file,
  Stdlib::Compat::Absolute_path $config_file,
  Hash $config,
  Hash $choria_config,
  Enum['present', 'absent'] $ensure,
  String $package_name,
  String $service_name,
  String $version,
){
  class{'choria_aaasvc::install': }
  -> class{'choria_aaasvc::config': }
  -> class{'choria_aaasvc::service': }

  contain choria_aaasvc::install
  contain choria_aaasvc::service
}
