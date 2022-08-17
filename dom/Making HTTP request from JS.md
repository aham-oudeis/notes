### Network programming in JS
![[Pasted image 20220624152345.png]]

1. When the user clicks a link, the web browser automatically requests the page
2. when the browser receives a response, it renders it in the viewport

To make the web more interactive, the need to reload an entire HTML page becomes a limiting factor. Developers need a way to replace only part of the page. That new technique is AJAX: Asynchronous JavaScript And XML. 

Basically, AJAX implies sending web browser that does not perform a full page reload.

Using AJAX, the approach differs from the image above in couple of different ways:
1. The web browser doesn't make an automatic HTTP request; instead, JS code initiates it, typically from an event listener
2. When the browser receives a response, JS code optionally takes the response's body and updates the page as needed. 

Now the task is to understand how this can be done smoothly.

![[Pasted image 20220624153040.png]]

Two common use case:
1. Showing some pertinent information in a popup
2. Having all the validation logic on a form handled by JS without refreshing the page.

 [[Using XMLHttpRequest]]