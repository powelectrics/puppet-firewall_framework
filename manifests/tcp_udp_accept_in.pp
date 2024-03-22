# @summary Accept a single port in from any address via any interface on both TCP and UDP protocols.
#
# @param port The single port number to allow
#
# @param priority 0-999 The priority of this allow in the chain; used to sort the fragments. TODO: This should render 000-999 as a string!
#
# @param label A comment for where the rule has come from. Defaults to this modules's name, which is rarely useful.
define firewall_framework::tcp_udp_accept_in (
  Integer $port,
  Integer $priority,
  String $label = $name,
) {
  firewall_framework::tcp_allow { "tcp_allow_${title}":
    port     => $port,
    priority => $priority,
    label    => $label,
  }
  firewall_framework::udp_allow { "udp_allow_${title}":
    port     => $port,
    priority => $priority,
    label    => $label,
  }
}
