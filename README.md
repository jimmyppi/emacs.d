My emacs config.

Features
========

* Clean environment without menus etc.
* Tabs with elscreen.
* Syntax and lint checking with flycheck.
* Python pep8 checks.
* Autocomplete.
* Syntax highlighting for Python, Dockerfiles, php, matlab, Puppet, Bash.

Setup
=====

This repo is prepared to live side by side with the other files in your emacs.d
directory and should be cloned inside that directory:

```
# Remove everything if you want a fresh setup
>> rm -rf ~/emacs.d/*
>> cd ~/.emacs.d
>> git clone --recursive git@github.com:/jimmyppi/emacs.d .
```

The next time you start emacs the package installation will take a couple
of minutes.

If you have a .emacs file in your home directory, that file must first be
removed because emacs will look for that file before emacs.d/init.el,
which is used by this setup.

TODO
====

* web mode
* magit
* org-mode
* rst/md-mode
* workgroups
* window size at startup
