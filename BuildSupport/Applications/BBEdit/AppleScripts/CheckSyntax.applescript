set BBEditUtil to load script POSIX file "/Users/carolclark/Library/Application Support/BBEdit/Scripts/BBEditUtil.scpt"
--tell BBEditUtil to set CdocInfo to getCdocInfo()
-- set projname to projectname of CdocInfo
activate application "BBEdit"
tell BBEditUtil to validateHTML("~/CCDev/Sites", "TechnicalDocs", "Syntax")
