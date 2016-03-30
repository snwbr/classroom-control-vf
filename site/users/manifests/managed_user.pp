define users::managed_user (
    $group_id = "1000",
    $ssh_dir = "/home/${title}/.ssh"
 ) {
  user { "${title}":
    ensure  => file,
    home    => "/home/${title}",
  }
}
