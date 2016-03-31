class { '::mysql::server': }
class { '::mysql::db': }
class { 'wordpress': require => User["wp_owner"],}
class { 'apache': }

user { "wp_owner":
  ensure => present,
}

class blog_platform {

  mysql::db { 'wordpress':
    user     => 'wordpress',
    password => 'password',
    host     => 'localhost',
    grant    => ['SELECT', 'UPDATE', 'DELETE', 'INSERT'],
  }
}
