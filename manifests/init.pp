# == Class: motd
#
# Module to manage motd
#
class motd (

) {
  case $::role {
    'puppetmaster': {
     notify { 'I am the puppet master': }
     $msg = 'Puppet Master'
    }
      'webserver': {
        $msg = 'Web Server'
      }
      default: {
        fail ("My role is <${::role}>, I am only meant to work on puppetmasters and webservers.")
      }
  }
  #$motd_banner = $::role ? {
  #  'puppetmaster' => 'Puppet Master',
  #  'webserver'    => 'Web Servers',
  #  default        => 'some node',

  #  $motd_banner = 'Have a great day!!!!!!!!!!!!!!!!!'

  file { '/etc/motd':
    ensure  => file,
    #source => 'puppet:///modules/motd/motd',
    content => $msg,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }
}
