var coffeelint = require('coffeelint');

var defaultPatterns = [
    "no_interpolation_in_single_quotes",
    "no_stand_alone_at",
    "no_backticks",
    "duplicate_key",
    "cyclomatic_complexity",
    "no_unnecessary_fat_arrows",
    "no_tabs",
    "ensure_comprehensions"
]

module.exports = function(grunt) {
    grunt.registerTask('patterns', 'Generate docs for codacy', function() {
        var done = this.async();
        grunt.log.writeln('Generating docs...');

        var spec = grunt.file.readJSON('tasks/patterns.json');
        var codacyPatterns = {
            name: spec.name,
            version: coffeelint.VERSION,
            patterns: []
        };

        var codacyPatternDescriptions = [];

        for (var rule in coffeelint.RULES) {
            if (spec.patterns[rule]) {
                var category = spec.patterns[rule].category;
                var message = coffeelint.RULES[rule].message;
                var description = coffeelint.RULES[rule].description;
                var level = spec.patterns[rule].level;
                var parameters = spec.patterns[rule].parameters;

                grunt.file.write('docs/description/'+rule+'.md', description);
                codacyPatterns.patterns.push({
                    patternId: rule,
                    category: category,
                    level: level,
                    parameters: parameters,
                    enabled: defaultPatterns.includes(rule)
                });

                codacyPatternDescriptions.push({
                    patternId: rule,
                    title: titleize(rule),
                    description: message,
                    parameters: parameters,
                    timeToFix: 5
                });
            } else {
                console.log("Missing rule: " + rule);
            }
        }

        grunt.file.write('docs/description/description.json', JSON.stringify(codacyPatternDescriptions, null, 2));

        grunt.file.write('docs/patterns.json', JSON.stringify(codacyPatterns, null, 2));

        function titleize(name) {
            var words = name.replace(/_/g, ' ').split(' ');
            var buffer = [];
            for (var i = 0; i < words.length; ++i) {
                buffer.push(words[i].charAt(0).toUpperCase() + words[i].toLowerCase().slice(1));
            }
            return buffer.join(' ');
        }
    });
};
