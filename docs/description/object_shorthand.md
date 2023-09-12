<p>Use property value shorthand in objects, when explicit braces are used.</p>
<pre><code>test = "value"

# Good
{test}
test: test

# Bad
{test: test}
</code></pre>