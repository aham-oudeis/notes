[Internet Protocol](internet_protocol.md) ||  [Ethernet](ethernet.md)  || [Transport Layer](transport_layer.md)

# Internet

__Network__
* When at least two or more devices are connected in such a way that they can exchange data, it forms a network

__LAN__
* A network of computers connected locally via cables to network bridging device, such as a switch or a hub
* A LAN connected wirelessly is WLAN
* The scope of communication is limited to the devices connected to the switch

__Internet__
* Internet is a vast network of networks connected and sustained by a wide array of components, such as routers, switches, cables, radiowaves, etc. The physical devices and mediums that undergrid the internet constitutes the __Network Infrastructure__. 
* A router is a device that routes network traffic to other networks.

__Protocol__
* A set of rules governing the exchange of data so as to enable various facets of systematic communication.
* A protocol might deal with the structure of the messages or the order of the messages or the delivery of the messages.

Two reasons for the wide variety of protocols:
1. Different protocols evolve to address different aspects of the communication. E.g. TCP and IP address different aspects.
2. Different protocols evolve to address the same aspect of the communication but in different ways. E.g. TCP and UDP address the same aspect but in different ways.

__Layers__
* While the communication over internet is composed of a large number of protocols addressing different aspects of communication, it is helpful to divide the aspects of communication in terms of layers. This is a layered approach to understanding communication over the internet.

* There are two well known models to dividing up the layers: OSI model and Internet Protocol Suite TCP/IP model.
* The difference in the model is rooted in how the models carve up the communication layer. While OSI carves up the layers in terms of specific function that each layer provides, Internet Protocol Suite carves up the layers in termsof the scope of communication.

__Encapsulation__
* Encapsulation in the context of networking refers to the process of packaging the data from the layer above with protocol-specific metadata of the current layer. This package is referred as a PDU. For example, the Transport layer can package a TLS record received from the session layer (OSI model) or just a HTTP request from the Application layer (TCP/IP model) and form a TCP segment.

__Protocol Data Units__ (PDU)
* Protocol Data units are bundles composed of a protocol-specific header (and sometimes a trailer/footer) and the data payload from the layer above.
The PDU of the transport layer is called segment (TCP) or datagram (UDP). The PDU of the Network/Internet layer is called a packet.

__Latency__
* Latency is a measure of time it takes for data to get from one point in the network to another point.
* It is a measure of delay between sending and receiving data.
* It includes propagation delay, transmission delay, processing delays, and queuing delay.

* __Propagation delay__ — amount of time it takes for the first bit to travel from sender to receiver
* __Transmission delay__ — amount of time it takes to push all packets into the wire
* __Processing delay__ — amount of time it takes routers to process the packet header
* __Queuing delay__ — amount of time the data waits in queue

1. _Round Trip Latency_: Latency involved in sending data added to the latency involved in receiving acknowledgement.
2. _Last Mile Latency_: Latency concentrated near the edge of the network; this is generally the delay involved in getting data from your local ISP to the LAN.

__Bandwidth__
* Bandwidth is the amount of data that can be transmitted in a given unit of time (usually per second). 
* When the bandwidth of a link goes from relatively high to relatively low, it's called bandwidth bottlneck. 



