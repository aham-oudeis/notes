## HTML data attribute
Having some sort of data or identifier present in the HTML for the purpose of your javascript code:
	1. functionality for a tabbed navigation that switches visibility of the correspondign sections of a page
	2. when you click the first tab, the block of content that is linked to it should be shown and the rest of the content blocks should be hidden.
	3. While it is possible to use the index of the clicked tab to find the content block that matches the index, but if you want to put the tabs in a different order later you also have to remember to reorder the content blocks.

Data attributes can be added to any HTML element, and  it bears no significance other than to store data for you.

Data attributes always start with `data-` and need at least one character after the hyphen, but what comes after the hyphen can be anything.

The value you give to the attribute can also be anything that can be contained within a string.

The point of this whole thing is to forge a connection between two different elements, so that the interaction with one can be reflected on the other.

In JQuery, there are two ways of accessing the data attribute:
1. Using the `.attr` method, which allows you to specify the attribute name and get the value of the attribute.
2. Using the `.data` method. Caution: it can be for two different data sets (see example below). If you want to obtain the value of the data-block attribute on one of the tab links, you can use the data method and pass the nae of the data attribute minus the `data-` at the beginning of it.

```javascript
$link.data('block');
```

```html
<a href="#" data-block="gold">Gold Sponsors</a>
```

Consider the following code, where the value returned by `attr` and `data` methods are somewhat puzzling:

```javascript
var $a = $('a[data-block=gold]');

console.log($a.attr('data-block')); //gold
console.log($a.data('block')); //gold

$a.data('block', 'silver'); 

console.log($a.attr('data-block')); //gold
console.log($a.data('block')); //silver
```

### Lesson: If you want to get or set the value of an HTML data attribute, use the `.attr` method. As a setter method, `attr` will change the HTML markup. However, if you want to set and retrieve custom data on an element after the page has been rendered, use the `data` method.