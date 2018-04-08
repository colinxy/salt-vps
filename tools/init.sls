{% set vimpkg = 'vim-enhanced' if grains['os_family'] == 'RedHat' else 'vim' %}

tools:
  pkg.installed:
    - pkgs:
      - {{ vimpkg }}
      - emacs-nox
      - git
      - curl
      - htop
      - ranger

vimrc:
  file.blockreplace:
    - name: /etc/vimrc
    - marker_start: '""" START custom vimrc """'
    - marker_end:   '""" END custom vimrc """'
    - append_if_not_found: True
    - backup: '.bak'
    - show_changes: False
    - source: salt://files/vimrc

emacs:
  file.blockreplace:
    - name: /usr/share/emacs/site-lisp/default.el
    - marker_start: ';;;;; START custom emacs init ;;;;;'
    - marker_end:   ';;;;; END custom emacs init ;;;;;'
    - append_if_not_found: True
    - backup: '.bak'
    - show_changes: False
    - source: salt://files/emacs-init
