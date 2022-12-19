
define firewall_framework::tcp_allow_from (
  $port,
  $priority,
  $label = $name,
  $source,
  )
  {
    firewall { "${priority} tcp allow ${label}":
      state  => ['NEW'],
      dport  => $port,
      proto  => 'tcp',
      action => 'accept',
      source => $source,
    }
  }
