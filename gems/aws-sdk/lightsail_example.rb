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

  opt.parse!(ARGV)
end
