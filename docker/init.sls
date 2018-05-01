
docker-ce repo:
  file.managed:
    - name: /etc/yum.repos.d/docker-ce.repo
    - source: salt://docker/docker-ce.repo

docker-ce:
  pkg.installed

docker:
  service.running:
    - enable: True
