# @summary Configuration applied at the end of firewall update, after all other rules.
#
# @param default_reject_output If true, add a rule that drops all as the last entry on the output chain.
#
# From https://puppet.com/docs/puppet/7.4/quick_start_firewall.html
class firewall_framework::post (
  Boolean $default_reject_output = false,
) {
  firewall { '999 drop all (powelectrics/firewall_framework)':
    proto  => 'all',
    action => 'drop',
    before => undef,
  }

  if $default_reject_output {
    firewall { '999 reject all out':
      chain  => 'OUTPUT',
      state  => 'NEW',
      proto  => 'all',
      action => 'reject',
    }
  }
}
