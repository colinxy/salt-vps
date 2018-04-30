{% set vimpkg = 'vim-enhanced' if grains['os_family'] == 'RedHat' else 'vim' %}

tools:
  pkg.installed:
    - skip_verify: True
    - pkgs:
      - {{ vimpkg }}
      - emacs-nox
      - git
      - curl
      - htop
      - ranger
      - tmux

vimrc:
  file.blockreplace:
    - name: /etc/vimrc
    - marker_start: '""" START custom vimrc """'
    - marker_end:   '""" END custom vimrc """'
    - append_if_not_found: True
    - backup: '.bak'
    - show_changes: False
    - source: salt://tools/vimrc

emacs:
  file.blockreplace:
    - name: /usr/share/emacs/site-lisp/default.el
    - marker_start: ';;;;; START custom emacs init ;;;;;'
    - marker_end:   ';;;;; END custom emacs init ;;;;;'
    - append_if_not_found: True
    - backup: '.bak'
    - show_changes: False
    - source: salt://tools/emacs-init

# rely on /etc/bashrc sourcing files in /etc/profile.d
bashrc:
  file.managed:
    - name: /etc/profile.d/custom.sh
    - source: salt://tools/bashrc
