## User Events
Here is small snippet of user events that are helpful. 

![[Pasted image 20220601200609.png]]

Event Listeners or __Event Handlers__ are functions that the JavaScript runtime calls when a particular event occurs. Four steps to setup an event handler:
1. Identify the event you need to handle. 
2. Identify the element that will receive the event.
3. Define a function to call when this event occurs.
4. Register the function as an event listener.

### The Event Object
The object that is passed to the callback function that carries additional information about the event. For instance:
- `type`: the name of the event ('e.g., 'click)
- `currentTarget`: the current object  that the event object is on. It always refers to the element that has the event listener attached to it.
- `target`: the initial object to receive notification of the event, e.g., the element clicked by the user

Basically, `target` identifies the innermost target of the event, whereas `currentTarget` identifies the event listener to which the event is attached.

#### Mouse Events

Here are some of the properties of mouse events
- `button`: read-only property that indicates which button was pressed
- `clientX`: the horizontol position of the mouse when the event occurred
- `clientY`: the vertical position of the mouse when the event occurred

Both `clientX` and `clientY` return values relative to the visible area of the page: the number of pixels from the upper-left corner of the browser's viewport

#### Keyboard Events
Keyboard related events have special properties:

- `key`: the string value of the pressed key (not supported by older browsers)
- `shiftkey`: boolean value that indicates whether the user pressed the shift key
- `altkey`: boolean value that indicates whether the user pressed the alt or option 
- `ctrlkey`: boolean value that indicates whether the user presssed the control key
- `metakey`: boolean value that indicates whether the user presssed the meta or command key

Note: __Properties of the event depend on the event type__

### Capturing and Bubbling
Adding event listeners to every element of interest is cumbersome in larger applications. 

1. You can't add events listener to an element until the DOM is ready, which means that you must wait until the `DOMContentLoaded` event fires. 
2. You must add event handlers manually when you add new elements to the page after `DOMContentLoaded` fires.
3. Adding handlers to many elements can be slow, and can lead to complicated, difficult to maintain code. For instance, a page that is like a large spreadsheet with hundreds and thousands of cells. It would be awfully difficult to take into account all the clicks and keyboard events.

### How is capturing and bubbling related to the drawbacks of adding event listener?
When there are nested elements, events propagate throughout the chain. Hence, this feature can be capitalized to add event listeners to elements that are added dynamically to the page.

If there is an event listener associated with an element, then the event is triggered for all the nested elements. That means, if we are interested in having a event listener for all the nested elements and we want the behavior to be different based on which nested element initiated the event, then we can attach the event listener to the outermost element and process the event differently inside the callback function.

Hence, the number of elements you can interact with is equal to the element the event listener is attached to __plus__ the number pf its nested elements.

__Capturing__ and __Bubbling__ are phases that an event goes through after it initially fires. The event first gets dispatched to the global `window` object, then to the `document` object, all the way down to the target element, which is the element on which the event was originally fired. 

This means, events do not start and end on the target element or the element that an event was triggered on.

### Preventing Propagation and Default Behaviors

`event.stopPropagation` stops the `event` object from continuing its path along the capturing and bubbling phases.

`preventDefault` tells the browser that it shouldn't perform any actions that it might otherwise perform in response to a user's action. For instance, clicking a link typically loads a new page in the browser. `preventDefault` tellls the browser not to do that.

### Event Delegation

Suppose we need to add an event listeners to multiple items on a list. While it is possible to add individual event listeners to each item, it would be tedious to do so. 

__Event delegation__ takes advantage of event propagation to address the problem with associating event listeners with too many nested items. Instead of adding listeners to every element you're watching, you can add a single handler to any comon ancestor (a parent, grandparent, or something further up the DOM tree) of the elements you want to watch.

However, if the nested elements are supposed to behave differently, then we must treat the element differently. For instance, a button would have to be treated differently than a link. Clicking a link would trigger the default action of opening a new page, whereas a button would send a post request.

Instead of trying to delegate early, it's preferable to start by binding event listeners directly to elements when the project is new and small. As the code grows in size and complexity, delegation makes sense.






