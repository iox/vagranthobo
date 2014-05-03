# Helpers

include apt

Exec { path => '/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin' }

exec { "apt-update":
  command => "apt-get update" }

exec { "install-bundler":
  command => "gem install bundler" }

exec { "install-hobo":
  command => 'gem install hobo',
  path => '/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin',
  timeout => 3600
}

exec { "set-up-postgres":
  command => 'service postgresql restart && su - postgres /bin/sh -c "createuser --superuser vagrant"',
  path => '/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin'
}

exec { "ruby-switch":
  command => "/usr/bin/ruby-switch --set ruby2.0" }

apt::ppa { 'ppa:brightbox/ruby-ng-experimental': }



# Packages
package { 'git-core' : }
package { 'build-essential' : }
package { 'libsqlite3-dev' : }
package { 'nodejs':}
package { 'ruby2.0' :
  require => Apt::Ppa['ppa:brightbox/ruby-ng-experimental']}
package { 'ruby2.0-dev' :
  require => Apt::Ppa['ppa:brightbox/ruby-ng-experimental']}
package { 'ruby-switch' :
  require => Apt::Ppa['ppa:brightbox/ruby-ng-experimental']}
package { 'libpq-dev':}
package { 'postgresql-9.1' : }
file { "/etc/postgresql/9.1/main/pg_hba.conf":
  ensure  => file,
  owner => root,
  group => root,
  mode => 644,
  source => "/vagrant/environment/pg_hba.conf"
}




# Ordering
Package['postgresql-9.1'] ->
File['/etc/postgresql/9.1/main/pg_hba.conf'] ->
Exec['set-up-postgres'] ->
Package['ruby2.0'] ->
Exec['ruby-switch'] ->
Exec['install-bundler'] ->
Exec['install-hobo']

Exec["apt-update"] -> Package <| |>