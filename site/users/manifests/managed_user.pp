define users::managed_user (
    $group_id = "1234",
    $ssh_dir = "/home/${title}/.ssh"
 ) {
  user { "${title}":
    ensure  => present,
    home    => "/home/${title}",
    gid     => "${group_id}",
  }
  file { "/home/${title}":
    ensure  => directory,
  }
}
