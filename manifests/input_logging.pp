
# Comment stub
class firewall_framework::input_logging {
  firewall { "998 logging":
    jump => 'LOG',
    limit => '2/min',
    log_prefix => '**SUSPECT**';
  }
}
