`setTimeout` is a simple case of asynchronous code. How does it help to understand promises?

The basic idea is that `setTimeout` shows how a piece of code or function can be set aside for execution some other time. While the `setTimeout` does not return a meaningful value, it illustrates how a function's execution can be deferred with the use of a timer. The timer is triggered because the `setTimeout` function is executed, but the callback function passed to `setTimeout` is scheduled to be called in the next event loop cycle.

Basically, `setTimeout` method starts a timer in the web APIs environment. While the `setTimeout` function is popped off the execution stack, the timer is going on. When the timer expires, the callback function is pushed to the message queue. The callback is not immediately executed.

The job of the event loop is to look into the call stack and determine if the call stack is empty or not. If the call stack is empty, it looks into the message queue to see if there's any pending callback waiting to be executed. When it finds the callback in the queue, it pushes the callback in the execution stack.

__DOM events__ trigger the specific function that reside in the web APIs environment. The event listeners sit in the web API environment waiting for certain event to happen, and when that event happens, then the callback function is placed in the message queue waiting to be executed.

“It helps to think of synchronous executions as a line of people waiting to buy movie tickets. If you are at the end of the line, you can’t buy a ticket until all the people in front of you have bought theirs. Think of asynchronous executions like ordering food in a restaurant. You don’t have to wait for other people who have come earlier to get their food before you can order yours. Everyone can order food at any time and receive it when it’s ready. Depending on the type of food you order, you may get your food sooner or later than other people.”

Excerpt From
Modern Asynchronous JavaScript
Faraz K. Kelhini
This material may be protected by copyright.

[[Async Operations]]