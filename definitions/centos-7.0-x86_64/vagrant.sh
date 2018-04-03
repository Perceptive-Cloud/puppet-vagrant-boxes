# centos specific
date > /etc/centos_box_build_time

# Add centos user
/usr/sbin/groupadd centos
/usr/sbin/useradd centos -g centos -G wheel
echo "centos"|passwd --stdin centos
echo "centos        ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers.d/centos
chmod 0440 /etc/sudoers.d/centos

# Installing centos keys
mkdir -pm 700 /home/centos/.ssh
wget --no-check-certificate 'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub' -O /home/centos/.ssh/authorized_keys
chmod 0600 /home/centos/.ssh/authorized_keys
chown -R centos /home/centos/.ssh

# Customize the message of the day
echo 'Welcome to your centos-built virtual machine.' > /etc/motd
