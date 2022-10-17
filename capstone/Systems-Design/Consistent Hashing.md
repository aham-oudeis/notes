Suppose I have users from 1-10k. The integers are their user_id numbers. I want to distribute the load of requests from those users to servers A, B, C, D. 

I can map the range 1-10k to 1-100. Say, users from 1-100 map to 1, 101-200 map to 2, 201-300 map to 3, and so on. That way we have all users mapped to a certain range.

We can use some hashing function here. A function that takes a user_id and then maps it to a value between 1-100.

Now the servers A can be assigned a limit before 25, B can be assigned to a limit before 50, C can be assigned a limit before 75, and D can be assigned to a before 90. That way, all the users that map to numbers between 90-25 all go to A.

The point behind consistent hasing is that if a node goes down, say B goes down, then the traffic to B is picked up by C, because in absence of B, values between 26-50 are also before 75. 

What happens when we add nodes? Say, we add a node E because A is becoming a hot note? We add E and assign it a limit of say 5. That means, all the traffic with value between 90-5 will go to E and thus A will have to deal with less traffic. In the process, E has to take some data from the A.

Here, adding multiple hasing functions is like further dividing the range from 1-100. Say, one hasing function divides the user_id to a value between 1-20, another hashing function divides the user_id to a value between 21-40, and so on. That way, all the hashing functions jointly exhaust the possible cases, but each hashing function covers different range.

Instead of assigning the slice of 1-25 to A, what we do is we assign A to the first five values from each hashing function.


