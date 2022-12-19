
# Comment stub

define firewall_framework::udp_allow (
  $port,
  $priority,
  $label=$name
  )
  {
    firewall { "${priority} udp allow ${label}":
      dport  => $port,
      proto  => 'udp',
      action => 'accept',
    }
  }
