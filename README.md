My emacs config.

Requires emacs >= 24.

# Features

* Clean environment without menus etc.
* Start with max vertical size and 80 characters horizontal size.
* Store backup files in `~/.emacs.d/backups` instead of all over the place.
* Tabs with elscreen.
    * `C-c c` - Create new tab.
    * `C-c d` - Delete tab.
    * `C-c n` - Switch tab right.
    * `C-c m` - Switch tab left.
* Syntax highlighting that are not built in for Dockerfile, Yaml, markdown, Kotlin, Gradle.
* Autocompletion when coding and searching for files.
* Auto pairing of () [] {} etc.
* Inline syntax checking and linting with
  [flycheck](http://www.flycheck.org/en/latest/).
  See also [External resources](#external-resources) below.
* Python development environment with
  [elpy](https://elpy.readthedocs.io/en/latest/index.html).
* Syntax highlighting of rst in python docstrings.
* [Markdown mode](http://jblevins.org/projects/markdown-mode/).
* Gradle and kotlin mode.
* Yaml mode.
* Git binding with [magit](https://magit.vc/).

# Setup

This repo is prepared to live side by side with the other files in your
`emacs.d` directory and should be cloned inside that directory:

    # Remove everything if you want a fresh setup
    >> rm -rf ~/.emacs.d/*
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

The tab functionality needs elscreen.

Elpy uses a lot of packages.

Syntax checking and linting are done by using external tools that need to
be installed. Below lists resources for shell/bash, html, css, javascript,
latex, yaml, markdown, python.
See this page for more languages: [http://www.flycheck.org/en/latest/languages.html#flycheck-languages](http://www.flycheck.org/en/latest/languages.html#flycheck-languages).

## apt install

* elscreen (tabs)
* shellcheck (check bash script)
* tidy (check html/xml syntax)
* phpmd (php linter)
* chktex (check Tex/Latex style)
* markdown (Text-to-HTML conversion tool, is this needed?)
* jq (check json)

## python3 -m pip install --user (install pip: apt install python3-pip)

Install elpy in the system python environment:

* elpy

## pipx install (install pipx: python3 -m pip install --user pipx)

Install these apps in their own isolated environments with pipx:

* flake8
* mypy

## Elpy RPC virtual env (installed by elpy in a separate virtualenv)

These packages will be installed in the dedicated rpc virtualenv the first time
elpy is activated:

* jedi
* yapf
* autopep8
* black

## npm install -g (snap install node --classic)

* csslint
* jshint
* eslint
* js-yaml

## gem install (apt install ruby-rubygems)

* mdl (check markdown syntax)

## other

* ktlint - https://github.com/pinterest/ktlint#installation

# Learning emacs

[Key bindings reference card](https://www.gnu.org/software/emacs/refcards/pdf/refcard.pdf)

[Edit remote files](https://www.gnu.org/software/emacs/manual/html_node/emacs/Remote-Files.html)

# TODO

* auto activation of python virtualenv (did not get it to work with auto-virtualenv and pyenv-mode).
* web mode
* nginx mode
* smex (search/history of emacs commands)
* workgroups ([https://github.com/pashinin/workgroups2](https://github.com/pashinin/workgroups2))
* hide-show?
* org-mode
* deft
