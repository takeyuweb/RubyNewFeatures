require 'aws-sdk'
require 'optparse'
require 'pp'

lightsail = Aws::Lightsail::Client.new

OptionParser.new do |opt|
  opt.on('--get_blueprints') do
    resp = lightsail.get_blueprints
    p resp.blueprints.map(&:blueprint_id)
    # => ["amazon_linux_2016_09_0", "ubuntu_16_04", "wordpress_4_6_1", "lamp_5_6_27", "nodejs_6_9_1", "joomla_3_6_3", "magento_2_1_2", "mean_3_2_10", "drupal_8_2_1", "gitlab_8_12_6", "redmine_3_3_1", "nginx_1_10_2"]
  end
  opt.on('--get_bundles') do
    resp = lightsail.get_bundles
    p resp.bundles.map(&:bundle_id)
    # => ["nano_1_0", "micro_1_0", "small_1_0", "medium_1_0", "large_1_0"]
  end
  opt.on('--create_instances') do
    resp = lightsail.create_instances(
        instance_names: %w(vps1 vps2 vps3),
        availability_zone: 'us-east-1a',
        blueprint_id: 'lamp_5_6_27',
        bundle_id: 'nano_1_0',
    )
    pp resp.operations
  end
  opt.on('--get_instance_state=INSTANCE_NAME') do |instance_name|
    resp = lightsail.get_instance_state(
        instance_name: instance_name
    )
    p resp.state
    # => #<struct Aws::Lightsail::Types::InstanceState code=16, name="running">
  end
  opt.on('--get_instance=INSTANCE_NAME') do |instance_name|
    resp = lightsail.get_instance(
        instance_name: instance_name
    )
    pp resp.instance
=begin
#<struct Aws::Lightsail::Types::Instance
 name="vps1",
 arn=
  "arn:aws:lightsail:us-east-1:764044168140:Instance/1eb1f2d7-d6b0-40ce-a023-XXXXXXXXXXXX",
 support_code="775094070140/i-XXXXXXXXXXXXXXXXX",
 created_at=2016-12-01 21:56:57 +0900,
 location=
  #<struct Aws::Lightsail::Types::ResourceLocation
   availability_zone="us-east-1a",
   region_name="us-east-1">,
 resource_type="Instance",
 blueprint_id="lamp_5_6_27",
 blueprint_name="LAMP Stack",
 bundle_id="nano_1_0",
 is_static_ip=false,
 private_ip_address="172.XX.XX.XXX",
 public_ip_address="54.XXX.XXX.XX",
 ipv6_address=nil,
 hardware=
  #<struct Aws::Lightsail::Types::InstanceHardware
   cpu_count=1,
   disks=nil,
   ram_size_in_gb=0.5>,
 networking=
  #<struct Aws::Lightsail::Types::InstanceNetworking
   monthly_transfer=
    #<struct Aws::Lightsail::Types::MonthlyTransfer
     gb_per_month_allocated=1000>,
   ports=
    [#<struct Aws::Lightsail::Types::InstancePortInfo
      from_port=80,
      to_port=80,
      protocol="tcp",
      access_from="Anywhere (0.0.0.0/0)",
      access_type="public",
      common_name="",
      access_direction="inbound">,
     #<struct Aws::Lightsail::Types::InstancePortInfo
      from_port=22,
      to_port=22,
      protocol="tcp",
      access_from="Anywhere (0.0.0.0/0)",
      access_type="public",
      common_name="",
      access_direction="inbound">,
     #<struct Aws::Lightsail::Types::InstancePortInfo
      from_port=443,
      to_port=443,
      protocol="tcp",
      access_from="Anywhere (0.0.0.0/0)",
      access_type="public",
      common_name="",
      access_direction="inbound">]>,
 state=#<struct Aws::Lightsail::Types::InstanceState code=16, name="running">,
 username="bitnami",
 ssh_key_name="LightsailDefaultKeyPair">
=end
  end
  opt.on('--get_instance_access_details=INSTANCE_NAME, PROTOCOL', Array) do |instance_name, protocol|
    resp = lightsail.get_instance_access_details(
        instance_name: instance_name,
        protocol: protocol
    )
    pp resp.access_details
=begin
#<struct Aws::Lightsail::Types::InstanceAccessDetails
 cert_key=
  "ssh-rsa-cert-v01@openssh.com 共有鍵",
 expires_at=nil,
 ip_address="XXX.XXX.XXX.XXX",
 password=nil,
 private_key=
  "-----BEGIN RSA PRIVATE KEY-----\n秘密鍵\n-----END RSA PRIVATE KEY-----\n",
 protocol="ssh",
 instance_name="vps1",
 username="bitnami">
