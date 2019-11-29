# @summary Installs the `choria-aaasvc` package
#
# @private
class choria_aaasvc::install {
  assert_private()

  $version = $choria_aaasvc::ensure ? {
    'present' => $choria_aaasvc::version,
    'absent' => 'absent'
  }

  package{$choria_aaasvc::package_name:
    ensure  => $version,
    require => Class["choria::repo"],
  }
}
