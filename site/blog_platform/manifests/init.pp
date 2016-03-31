class blog_platform {
  
  class { 'mysql::server': }
  
  class { 'wordpress': 
    require => User["wp_owner"],
  }
  class { 'apache': }
  
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
