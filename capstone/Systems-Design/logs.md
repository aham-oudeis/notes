### Logs by Jay Krepps
## What is a log?
- simplest possible storage abstraction
- append-only, totally ordered sequence of records ordered by time
- records are appended to the end of the log, adn reads proceed from left-to-right
- each entry is assigned a unique sequential log entry number
- __they record what happened and when__
- For distributed systems, the heart of the problem is knowing what happened and when it happened

## Logs in databases
For a relational database, logs can be represented as a set of instructions sent to the database. With these logs, the entire view of the database can be reconstructed.

Would the logs be as bulky as the database itself?

> Since the log is immediately persisted it is used as the authoritative source in restoring all other persistent structures in the event of a crash.

What does this immediate persistence look like?

Once you have the log of a database, then you can send this logfile to another system and recreate the entire database and keep it in sync.

This kind of abstraction of database is ideal for supporting all kinds of messaging, data flow, and real-time data processing.

## Logs in distributed systems
Two problems that logs solve:
1. ordering changes
2. distributing data

Deterministic:

	if two identical, deterministic processes begin in the same state and get the same inputs in the same order, they will produce the same output and end in the same state.

Hence, `gettimeofday` is non-deterministic.

Application: if you want multiple machines to do the same thing, all that is needed is to feed deterministic logs to the machines as inputs.

We can implement this principle by extracting what we want to keep as logs in keeping a record of state change.

> as long as two processes proces these inputs in the same way, the processes will remain consistent across replicas

> The log will become something of a commoditized interface, with many algorithms and implementations competing to provide the best guarantees and optimal performance.

