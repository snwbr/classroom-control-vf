#class { 'mysql::server': }

class { '::mysql::server': }

class { 'wordpress': 
  require => User["wp_owner"],
}

class { 'apache': }


class blog_platform {

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
