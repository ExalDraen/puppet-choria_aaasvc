# @summary Manages the `aaasvc` service
#
# @private
# @api private
class choria_aaasvc::service {
  assert_private()

  service{$choria_aaasvc::service_name:
    ensure => 'running',
    enable => true
  }
}
