Veewee::Session.declare({
  :cpu_count => '1',
  :memory_size=> '2048',
  :disk_size => '22528',
  :disk_format => 'VDI',
  :hostiocache => 'off',
  :os_type_id => 'RedHat6_64',
  :iso_file => "CentOS-6.6-x86_64-netinstall.iso",
  :iso_src => "http://ftp.funet.fi/pub/mirrors/centos.org/6.6/isos/x86_64/CentOS-6.6-x86_64-netinstall.iso",
  :iso_md5 => "2342bc5ea72fc028972aa0f21cee28b4",
  :iso_download_timeout => 1000,
  :boot_wait => "10",
  :boot_cmd_sequence => [
    '<Tab> text ks=http://%IP%:%PORT%/ks.cfg<Enter>'
  ],
  :kickstart_port => "7122",
  :kickstart_timeout => 300,
  :kickstart_file => "ks.cfg",
  :ssh_login_timeout => "10000",
  :ssh_user => "vagrant",
  :ssh_password => "vagrant",
  :ssh_key => "",
  :ssh_host_port => "7222",
  :ssh_guest_port => "22",
  :sudo_cmd => "echo '%p'|sudo -S sh '%f'",
  :shutdown_cmd => "/sbin/halt -h -p",
  :postinstall_files => [
    "base.sh",
    "puppet.sh",
    "vagrant.sh",
    "virtualbox.sh",
    "cleanup.sh",
    "zerodisk.sh"
  ],
  :postinstall_timeout => 10000
})
