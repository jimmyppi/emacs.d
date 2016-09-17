My emacs config.

# Features

* Clean environment without menus etc.
* Start with max vertical size and 80 characters horizontal size.
* Store backup files in `~/.emacs.d/backups` instead of all over the place.
* Tabs with elscreen.
    * `C-c c` - Create new tab.
    * `C-c d` - Delete tab.
    * `C-c n` - Switch tab right.
    * `C-c m` - Switch tab left.
* Syntax highlighting for Python, Dockerfile, php, matlab, Puppet, Bash, Yaml, markdown.
* Syntax highlighting of rst in python docstrings.
* Autocompletion when coding and searching for files.
* Auto pairing of () [] {} etc.
* Inline syntax checking and linting with [flycheck](http://www.flycheck.org/en/latest/).
* [Markdown mode](http://jblevins.org/projects/markdown-mode/)
* Git binding with [magit](https://magit.vc/).

# Setup

This repo is prepared to live side by side with the other files in your
`emacs.d` directory and should be cloned inside that directory:

    # Remove everything if you want a fresh setup
    >> rm -rf ~/emacs.d/*
    >> cd ~/.emacs.d
    >> git clone --recursive git@github.com:/jimmyppi/emacs.d .

`--recursive` is needed because the repo uses git submodules to fetch some
external packages.

If you have a `.emacs` file in your home directory, that file must first be
removed because emacs will look for that file before `emacs.d/init.el`,
which is used by this setup.

The next time you start emacs the package installation will take a couple
of minutes.

# External resources

The tab functionality needs elscreen. Syntax checking and linting are done
by using external tools that need to be installed. See this page for more
languages: [http://www.flycheck.org/en/latest/languages.html#flycheck-languages](http://www.flycheck.org/en/latest/languages.html#flycheck-languages)

## apt-get install

* elscreen
* shellcheck
* tidy
* phpmd
* chktex
* markdown

## pip install

* yapf
* autopep8
* jedi
* rope
* importmagic
* elpy
* flake8

## npm install -g

* csslint
* jshint
* jscs
* js-yaml

## gem install

* mdl
* puppet-lint

## pear install

* PHP_CodeSniffer

# Learning emacs

[Key bindings reference card](https://www.gnu.org/software/emacs/refcards/pdf/refcard.pdf)

[Edit remote files](https://www.gnu.org/software/emacs/manual/html_node/emacs/Remote-Files.html)

# TODO

* elpy and autocomplete/flycheck should not be active at the same time.
* web mode
* nginx mode
* smex (search/history of emacs commands)
* workgroups ([https://github.com/pashinin/workgroups2](https://github.com/pashinin/workgroups2))
* hide-show?
* org-mode
* deft