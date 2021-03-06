Veewee::Session.declare({
  :cpu_count => '1',
  :memory_size=> '1024',
  :disk_size => '30140',
  :disk_format => 'VDI',
  :hostiocache => 'off',
  :os_type_id => 'Oracle_64',
  :iso_file => "OracleLinux-R7-U1-Server-x86_64-dvd.iso",
  :iso_src => "http://mirrors.wimmekes.net/pub/OL7/iso/OracleLinux-R7-U2-Server-x86_64-dvd.iso",
  :iso_md5 => "3b9d65d26576921372b1b35b03fd791d",
  :iso_download_timeout => 1000,
  :boot_wait => "10",
  :boot_cmd_sequence => [
    '<Tab> text ks=http://%IP%:%PORT%/ks.cfg<Enter>'
  ],
  :kickstart_port => "7122",
  :kickstart_timeout => 300,
  :kickstart_file => "ks.cfg",
  :ssh_login_timeout => "10000",
  :ssh_user => "veewee",
  :ssh_password => "veewee",
  :ssh_key => "",
  :ssh_host_port => "7222",
  :ssh_guest_port => "22",
  :sudo_cmd => "echo '%p' | sudo -S sh '%f'",
  :shutdown_cmd => "/sbin/halt -h -p",
  :postinstall_files => [
    "proxy.sh",
    "base.sh",
    #"provision.sh",
    "vagrant.sh",
    "virtualbox.sh",
    "cleanup.sh",
    "zerodisk.sh"
  ],
  :postinstall_timeout => 10000
})
