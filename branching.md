# Branching

The Lantern team works off of the "devel" branch, creating feature branches off of devel and merging devel into master after all testing and QA has been done to ensure that devel is stable. This flow is as follows:

1. Any bug/feature gets its own branch off devel

1. Changes are pull requested into devel

1. QA is done on devel

1. Once QA considers devel good, translations are updated and so on, devel is merged into master

1. master is always ready to release and releases are always cut from master

1. Emergency fixes can be pull requested to master directly, in which case they should be reverse merged into devel ASAP

1. Submodules lantern-common and lantern-ui don't need devel branches, since lantern master always has a stable view of those submodules based on whatever commit it's pointing at

