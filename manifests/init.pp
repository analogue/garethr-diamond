# == Class: diamond
#
# A basic module to manage diamond, stats collection daemon for Graphite
#
# === Parameters
# [*version*]
#   The package version to install
#
# [*enable*]
#   Should the service be enabled during boot time?
#
# [*start*]
#   Should the service be started by Puppet
#
# [*interval*]
#   How often should metrics be collected and sent to Graphite
#
# [*extra_handlers*]
#   Additional handlers to include in configuration
#
# [*graphite_host*]
#   Where to find the graphite server
#
# [*graphite_handler*]
#   Which handler to use to talk with graphite server
#
# [*stats_host*]
#   Where to find the stats server
#
# [*stats_port*]
#   What port to connect to the stats server
#
# [*librato_user*]
#   Your Librato username
#
# [*librato_apikey*]
#   Your Librato apikey
#
# [*riemann_host*]
#   Where to find the riemann server
#
# [*path_prefix*]
#   Define optional path_prefix for storing metrics
#
# [*path_suffix*]
#   Define optional path_suffix for storing metrics
#
class diamond(
  $version          = 'present',
  $enable           = true,
  $start            = true,
  $interval         = 30,
  $librato_user     = false,
  $librato_apikey   = false,
  $graphite_host    = false,
  $graphite_handler = 'graphite.GraphiteHandler',
  $graphite_port    = '2003',
  $pickle_port      = '2004',
  $riemann_host     = false,
  $stats_host       = '127.0.0.1',
  $stats_port       = 8125,
  $path_prefix      = undef,
  $path_suffix      = undef,
  $logger_level     = 'WARNING',
  $rotate_level     = 'WARNING',
  $extra_handlers   = [],
) {
  class{'diamond::install': } ->
  class{'diamond::config': } ~>
  class{'diamond::service': } ->
  Class['diamond']
}
