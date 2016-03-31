class blog_platform {

  class { 'wordpress': require => User["wp_owner"],}
  class { 'apache': }
  class { '::apache::mod::php': }
  class { '::mysql::server': }

  mysql::db { 'wordpress':
    user     => 'wordpress',
    password => 'password',
    host     => 'localhost',
    grant    => ['SELECT', 'UPDATE', 'DELETE', 'INSERT'],
  }
  
  user { "wp_owner":
    ensure => present,
  }
}
