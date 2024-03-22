# @summary Configuration applied at the start of firewall update, before any other rules.
#
# @param default_reject_output If true, add a rule that accepts established/related as the first entry on the output chain
#   in preparation for a reject-all at the end.
#
# From https://puppet.com/docs/puppet/7.4/quick_start_firewall.html
class firewall_framework::pre (
  Boolean $default_reject_output = false,
) {
  Firewall {
    require => undef,
  }
  firewall { '000 accept all icmp (powelectrics/firewall_framework)':
    proto  => 'icmp',
    action => 'accept',
  }
  firewall { '001 accept all from loopback interface (powelectrics/firewall_framework)':
    proto   => 'all',
    iniface => 'lo',
    action  => 'accept',
  }
  firewall { '002 reject local traffic not on loopback interface (powelectrics/firewall_framework)':
    iniface     => '! lo',
    proto       => 'all',
    destination => '127.0.0.0/8',
    action      => 'reject',
  }
  firewall { '003 accept related established rules (powelectrics/firewall_framework)':
    proto  => 'all',
    state  => ['RELATED', 'ESTABLISHED'],
    action => 'accept',
  }

  if $default_reject_output {
    firewall { '000 accept all icmp (powelectrics/firewall_framework)':
      chain  => 'OUTPUT',
      proto  => 'icmp',
      action => 'accept',
    }
    firewall { '001 accept all to loopback interface (powelectrics/firewall_framework)':
      chain   => 'OUTPUT',
      proto   => 'all',
      iniface => 'lo',
      action  => 'accept',
    }
    firewall { '003 accept related established rules (powelectrics/firewall_framework)':
      chain  => 'OUTPUT',
      proto  => 'all',
      state  => ['RELATED', 'ESTABLISHED'],
      action => 'accept',
    }
  }
}
