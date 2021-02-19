# Configuration applied at the start of firewall update, before any other rules.
# From https://puppet.com/docs/puppet/7.4/quick_start_firewall.html
class firewall_framework::pre {
  Firewall {
    require => undef,
  }
  firewall { '000 accept all icmp (powelectrics/firewall_framework)':
    proto  => 'icmp',
    action => 'accept',
  }
  firewall { '001 accept all to lo interface (powelectrics/firewall_framework)':
    proto   => 'all',
    iniface => 'lo',
    action  => 'accept',
  }
  firewall { '002 reject local traffic not on loopback interface (powelectrics/firewall_framework)':
    iniface     => '! lo',
    proto       => 'all',
    destination => '127.0.0.1/8',
    action      => 'reject',
  }
  firewall { '003 accept related established rules (powelectrics/firewall_framework)':
    proto  => 'all',
    state  => ['RELATED', 'ESTABLISHED'],
    action => 'accept',
  }
}
