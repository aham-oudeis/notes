# DOM
The DOM (document object model) is an in-memory object representation of an HTML document. It provides a way to interact with a webpage using JavaScript and provides the functionality needed to build modern interactive user experiences.

## Heirarchy of Nodes
The DOM is a hierarchical tree structure of nodes. Consider the following html code:

```html
<html>
  <h1>Hello, world!</h1>
  <p>This is a small <em>web page</em>.</p>
</html>
```
The above html can be represented as having the following tree-like structure:

![[Pasted image 20220524180451.png]]

In the tree, HTML is the root node that has two children: HEAD and BODY.

BODY in turn has two children nodes: P and H1. And H1 has one child node: EM.

__Permissiveness__: browsers always do their best to supply the missing elements. That is, they don't throw errors when elements are missing as would happen in other scripts.

While the above picture represents the tree structure of the elements, the actual DOM also includes various whitespaces as the text element. So, the actual picture would look something like this:

![[Pasted image 20220524180635.png]]

We can see two types of nodes in the above picture:
1. Elements represent HTML tags
2. Text nodes represent text that appears in the document

Empty nodes are nodes that contain nothing but whitespaces (spaces, tabs, newlines, etc). They can appear anywhere but they are not reflected visually in the web browser.

## Node
In the context of the DOM, a node is a single point in the node tree, such as the document itself, HTML element, text, and comments.

`toString`  method on nodes returns a string representation of the object with their corresponding type.

`querySelector` method on nodes traverses the tree structure and returns the first element that matches the argument passed to it.

`querySelectorAll` method on nodes traverses the tree structure and returns a collection of the elements that match the argument passed to it.

### Node Properties
`nodeName` : contains a string that represents the node type. For elements, the name is in __uppercase__.

`nodeType`: node types are associated with a particular integer value. 
- 1 represents an HTML tag `Node.ELEMENT_NODE`
- 3 represents a text node `Node.TEXT_NODE`
- 8 represents a comment node `Node.COMMENT_NODE`
- 9 represents a document node `Node.DOCUMENT_NODE`

It's preferable for the sake of clarity to use the constant names as opposed to the numeric values

`nodeValue`: Element nodes don't have values; hence, it returns `null`

Text nodes have values though and it is simply the textual content  of the node.

`textContent` : represents the textual content of __all the nodes inside the Element__. Basically, all the nodeValue of all the element's child nodes are concatanated together.

### Key Points 
- All DOM objects are nodes
- All DOM objects have a type that inherits from Node, which means they all have properties and methods they inherit from Node
- The most used DOM objects are __Element__ and __Text__

## Inheritance in DOM
- EventTarget
	- Node
		- Text
		- Comment
		- Document
		- Element
			- HTMLElement
				- HTMLAnchorElement
				- HTMLBodyElement
				- HTMLButtonElement
				- HTMLCanvasElement
				- HTMLDivElement
				- HTMLFormElement
				- HTMLHeadingElement
				- HTMLHtmlElement
				- HTMLImageElement
				- HTMLInputElement
				- HTMLLiElement
				- HTMLLabelElement
				
			- SVGElement
				- SVGColorElement
				- SVGRectElement

Almost every HTML tag, excepting `HTMLTableDataCellElement` and `HTMLTableHeaderCellElement`, has its own Element subtype

### Determining Node's type

While using the browser's console:
1. We could use the `toString` method, but there is some inconsistency in how the method is implemented for each element. For instance, calling the `toString` method on anchor element returns the url address instead of the string representation of the element name
2. use the `constructor` property of the object to figure out the type, but what is returned is rather different across different browsers
``
While writing code:
3. use the `instanceof` operator
4. use the `tagName` property: returns an uppercase value

```javascript
let p = document.querySelector('p');
p instanceof HTMLParagraphElement
=> true

p instanceof HTMLAnchorElement;
=> false

p instanceof Element;
=> true
```
If there is a need to process different element types in different ways, then the `instanceof` operator comes handy

## Traversing Nodes
DOM nodes connect with other DOM nodes via a set of properties that point from one node to another with defined relationships. 

![[Pasted image 20220524192316.png]]


![[Pasted image 20220524192335.png]]

![[Pasted image 20220524192504.png]]


## Element Attributes
HTML tags have attributes and these attributes can be accessed with certain methods. 

![[Pasted image 20220524193658.png]]


While the `getAttribute` and `setAttribute` work for all attributes, there are some convenient ways to access some special attributes: `id`, `name`, `title`, `value`, `className` (since `class` is a reserved word in JS).

### `classList`
In some cases, an element has more than one class. In such cases, it is rather inconvenient to work with a single string value returned by `className`. In such cases, it is preferable to work with `classList`

`classList` references a special array-like `DOMTokenList` object that has the following properties and methods:

![[Pasted image 20220524194751.png]]


### Style 
Style of a particular element can be accessed with the `style` property that references a CSSStyleDeclaration object.

## Finding DOM nodes
`document.getElementById(id)`: fetches the element with the supplied id.

Since this approach locates a single element (bc id is unique), it does not allow for working with multiple elements. 

Consider the problem of adding another paragraph element in the following HTML:

```html
<!doctype html>
<html lang="en-US">
  <head>
    <title>On the River</title>
  </head>
  <body>
    <p id="content">The sun is low</p>
  </body>
</html>
```
How do we add the second paragraph element?
```html
...
<body>
  <p id="content">The sun is low</p>
  <p id="more-content">The sun is still low</p>
</body>
...
```
Walking the whole DOM is cumbersome. 

The nifty solution is to use the `getElementsByTagName` and `getElementsByClassName` methods that return a live collection: a HTML collection or NodeList

These collections are not JS arrays and hence they do not support `forEach` method. We must use a `for` loop or convert the object into array first using `Array.prototype.slice.call(collection)`.

## Better Methods
1. `document.querySelector(selector)`
2. `document.querySelectorsAll(selectors)`

The `selector` arguments is a comma separated string, where the comma works like an `OR` operator. While the first one selects the first matching element, the second method returns a collection of the elements that match any of the comma separated selectors.

Consider the difference in the task of selecting all the paragraphs nested within the divs with class 'intro'
```javascript
//without query selector

for (let div of introDivs) {
  let paragraphs = div.getElementsByTagName('p');

  for (let para of paragraphs) {
    para.classList.add('article-text-new');
  }
}

//with query selector
//here .intro p is not comma separated; it's a standard css selector
let paragraphs = document.querySelectorAll(".intro p");
for (let paragraph of paragraphs) {
  paragraph.classList.add("article-text");
}
```

If you are planning on updating some text using javascript, it is better to put the text inside `span` or `div` so that you can easily locate the exact text and modify it using `textContent`

