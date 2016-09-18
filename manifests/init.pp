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

  # Workaround for gruvbox submodule error in amix' repository
  exec { 'clone_repo':
    command  => 'git clone git://github.com/amix/vimrc.git .vim_runtime',
    provider => 'shell',
    cwd      => '/tmp',
  } ->

  file { $install_location:
    ensure  => 'directory',
    recurse => true,
    source  => "file:///tmp/.vim_runtime",
  } ->

  file { 'remove_install_dir':
    ensure  => absent,
    path    => '/tmp/.vim_runtime',
    recurse => true,
    purge   => true,
    force   => true,
  } ->

  exec { 'install_ultimate_vimrc':
    command  => "/bin/bash ${install_location}/install_${version}_vimrc.sh",
    provider => 'shell',
    cwd      => $install_location,
  }
}
