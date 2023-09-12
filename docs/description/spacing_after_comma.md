This rule checks to make sure you have a space after commas.
Consecutive commas are allowed when skipping array elements
if "ignore_elision" is true.
<pre><code>
# ignore_elision: true
[,, c,, e, f] = [1, 2, 3, 4, 5, 6]
</code></pre>