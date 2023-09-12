linter = require './linter'
transform = require './transform'
defaultLintConfig = require './default'

lintConfig = {}

try
    fs = require 'fs'
    data = fs.readFileSync '/.codacyrc', 'utf8'
    userConfig = JSON.parse(data)
catch
    userConfig = {}

for tool in userConfig.tools when tool.name is '@coffeelint/cli'
    for pattern in tool.patterns
        lintConfig[pattern.patternId] = defaultLintConfig[pattern.patternId]
        if pattern.parameters
            for parameter in pattern.parameters when parameter.name is 'value'
                lintConfig[pattern.patternId]["value"] = parameter.value

if userConfig.files
    errors = []
    for file in userConfig.files
        errors = errors.concat linter.lintFile "/src/#{file}", lintConfig
else
    errors = linter.lintDir '/src'

errors = (transform err for err in errors when err.rule in Object.keys(lintConfig))
console.log JSON.stringify err for err in errors
