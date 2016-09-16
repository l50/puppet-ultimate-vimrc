# Class: ultimate_vimrc
# ===========================
#
# Used to install either the awesome or basic version of the amix ultimate vimrc configuration on Kali.
#
# Parameters
# ----------
#
# * `install_location`
# The directory where you want to store the ultimate vimrc config files.
#
# * `version`
# Specify either the awesome version or the basic version to install.
#
# Requirements
# --------
#
# puppetlabs-stdlib - https://github.com/puppetlabs/puppetlabs-stdlib
# puppetlabs-vcsrepo - https://github.com/puppetlabs/puppetlabs-vcsrepo
#
# Examples
# --------
#
#    class { 'ultimate_vimrc':
#      install_location => '/root/.vim_runtime',
#      version => 'awesome',
#    }
#
#    class { 'ultimate_vimrc':
#     install_location => '/root/.vim_runtime',
#     version => 'basic',
#    }
#
# Authors
# -------
#
# Jayson Grace (l50) <jayson.e.grace@gmail.com>
#
# Copyright
# ---------
#
# Copyright 2016 Jayson Grace (l50)
#
class ultimate_vimrc(
  $install_location=$ultimate_vimrc::params::install_location,
  $version=$ultimate_vimrc::params::version,
) inherits ultimate_vimrc::params {

  include stdlib
  include git

  vcsrepo { $install_location:
    ensure      => present,
    provider    => git,
    source      => 'git://github.com/amix/vimrc.git',
    require     => Class['git'],
  } ->

  file { "${install_location}/install_${version}_vimrc.sh":
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  } ->

  exec { 'install ultimate_vimrc':
    command  => "${install_location}/install_${version}_vimrc.sh",
    provider => 'shell',
    cwd      => $install_location,
  }
}
