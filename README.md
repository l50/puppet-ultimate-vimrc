puppet-ultimate_vimrc
===================
[![License](http://img.shields.io/:license-mit-blue.svg)](http://doge.mit-license.org)

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is
   useful](#module-description)
3. [Setup - The basics of getting started with discover](#setup)
    * [Setup requirements](#setup-requirements)
    * [Installing ultimate_vimrc](#installing-ultimate_vimrc)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

Used to install [ultimate_vimrc](https://github.com/amix/vimrc) on Kali
Linux.

## Module Description

This module will configure vim with the ultimate_vimrc configuration
package.

## Setup

### Setup Requirements

The following puppet modules are required for this module to work
properly. Please add them to your Puppetfile like so:

```
mod 'puppetbs-stdlib'
mod 'puppetlabs/git'
mod 'puppetlabs/vcsrepo'
```

### Installing ultimate_vimrc

Simply specify the directory you wish the ultimate_vimrc configuration
files to be installed in as a parameter and run the module as you would
any other.

## Usage
Install the awesome ultimate_vimrc configuration for the root user:
```
class { 'ultimate_vimrc':
  install_location => '/root/.vim_runtime',
  version => 'awesome',
}
```
Install the basic ultimate_vimrc configuration for the root user:
```
class { 'ultimate_vimrc':
  install_location => '/root/.vim_runtime',
  version => 'basic',
}
```

## Limitations

This has been tested on Kali only.

## Development

Feel free to fork this up and issue a pull request if you want to
improve on the
work that has already been done.

## Release Notes/Contributors/Etc

Jayson Grace (l50) <jayson.e.grace@gmail.com>
