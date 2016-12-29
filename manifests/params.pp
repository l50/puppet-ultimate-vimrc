class ultimate_vimrc::params {
  case $::osfamily {
    'Debian': {
      $install_location='/root/.vim_runtime'
      $module_install_location="${install_location}/sources_non_forked"
      $version='awesome'
      $additional_modules={'vim-puppet' => 'git://github.com/rodjek/vim-puppet.git'}
    }
    default: {
      fail("Unsupported OS family: ${::osfamily}")
    }
  }
}
