1. 1
The DOM (document object model) is an in-memory object representation of an HTML document. It is a heirarchical tree structure of nodes. 

All DOM objects inherit from `Node`, which in turn inherit from `EventTarget`.

There are four types of nodes:
1. Text node
2. Comment node
3. Document node
4. Element node

- EventTarget
	- Node
		- Text
		- Comment
		- Document
		- Element


```javascript

```
2. 2

```javascript

```
3. 3

```javascript
let listOfLinks = Array.from(document.querySelectorAll('a'));

listOfLinks.forEach(el => console.log(el.toString()));
```
4. 4

```javascript
function findItems() {
  let listOfInputs = Array.from(document.querySelectorAll('input'));
  let checked = [];
  let unchecked = [];

  listOfInputs.forEach(inputEl => {
    let text = inputEl.parentNode.textContent;
    if (inputEl.checked) checked.push(text);
    if (!inputEl.checked) unchecked.push(text);
  });

  return [checked, unchecked];
}
```
5. answer
The `document.querySelector` and `document.querySelectorAll` take css selectors as an argument. While the former returns the first element that matches the selector, the latter returns NodeList of all the elements that match the selector.

```javascript

```

6. answer

```javascript
let outerUl = document.querySelector('ul');

function walkList(node=outerUl) {
  if (node.tagName = 'LI') console.log(node.textContent);

  let children = node.children;

  for (let idx = 0; idx < children.length; idx++) {
    walkList(children[idx]);
  }
}
```

7. answer

```javascript
function rewrite() {
  let h2 = document.body.querySelector('h2');
  let frontPageDiv = document.body.querySelector('.front-page');
  let existingParagraph = frontPageDiv.lastElementChild;

  let h1 = document.createElement('h1');
  h1.textContent = "The Day's News";

  document.body.replaceChild(h1, h2);

  let article = document.createElement('article');
  article.classList.add('breaking');
  let firstParagraph = document.createElement('p');
  let secondParagraph = document.createElement('p');

  firstParagraph.textContent = "Fire breaks out at the old factory";
  
  let link = document.createElement('a');
  link.setAttribute('href', '/stories/15');
  link.textContent = "Read More";

  secondParagraph.appendChild(link);
  article.appendChild(firstParagraph);
  article.appendChild(secondParagraph);

  frontPageDiv.insertBefore(article, existingParagraph);
}
```

8. answer

```javascript
function helloLater(n) {
  setTimeout(() => console.log('Hello, world!'), n * 1000);
}
```

9. answer

```javascript
document.addEventListener('DOMContentLoaded', () => {
  let listItems = document.querySelectorAll('li');

  console.log(listItems.length);
})
```

10. answer

```javascript

```

11. answer

```javascript

```

12. answer
The `addEventListener` method sets up some function to be executed when some DOM event is triggered. 

It takes two required arguments and one options arguments. 

The first argument is the event type. 

The second argument is the event-handler, or the function that is to be run when the specified event occurs.

The third is the option for determining whether the event handler is to be executed during the creation phase or bubbling phase. In the third option argument, we can also specify if we want the event handler to be executed only once.

```javascript

```

13. answer

```javascript

```

14. answer

```javascript

```

15. answer

```javascript
document.body.addEventListener('click', (e) => {
  if (e.currentTarget.tagName === 'A') {
    e.preventDefault();
  }
})
```

16. answer

The advantage of using AJAX over letting the browser automatically visit links and submit forms is the ability to render a new html page without a full page reload.

```javascript

```

17. answer

```javascript

```

18. answer

```javascript

```

19. answer

```javascript
let request = new XMLHttpRequest();

request.open('PUT', '/todos/15');
request.setRequestHeader('Content-Type', 'application/json');

let data = JSON.stringify({title: "Buy Milk", completed: true})

request.addEventListener('load', () => {
  console.log('success!');
});

request.send(data);
```

20. answer

```javascript

```

22. answer

```javascript
async function loadUrl(url) {
  try {
    let response = await fetch(url);
    console.log(`Got Reponse: ${response}`);
  } catch(error) {
    console.log(`fetch failed: ${error}`)
  }
}
```