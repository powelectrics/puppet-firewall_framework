
# Comment Stub

define firewall_framework::output_deny (
  $out_if = $name
)
{

  firewall { "002 output accept related established rules ${out_if}":
    chain    => 'OUTPUT',
    proto    => 'all',
    outiface => $out_if,
    state    => ['RELATED', 'ESTABLISHED'],
    action   => 'accept',
  }

  firewall { "900 drop all out ${out_if}":
    chain    => 'OUTPUT',
    state    => 'NEW',
    outiface => $out_if,
    proto    => 'all',
    action   => 'reject',
    before   => undef,
  }
  
}

