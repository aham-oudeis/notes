# Repeat Modifiers
- In regular expressions, the pipe character `|` metacharacter is used as a branching `if..else` logic.
- For example: `/list|lost/` can be read as: `if list matches...else match lost` .
- Repeat modifiers are like loops. They tell the regex engine on how many times to repeat the match
- The key difference between regex and other looping constructs is that regex can unloop themselves.
- This process of unlooping is called backtracking

`+`                             ---->     Matches at least once
`?`                             ---->     Match at most once
`*`                             ---->     Match any number of times
`{min, max}`         ----->    Match at least `min` times and at most `max` times.
`{n}`                        ------>   Match exactly `n` times

