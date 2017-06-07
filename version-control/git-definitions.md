# Git Definitions

**Instructions**

#Define each of the following Git concepts.

* What is version control?  Why is it useful?
```Version control is a system that records changes of a file or files. It records who made the change, what the change was, and what time the change was made. It's useful because sometimes people make mistakes--there could be bugs in the changes. Sometimes you might want to roll back changes.```
* What is a branch and why would you use one?
```A branch is a way to make changes without affecting the master. If you view it as a tree, the trunk is already created. Each branch consists of related topics that have to eventually be integrated back into the trunk (the master). You would use one when working with others and even on your own, because mistakes can be made. Before merging back to the master, it makes sense to have someone else review the code (to ensure that what you're doing is accurate) before pushing it to the master branch.```
* What is a commit? What makes a good commit message?
```A commit is a save point in git. It's like when you're saving in a videogame. You might screw up and you want to be sure you can go back to where things were okay. A good commit message is when the message is short enough to encapsulate the change you made. If done early and often, the changes are kept track of and can be rolled back if necessary. They should be logical.```
* What is a merge conflict?
```A merge conflict occurs when another person modifies the same file you made a change to or deletes a file you were working on, or adds a file of the same name you created.```