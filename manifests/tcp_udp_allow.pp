
# Comment stub

define firewall_framework::tcp_udp_allow (
  $port,
  $priority,
  $label=$name
  )
  {
    my_fw::tcp_allow {"tcp_allow_${name}":
      port     => $port,
      priority => $priority,
      label    => $label,
    }
    my_fw::udp_allow {"udp_allow_${name}":
      port     => $port,
      priority => $priority,
      label    => $label,
    }

  }
