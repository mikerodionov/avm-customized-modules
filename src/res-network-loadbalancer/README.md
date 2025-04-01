Module offers full functionality of original AVM module while enforcing below:

- Instances exposed to network traffic from the internet - ACL should deny connections from Internet

- Azure Load Balancer diagnostic logs are disabled - enable diagnostic logs

- Memcached default UDP port is publicly accessible - block/firewall UDP port 11211

- Internet connectivity via TCP over insecure port - ACL should deny connections from Internet
