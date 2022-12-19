
# Comment stub

define firewall_framework::tcp_allow (
  $port,
  $priority,
  $label = $name
  )
  {
    firewall { "${priority} tcp allow ${label}":
      state  => ['NEW'],
      dport  => $port,
      proto  => 'tcp',
      action => 'accept';
    }
  }
