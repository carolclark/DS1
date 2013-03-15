set BBEditUtil to load script POSIX file "/Users/carolclark/Library/Application Support/BBEdit/Scripts/BBEditUtil.scpt"
activate application "BBEdit"
tell BBEditUtil to validateHTML("~/Library/CCDev/Sites", "TechnicalDocs", "Links")
