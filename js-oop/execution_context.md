Short version: The term 'execution context' is LS lessons is used slightly differently than the way the term is used in ECMAScript and MDN document.

Long Version:
> An _execution context_ is a specification device that is used to track the runtime evaluation of code by an ECMAScript implementation. At any point in time, there is at most one execution context that is actually executing code. This is known as the _running_ execution context. A stack is used to track execution contexts. The running execution context is always the top element of this stack. 

> A new execution context is created whenever control is transferred from the executable code associated with the currently running execution context to executable code that is not associated with that execution context. The newly created execution context is pushed onto the stack and becomes the running execution context. (ECMAScript 2015)

[source](https://262.ecma-international.org/6.0/#sec-execution-contexts)

ECMAScript suggests that execution context is responsible for tracking the runtime evaluation of the code and is maintained in a call stack or execution stack. A function invocation creates a new execution context which is pushed on to the stack and when the function returns, the execution context is popped off the stack.

One of the things that is kept track of within this execution context is the value of `this`.

At no point does ECMAScript say that `this` is the execution context. Nor is there any distinction bewteen implicit execution context and explicit execution context. Nor does Douglas Crockford explains `this` as referencing the execution context. (See his books: How Javscript Works and Javascript-The Good Parts).

In a similar vein, MDN also defines `this` as a property of the execution context, implying that `this` is not the whole of the execution context.

> A property of an execution context (global, function or eval) that, in non–strict mode, is always a reference to an object and in strict mode can be any value.

[source](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/this)

However, the article that LS recomends and MDN references simply identifies  `this` with the execution context.

>`this` is the context of a function invocation (a.k.a. exection). 
> In a function invocation, the execution context is the global object.

(Dimitri Pavlutin) 
[source](https://dmitripavlutin.com/gentle-explanation-of-this-in-javascript/)

> Every time a JavaScript function is invoked, it has access to an object called the **execution context** of that function. 

[source](https://launchschool.com/lessons/c9200ad2/assignments/4cc36fd6)

My sense is that Dimitri Pavlutin and LS materials use the term 'execution context' in a rather different way than how ECMAScript and MDN use it. This can be a source of confusion for people who are relying on other sources to understand the lessons. 

I believe Gabriel De Almeida in this [post](https://launchschool.com/posts/23b376e1) was working with the ECMAScript's understanding of the execution context, whereas VIctor was responding with LS's understanding of the execution context.

Given that there used to be alerts when LS's usage of a term deviates from what is found outside, I had expected there to be a similar alert on this issue.

If I'm getting things wrong here, TAs can correct me. Otherwise, I just wanted to alert the students about the different usage of the term 'execution context' in LS lessons and materials outside of LS.

[[inheritance_chain]]