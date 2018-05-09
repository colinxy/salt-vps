{% set swapfile = '/swapfile' %}


colinxy:
  user.present:
    - shell: /bin/bash
    - home: /home/colinxy
    - groups:
      - wheel


# firewall
firewalld:
  pkg.installed:
    - pkgs:
      - firewalld
  service.running:
    - name: firewalld
    - enable: True
    - watch:
      - firewalld: public

firewall-public:
  firewalld.present:
    - name: public
    - services:
      - ssh


# swap
# https://github.com/saltstack/salt-jenkins/blob/master/extra-swap.sls
create-swap-file:
  cmd.run:
    - name: |
        dd if=/dev/zero of={{ swapfile }} bs=1M count={{ grains["mem_total"]}}
        chmod 0600 {{ swapfile }}
    - unless: grep -q {{ swapfile }} /proc/swaps

make-swap:
  cmd.run:
    - name: mkswap {{ swapfile }}
    - unless: grep -q {{ swapfile }} /proc/swaps
    - require:
      - cmd: create-swap-file
  mount.swap:
    - name: {{ swapfile }}
    - persist: True
