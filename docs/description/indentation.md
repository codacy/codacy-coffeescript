This rule imposes a standard number of spaces(tabs) to be used for
indentation. Since whitespace is significant in CoffeeScript, it's
critical that a project chooses a standard indentation format and
stays consistent. Other roads lead to darkness. <pre> <code>#
Enabling this option will prevent this ugly
# but otherwise valid CoffeeScript.
twoSpaces = () ->
  fourSpaces = () ->
      eightSpaces = () ->
            'this is valid CoffeeScript'

</code>
</pre>
Two space indentation is enabled by default.