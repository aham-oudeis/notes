[Internet Layer](internet.md)   ||   [Internet Protocol](internet_protocol.md) || [Transport Layer](transport_layer.md)

# Ethernet

__Ethernet__
* Protocol governing the Link layer/ Data link layer (Layer 2 of OSI model)
* Provides two services: __addressing__ and __framing__.

## Framing
* Providing a logical structure to the data to be transmissed through the physical layer
* The structure is provided by adding a header and a footer to the packet. 
* Various fields of the header are of specified lengths and have a identifiable pattern.
* This is the final encapsulation that happens before sending the data through the physical layer

__Frame__
* Protocol data unit of the Link layer and the lowest layer where encapsulation happens.

## Addressing
* By adding source MAC address and destination MAC address, it facilitates the journey of the data through various hops in the network.
* Basically, each network device figures out the next hop in the journey of the frame by consulting the routing table that maps the ip address with the MAC addresses. 

__MAC Address__
MAC Addresses is a permanent address assigned to the Network Interface Card (NIC) of every device connected to a networrk. It is formatted as a sequence of six two-digit hexadecimal numbers, e.g. 00:40:96:9d:68:0a, with different ranges of addresses being assigned to different network hardware manufacturers.