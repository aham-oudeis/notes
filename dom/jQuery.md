JQuery is a JS library that provides a convenient API to perform these types of functions. 

JQuery resolved the problems caused by a lack of standards and thus become massively popular.

How working through jQuery, it is important to understand how one could accomplish the same functionality with vanilla JS

## jQuery function

At its core, jQuery is a function that wraps a collection of DOM elements and some convenience methods into an object.

1. if the argument is a string or a DOM element, it wraps a collection of jQuery objects and returns them.
2. if the argument is a function, jQuery uses that function as a callback when the *document is ready*. 

Basically, jQuery uses a function constructor that checks whether the argument passed to it is a string or a DOM element or a function. Depending on the argument, the function does different things. 

When it returns a jQuery object, it returns an object where the DOM elements are stored in array-like fashion, i.e., starting at index 0 and incrementally adding other elements at their respective indexes.

```javascript
var $content = jQuery('#content');
var $sameContent = $('#content');
```

Both forms of the function return an object that represents a collection of elements. For '#id' selectors, the returned object represents no more than one element. That is, the DOM element is stored at property `0`.

However, for the following code, the total DOM elements would be greater than 1. 

```javascript
var $lis = $('li');
```

The returned object is the same type of object as returned by `$('#id')`; they both are javascript objects. They both are collections.

jQuery constantly updates the length property when it adds some element to the collection.

### The DOM ready callback
Since most of jQuery acts on DOM elements, we must wait for the page to load before we execute our code. 

```javascript
$(document).ready(function() {

});

//this is equvalent to the following
document.addEventListener('DOMContentLoaded', function() {

});

//even shorter way of writing this is:

$(function() {

})
```

However, if you want the `load` event to fire, then you would have to use the following:

```javascript
$(window).load(function() {

});

//that means, this code is equivalent to the following code:

document.addEventListener('load', function() {

});
```

### jQuery Object Methods
once you obtain an object from jQuery, you can perform a variety of tasks with it: change the `font-size` for all the elements represented by the object with the `css` method

```javascript
$content.css('font-size', '18px');
```

When the second argument is missing, it acts as a getter. That is, it simply returns the existing value. But when the second argument is supplied, then it acts as a setter.

Just as `css`, `height` and `width` methods act as both getters and setters.

```javascript
$content.width(); //getter

let width = $content.width();

$content.width(width / 2); //setter
```

Since the setter returns the same object, we can chain methods calls.

A more simpler way is to call `css` with an object argument:

```javascript
$content.css({
	'font-size': '18px',
	color: '#b00b00'
});

//or

$content.css({
	fontSize: '18px',
	color: '#b00b00'
});
```

### Convenience methods as static functions
1. `$.isArray`
2. `$.isFunction`
3. `$.merge`
4. `$.map`
5. `$.ajax` 

### Traversing the DOM using jQuery
```html
<blockquote>
	<p>Take off every zig!</p>
</blockquote>
```

```javascript
//select the element and wrap in jquery object
var $p = $('p')

//now, jquery lets you do stuff as follows:
$p.parent().css('color', 'blue');
```

How this works is the jquery object returns a new jquery object with the parent of all the paragraph elements. For this code, there is only one parent. But in other cases, it would return an object containing parent of eahc of the paragraph element.

And if we want to limit the result to a specific parent, then we can pass in the selecter with the `parent` method:

```html
<blockquote>
  <p>You have no chance to survive make your time.</p>
</blockquote>

<blockquote>
  <p>Ha ha ha ha ...</p>
</blockquote>

<blockquote class="highlight">
  <p>Captain !!</p>
</blockquote>

<blockquote>
  <p>Take off every Zig!</p>
</blockquote>
```

```javascript
var $p = $('p');

$p.parent('.highlight') //returns the parent object with class highlight
	.css('color', 'blue'); //sets the color attribute of the parent object
```

`parents` methods goes all the way to the root element and returns a jquery object containing all the elements that have `is parent of` relationship with the element and its parent.

