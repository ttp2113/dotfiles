# dotfiles
personal dotfiles
ssh config is handled from a separate repo

## To get started on a new machine:
```bash
$ git clone --recursive https://github.com/ttp2113/dotfiles.git

# symlink whichever dotfiles you want to use, e.g.,
$ ln -sf ~/.tmux.conf <reponame>/tmux/.tmux.conf
$ ln -sf ~/.vimrc <reponame>/vim/.vimrc
# . . .  etc . . .
```

# Managing vim plugins with submodules
Ref: https://gist.github.com/manasthakur/d4dc9a610884c60d944a4dd97f0b3560

## Adding plugins
```bash
$ git submodule add https://github.com/<user>/<repo>.git <local-repo>/vim/.vim/bundle/<plugin> 
$ git commit -am "Added submodule for <plugin>"
```

## Removing plugins
```bash
$ git submodule deinit vim/.vim/bundle/<plugin>
$ git rm -r vim/.vim/bundle/<plugin>
$ rm -r .git/modules/vim/.vim/bundle/<plugin>
```

## Updating individual plugins
``` bash
$ cd ~/.vim/bundle/<plugin>
$ git pull origin master
```

Even better, run `git fetch origin master` to review changes, and then `git merge`.

## Update all plugins
``` bash
$ cd ~/.vim
$ git submodule foreach git pull origin master
```

New commits to plugins create uncommitted changes in the main repository. After any updates in the submodules, you need to commit the main repository as well:
``` bash
$ cd ~/.vim
$ git commit -am "Updated plugins."
```

On another machine, if a git pull for the main repository leads to uncommitted changes in the submodules (as a few plugins got updated), perform `git submodule update` to change the recorded state of the submodules.
