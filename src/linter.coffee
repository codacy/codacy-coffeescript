fs = require 'fs'
path = require 'path'
{lint} = require '@coffeelint/cli'
transform = require './transform'

lintFile = (file, config) ->
    errors = lint (fs.readFileSync file).toString(), config
    err.filename = file for err in errors
    errors

lintDir = (dir, config) ->
    errors = []
    files = fs.readdirSync dir
    for file in files
        file = path.join dir, file
        stats = fs.statSync file
        if stats.isDirectory()
            errors = errors.concat lintDir file, config
        else
            errors = errors.concat lintFile file, config

    errors

exports.lintFile = lintFile
exports.lintDir = lintDir
