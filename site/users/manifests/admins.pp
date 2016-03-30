class users::admins{
  users::managed_user { 'jose':}
  users::managed_user { 'alice':}
  users::managed_user { 'chen':}
  
  group { "admins":
    ensure  => present,
    gid     => "1234",
  }
}
