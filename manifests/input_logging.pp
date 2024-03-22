# @summary Add logging to the input firewall chain at a low priority.
class firewall_framework::input_logging {
  firewall { '998 log packets just before drop (from powelectrics/firewall_framework)':
    jump       => 'LOG',
    limit      => '2/min',
    log_prefix => '**SUSPECT**',
  }
}
