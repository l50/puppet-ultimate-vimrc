class ultimate_vimrc::params {
  case $::osfamily {
    'Debian': {
      $install_location='/root/.vim_runtime'
      $version='awesome'
    }
    default: {
      fail("Unsupported OS family: ${::osfamily}")
    }
  }
}