=end
  end

  opt.on('--stop_instance=INSTANCE_NAME') do |instance_name|
    resp = lightsail.stop_instance(
        instance_name: instance_name
    )
    pp resp.operations
  end

  opt.on('--start_instance=INSTANCE_NAME') do |instance_name|
    resp = lightsail.start_instance(
        instance_name: instance_name
    )
    pp resp.operations
  end

  opt.on('--create_instance_snapshot=INSTANCE_NAME,INSTANCE_SNAPSHOT_NAME', Array) do |instance_name, snapshot_name|
    res = lightsail.create_instance_snapshot(
        instance_name: instance_name,
        instance_snapshot_name: snapshot_name
    )
    pp res.operations
  end

  opt.on('--get_instance_snapshot=INSTANCE_SNAPSHOT_NAME') do |snapshot_name|
    res = lightsail.get_instance_snapshot(
        instance_snapshot_name: snapshot_name
    )
    pp res.instance_snapshot
  end

  opt.on('--get_instance_snapshots') do
    res = lightsail.get_instance_snapshots()
    pp res.instance_snapshots
    pp res.next_page_token
  end

  opt.on('--create_instances_from_snapshot=INSTANCE_SNAPSHOT_NAME') do |snapshot_name|
    resp = lightsail.create_instances_from_snapshot(
        instance_names: %w(vps4 vps5),
        availability_zone: 'us-east-1a',
        instance_snapshot_name: snapshot_name,
        bundle_id: 'nano_1_0',
    )
    pp resp.operations
  end

  opt.on('--delete_instance_snapshot=INSTNACE_SNAPSHOT_NAME') do |snapshot_name|
    res = lightsail.delete_instance_snapshot(
        instance_snapshot_name: snapshot_name
    )
    pp res.operations
  end

  opt.on('--get_instance_port_states=INSTANCE_NAME') do |instance_name|
    res = lightsail.get_instance_port_states(
        instance_name: instance_name
    )
    pp res.port_states
  end

  opt.on('--open_instance_public_ports=INSTANCE_NAME') do |instance_name|
    res = lightsail.open_instance_public_ports(
        instance_name: instance_name,
        port_info: {
            from_port: 8000,
            to_port: 8080,
            protocol: 'tcp'
        }
    )
    pp res.operation
  end

  opt.on('--close_instance_public_ports=INSTANCE_NAME') do |instance_name|
    res = lightsail.close_instance_public_ports(
        instance_name: instance_name,
        port_info: {
            from_port: 8000,
            to_port: 8080,
            protocol: 'tcp'
        }
    )
    pp res.operation
  end

  opt.on('--allocate_static_ip') do
    resp = lightsail.allocate_static_ip(
        static_ip_name: 'sample'
    )
    pp resp.operations
  end

  opt.on('--attach_static_ip') do
    resp = lightsail.attach_static_ip(
        static_ip_name: 'sample',
        instance_name: 'vps1'
    )
    pp resp.operations
  end

  opt.on('--detach_static_ip') do
    resp = lightsail.detach_static_ip(
        static_ip_name: 'sample'
    )
    pp resp.operations
  end

  opt.on('--release_static_ip') do
    resp = lightsail.release_static_ip(
        static_ip_name: 'sample'
    )
    pp resp.operations
  end

  opt.on('--get_static_ip') do
    resp = lightsail.get_static_ip(
        static_ip_name: 'sample'
    )
    pp resp.static_ip
  end

  opt.on('--get_static_ips') do
    resp = lightsail.get_static_ips()
    pp resp.static_ips
    pp resp.next_page_token
  end

  opt.on('--create_domain=DOMAIN_NAME') do |domain_name|
    res = lightsail.create_domain(
        domain_name: domain_name,
    )
    pp res.operation
  end

  opt.on('--get_domain=DOMAIN_NAME') do |domain_name|
    resp = lightsail.get_domain(
        domain_name: domain_name
    )
    pp resp.domain
  end

  opt.on('--create_domain_entry=DOMAIN_NAME') do |domain_name|
    ip_address =
        lightsail.get_instance(instance_name: 'vps1').instance.public_ip_address
    res = lightsail.create_domain_entry(
        domain_name: domain_name,
        domain_entry: {
            id: "sub.#{domain_name}",
            name: "sub.#{domain_name}",
            target: ip_address,
            type: 'A' # A, CNAME, MX, and TXT
        }
    )
    pp res.operation
  end

  opt.on('--delete_domain=DOMAIN_NAME') do |domain_name|
    res = lightsail.delete_domain(
        domain_name: domain_name
    )
    pp res.operation
  end

  opt.on('--delete_domain_entry=DOMAIN_NAME') do |domain_name|
    domain_entry =
        lightsail.
            get_domain(domain_name: domain_name).
            domain.domain_entries.select { |entry| entry.type == 'A' }.first
    res = lightsail.delete_domain_entry(
        domain_name: domain_name,
        domain_entry: domain_entry
    )
    pp res.operation
  end

  opt.on('--get_domain=DOMAIN_NAME') do |domain_name|
    res = lightsail.get_domain(
        domain_name: domain_name,

    )
    pp res.domain
  end

  opt.on('--get_domains') do
    res = lightsail.get_domains()
    pp res.domains
  end

  opt.on('--get_domain=DOMAIN_NAME') do |domain_name|
    res = lightsail.get_domain(
        domain_name: domain_name,

    )
    pp res.domain
  end

  opt.parse!(ARGV)
end
