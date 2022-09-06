## Linked lists
- dealing with mostly singly-linked lists
- you'll be given the head node

### Time Complexity
- Traversal/search
	- O(n)
- Prepend new head
	- O(1)
- Remove head
	- O(1)
- Append to tail
	- O(n)

### Space Complexity
```go
if head == nil {
	//forgetting this is a common problem
	return head //special case
}

//this is a loose structure
current := head 
for current != nil {
	//do something
	current = current.Next
}

return head
```

### Merge two sorted lists
