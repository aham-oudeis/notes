# Runtime Environment

[source](https://launchschool.com/books/javascript/read/preparations)

A __runtime environment__ is an execution environment that lets an application program access system resources and provides the tools the application needs to operate.

__Compilers__ produce an output file that the computer can run directly, perhaps after some additional 
processing called linking. __Interpreters__, however, don't produce 1s and 0s that the computer can run
directly - instead, the interpreter runs the interpreted code directly, or perhaps passes it on to a
companion program.

An __Application Programming Interface (API)__ provides that functionality: it describes the scheme and format that a programmer can use to securely access resources, with the operating system acting as an intermediary. A runtime environment typically adds another layer of abstraction on top of the operating system's API to make these resources available with a higher-level (i.e., more accessible) API. The compiler/interpreter and the operating system's APIs together make up a runtime environment.

JavaScript in the browser has two main purposes: 1) to programmatically alter web pages based on user actions; and, 2) to exchange messages with a server over a network. ... The DOM (Document Object Model) API lets you manipulate the structure and appearance of a web page, while the XHR (XMLHttpRequest) interface and the Fetch API let you communicate with a server.

A general-purpose programming environment, like Node.js, needs the following minimal capabilities:

* The ability to read and write disk files (disk I/O);
* The ability to read and write via the terminal (standard I/O);
* The ability to send and receive messages over a network (network I/O);
* The ability to interact with a database.

