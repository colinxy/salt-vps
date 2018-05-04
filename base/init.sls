
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
