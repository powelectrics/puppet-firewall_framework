
# Comment stub

define firewall_framework::tcp_udp_allow (
  $port,
  $priority,
  $label=$name
  )
  {
    firewall_framework::tcp_allow {"tcp_allow_${name}":
      port     => $port,
      priority => $priority,
      label    => $label,
    }
    firewall_framework::udp_allow {"udp_allow_${name}":
      port     => $port,
      priority => $priority,
      label    => $label,
    }

  }
