## Learning libraries

### Reading Documentation
Core components of JIT
- A solid grasp of programming fundamentals
- Understanding _how_ to learn

How to learn amounts to how to read documentation

### Including an External Library
1. hosting the files locally
![[Pasted image 20220614152834.png]]

![[Pasted image 20220614152852.png]]
2. Using a CDN ![[Pasted image 20220614152913.png]]
When loading assests from a CDN, it's essentai lthat you include the `integrity` and `crossorigin` attributes within your `script` tag:

These attributes are part of a browser security feature known as *Subresource Integrity* 
- The `integrity` attribute allows browsers to verify that the resoucrse being requested hasn't been manipulated in transit.
- The `crossorigin` attribute enables the browser to accurately process the CORS request

Of course, the libraries have to be included before the javascript file that makes uses it.

[[jQuery]]
[[handlebars]]
