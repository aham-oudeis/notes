[Internet Layer](internet.md) ||  [Ethernet](ethernet.md)  || [Transport Layer](transport_layer.md)

## Internet/Network layer

It provides communication between devices on different networks. It provides two main services:
1. Routing capability through IP addressing
2. Data encapsulation in the form of packets

## Routing capability
Since the IP addresses are hierarchical and logical, the process of locating a specific id address is more manageable. The overall network is divided into logical subnetworks creating a network heirarchy. The IP address of a device must fall within a range of addresses available to the local network that the device is connected to. This hierarchy enables the routers to figure out which next device to send the data to, without having a record of every device.

Sub-netting is the mechanism for dividng the IP address into heirarchical subnetworks.

Bascially, all routers on the network have a local routing table. Routers examine the destination IP address of the IP packet and matches it against the list of network addresses in its routing table. The matching network determines where in the network hierarchy the subnet exists. This kind of mechanism is used to determine the best route for the IP packet. 

In contrast, MAC addresses are flat and burned-in. While a device's MAC address is permanent, a device's IP address is dependent on the network it is connected to.

__Internet Protocol__
* The dominant protocol (for the Internet layer) that is responsible for the communication between hosts in different networks.

__IP Address__
* Unique address of a device assigned according to the IP protocol.

## Data Encapsulation
The PDU from the Transport layer is further encapsulated into an internet packet, by adding, among other things, the source and destination IP address to the header.

__Packet__
* Protocol data unit for the Network/Internet layer

__IPV4 and IPV6__
While IPv4 is a 32-bit address that uses four octets in a dotted decimal system, IPv6 is a 128-bit address that uses eight colon separated hexadecimal numbers (each hexadecimal beign 16 bit).

__Differences between IPv4 and IPv6__
copied from [here](https://www.guru99.com/difference-ipv4-vs-ipv6.html)

* IPv4 is 32-Bit IP address whereas IPv6 is a 128-Bit IP address.
* IPv4 is a numeric addressing method whereas IPv6 is an alphanumeric addressing method.
* IPv4 binary bits are separated by a dot(.) whereas IPv6 binary bits are separated by a colon(:).
* IPv4 offers 12 header fields whereas IPv6 offers 8 header fields.
* IPv4 supports broadcast whereas IPv6 doesn’t support broadcast.
* IPv4 has checksum fields while IPv6 doesn’t have checksum fields
* IPv4 uses ARP (Address Resolution Protocol) to map to MAC address whereas IPv6 uses NDP (Neighbour Discovery Protocol) to map to MAC address.