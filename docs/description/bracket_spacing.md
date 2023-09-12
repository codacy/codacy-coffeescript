This rule checks to see that there is the proper spacing inside
square brackets. The spacing amount is specified by "spaces".
The spacing amount for empty arrays is specified by
"empty_array_spaces".
The spacing amount for arrays containing a single item is
specified by "mono_array_spaces".
Specified characters will be ignored if listed in "exceptions".
<pre><code>
# Spaces is 0
[a, b]     # Good
[a, b ]    # Bad
[ a, b]    # Bad
[ a, b ]   # Bad
# Except brackets
[ [a, b] ] # Good
[[ a, b ]] # Bad
# Spaces is 1
[a, b]     # Bad
[a, b ]    # Bad
[ a, b]    # Bad
[ a, b ]   # Good
[ a, b  ]  # Bad
[  a, b ]  # Bad
[  a, b  ] # Bad
# Except braces
[{ a: b }] # Good
[ {a: b} ] # Bad
# Empty Array Spaces is 0
[]         # Good
[ ]        # Bad
# Empty Array Spaces is 1
[]         # Bad
[ ]        # Good
# Mono Array Spaces is 0
[a]        # Good
[ a ]      # Bad
# Mono Array Spaces is 1
[a]        # Bad
[ a ]      # Good
</code></pre>
This rule is disabled by default.