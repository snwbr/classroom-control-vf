define users::managed_user (
    $group_id = "1234",
    $ssh_dir = "/home/${title}/.ssh"
 ) {
  user { "${title}":
    ensure  => present,
    home    => "/home/${title}",
  }
  file { "/home/${title}":
    ensure  => directory,
  }
}
