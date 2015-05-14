# capybara install

```
Distribution     : Ubuntu 14.04.1 LTS
Capybara version : 2.4.4
dditional Notes  : In order to get a proper Ruby setup we build it from source
```
# Overview
Please read [requirements](https://github.com/georgewing/capybara/blob/master/requirements.md) for hardware and platform requirements.

### Important Notes

The following steps have been known to work and should be followed from up to bottom.
If you deviate from this guide, do it with caution and make sure you don't violate
any assumptions Capybara makes about its environment. 

**This guides assumes that you run every command as root.**

## If you find a bug

If you find a bug/error in this guide please submit an issue.

---

The Capybara installation consists of setting up the following components:

1. Install the operating system(Ubnutu 14.04.1) and Packages / Dependencies
1. Ruby
1. Capybara
1. Capybara-WebKit

----------

## 1. Installing the operating system (Ubnutu 14.04.1 LTS)
### Add Qt libraries

capybara-webkit depends on a WebKit implementation from Qt, a cross-platform development
toolkit. You need to download the Qt libraries to build and install the gem. You can find instructions
for downloading and installing QT on the [capybara-webkit wiki](https://github.com/thoughtbot/capybara-webkit/wiki/Installing-Qt-and-compiling-capybara-webkit). capybara-webkit requires Qt version 4.8 or higher.

### Install the required tools for Capybara

    apt-get update
    apt-get upgrade

### Install Git from Source (optional)

Make sure Git is version 1.7.10 or higher, for example 1.7.12 or 1.8.4

    git --version

If not, install it from source. First remove the system Git:

    apt-get remove git

Install ths pre-requisite files for Git compilation:

    apt-get install openssl

Download and extract it:

    mkdir /tmp/git && cd /tmp/git
    curl --progress https://www.kernel.org/pub/software/scm/git/git-2.1.3.tar.gz | tar xz
    cd git-2.1.3/
    ./configure
    make
    make prefix=/usr/local install

Make sure Git is in your `$PATH`:

    which git

You might have to logout and login again for the `$PATH` to take effect.

---------

## 2. Ruby

The use of ruby version managers such as [RVM](http://rvm.io).

Remove the old Ruby 1.8 package if present.

    apt-get remove ruby

Remove any other Ruby build if it is still present:

    cd <your-ruby-source-path>
    make install

Download Ruby and compile it:

    mkdir /tmp/ruby && cd /tmp/ruby
    curl --progress ftp://ftp.ruby-lang.org/pub/ruby/2.1/ruby-2.1.2.tar.gz | tar xz
    cd ruby-2.1.2
    ./configure --disable-install-rdoc
    make
    make prefix=/usr/local install

Install the Bundler Gem:

    gem install bundler --no-doc

Make sure OpenSSL is installed, installing OpenSSL by the usual way:

    apt-get install openssl

### Try rebuild Ruby
Got to Ruby directory and typed the following lines:

    pushd ext/openssl
    ruby extconf.rb
    make
    make install
    popd

All dependencies issues and stuff solved, then running:

    ./configure
    make
    make install

Rebuild Ruby finally.

## 3. Capybara

Install Capybara:

    gem intall capybara

## 4. Capybara-WebKit

Add the capybara-webkit gem to your Gemfile:

    gem 'capybara-webkit'

### Installing Qt:

    apt-get install qt5-default libqt5webkit5-dev

If you're on a fresh install of Ubuntu 14.04 you'll also need:

    apt-get install g++

Note that the version Qt distributed with Ubuntu 10.04 is not compatible with 
capybara-webkit >= 0.14. But, you can compile Qt from source following this 
[instructions](http://qt-project.org/doc/qt-4.8/install-x11.html).

    apt-get install libqt4-dev

