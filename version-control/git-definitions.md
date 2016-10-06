# Git Definitions

**Instructions: ** Define each of the following Git concepts.

* What is version control?  Why is it useful?

 * **Version control** is the organization of a project, most commonly a repository [for Git], and the process by which revisions to that project are made and tracked.  **Version control** helps in maintaining a secure and expedient process of collaboration.  Instead of a single repository that can be revised by a single user, multiple users could make changes and merge those into a master project.  Additionally, **version control** provides security in maintaining a history of these revisions.  The history can be used to navigate where a project went off course (e.g. a bug was introduced) or allow the project to be reverted to a previous state since multiple backups are available.  
* What is a branch and why would you use one?
 * A **branch** is a duplication of a project, most commonly a repository [for Git... whoa, deja vu] that can be revised in parallel with the duplicated branch.  **Branches** may be made of the *master branch*, which is the main source for your repository, or they can be created from other branches with the intent of testing changes and later merging them back into other branches (optimally the master). 
* What is a commit? What makes a good commit message?
 * A **commit** is a recording of added, or staged, content to the current branch.  A **commit** will create a savepoint that serves as a backup to return to the current committed contents and/or can be pulled and merged into another branch (e.g. master branch).
* What is a merge conflict?
 * A **merge conflict** is a disagreement between changes to the branch being committed and the current working branch into which it's being merged.  A **merge conflict** is often the result of a line of code that has been disagreeably revised on each branch (e.g. the code is removed in one branch, and edited in the other).