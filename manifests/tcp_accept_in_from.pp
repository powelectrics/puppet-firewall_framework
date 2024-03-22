# @summary Accept a single TCP port in from a defined address via any interface.
#
# @param port The single port number to allow
#
# @param priority 0-999 The priority of this allow in the chain; used to sort the fragments. TODO: This should render 000-999 as a string!
#
# @param source The source from which the traffic is accepted.
#
# @param label A comment for where the rule has come from. Defaults to this modules's name, which is rarely useful.
define firewall_framework::tcp_accept_in_from (
  Integer $port,
  Integer $priority,
  String $source,
  String $label = $name
) {
  $proto = 'tcp'
  firewall { "${priority} Accept ${port}/${proto} in from ${source} ${label}":
    state  => ['NEW'],
    dport  => $port,
    proto  => $proto,
    source => $source,
    action => 'accept';
  }
}
