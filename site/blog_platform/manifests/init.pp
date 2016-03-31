class { '::mysql::server': }
class { '::mysql::db': }


user { "wp_owner":
  ensure => present,
}

class blog_platform {

  class { 'wordpress': require => User["wp_owner"],}
  class { 'apache': }

  mysql::db { 'wordpress':
    user     => 'wordpress',
    password => 'password',
    host     => 'localhost',
    grant    => ['SELECT', 'UPDATE', 'DELETE', 'INSERT'],
  }
}
