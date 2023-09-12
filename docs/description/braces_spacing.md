This rule checks to see that there is the proper spacing inside
curly braces. The spacing amount is specified by "spaces".
The spacing amount for empty objects is specified by
"empty_object_spaces".
The spacing amount for objects containing a single item is
specified by "mono_object_spaces".
<pre><code>
# Spaces is 0
{a: b}     # Good
{a: b }    # Bad
{ a: b}    # Bad
{ a: b }   # Bad
# Spaces is 1
{a: b}     # Bad
{a: b }    # Bad
{ a: b}    # Bad
{ a: b }   # Good
{ a: b  }  # Bad
{  a: b }  # Bad
{  a: b  } # Bad
# Empty Object Spaces is 0
{}         # Good
{ }        # Bad
# Empty Object Spaces is 1
{}         # Bad
{ }        # Good
# Mono Object Spaces is 0
{a}        # Good
{ a }      # Bad
# Mono Object Spaces is 1
{a}        # Bad
{ a }      # Good
</code></pre>
This rule is disabled by default.