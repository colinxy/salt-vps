{% set zncroot = '/var/lib/znc' %}

znc pkgs:
  pkg.installed:
    - pkgs:
      - znc
      - znc-devel


znc config:
  file.directory:
    - name: {{ zncroot }}/configs
    - user: znc
    - group: znc
    - makedirs: True
  # file.exists:
  #   - name: {{ zncroot }}/configs/znc.conf


# TODO: this should only happen if config files does not exists

# make znc config:


# TODO: consider writing a module for this
# build znc playback module:
#   file.directory:
#     - name: {{ zncroot }}/modules
#   module.run:
#     - git.latest:
#       - name: https://github.com/jpnurmi/znc-playback.git
#       - target: {{ zncroot }}/znc-playback
#       - user: znc
#     - znc.buildmod: {{ zncroot }}/znc-playback/playback.cpp
#   file.rename:
#     - name: {{ zncroot }}/modules
#     - source: {{ zncroot }}/znc-playback/playback.so
#     - force: True
