# puppet-lint no file resource path attributes

Extends puppet-lint to ensure all file resources use the resource
title to indicate the file to manage rather than a symbolic name
and the `path` attribute.

[![Actions Status](https://github.com/deanwilson/puppet-lint-no_file_path_attribute-check/workflows/Ruby/badge.svg)](https://github.com/deanwilson/puppet-lint-no_file_path_attribute-check/actions)

Instead of this:

    class path_attribute {
      file { 'ssh_config_file':
        path    => '/etc/ssh/sshd_config',
        content => 'Bad path attribute, bad.',
      }
    }

I think, and this check complains unless, you use this format:

    class good_namevar {
      file { '/etc/ssh/sshd_config':
        content => 'Good namevar',
      }
    }

There is nothing technically wrong with the first form but I'd rather
know what the resource type is, and what it manages, without having to read further in to the resouece.
Oddly I have no issues with `exec` resources with `command` attributes being
[written in this style](http://www.puppetcookbook.com/posts/nicer-exec-names.html).

## Installation

To use this plugin add the following line to your Gemfile

    gem 'puppet-lint-no_file_path_attribute-check'

and then run `bundle install`.

## Usage

This plugin provides a new check to `puppet-lint`.

    file resources should not have a path attribute. Use the title instead

## Other puppet-lint plugins

You can find a list of my `puppet-lint` plugins in the
[unixdaemon puppet-lint-plugins](https://github.com/deanwilson/unixdaemon-puppet-lint-plugins) repo.

### Author
[Dean Wilson](http://www.unixdaemon.net)
