## Steps to setup pre-commit hook
- Clone / download this repo contents

- Copy `config` and  `pre-commit` files into hooks folders located inside your local git clones

eg- If I have cloned `jbolo` git repo at location `/home/manoj/GIT/jbolo/` then hook folder is located at

`/home/manoj/GIT/jbolo/.git/hooks`. Copy files into `.git/hooks` folder


- Give executable permission to `pre-commit` file


That's it - you will start seeing php compilation & phpcs errors on every git commit itself.

## Steps to setup commit-msg hook
- Clone / download this repo contents

- Copy `commit-msg` file into hooks folders located inside your local git clones

eg- If I have cloned `jbolo` git repo at location `/home/manoj/GIT/jbolo/` then hook folder is located at

`/home/manoj/GIT/jbolo/.git/hooks`. Copy file into `.git/hooks` folder


- Give executable permission to `commit-msg` file


That's it - you will start seeing invalid commit msg errors if you don't follow commit message format.

### Sooner the better!

## Symlink phpcs hooks, config in all of your local repos

You can use this script to symlink phpcs config, hooks in local git repos in one go
https://github.com/techjoomla/maintenance-scripts/blob/master/symlink_git_hooks.sh

Proposed repos strucure as below

- /home/manoj/GIT/
  - maintenance-scripts/ (https://github.com/techjoomla/maintenance-scripts)
- /home/manoj/GIT/techjoomla-repos/
  - repo1/
  - repo2/
- /home/manoj/GIT/manoj-repos/
  - repo1/
  - repo2/
  
  Steps
- Make sure this repo itself is located (cloned) at different location
- Then edit and update above .sh file to specify git repos path eg: /home/manoj/GIT/techjoomla-repos/
- and run `sh /home/manoj/GIT/symlink_git_hooks.sh`

This will add above phpcs config file, pre-commit, commit-msg hooks into all your local repos located in folder  /home/manoj/GIT/techjoomla-repos/
