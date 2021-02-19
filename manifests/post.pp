# Configuration applied at the end of firewall update, after all other rules.
# From https://puppet.com/docs/puppet/7.4/quick_start_firewall.html
class firewall_framework::post {
  firewall { '999 drop all (powelectrics/firewall_framework)':
    proto  => 'all',
    action => 'drop',
    before => undef,
  }
}
