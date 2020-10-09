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
