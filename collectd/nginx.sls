{% from "collectd/map.jinja" import collectd_settings with context %}

include:
  - collectd
  - collectd.workaround-salt-ssh

{{ collectd_settings.plugindirconfig }}/nginx.conf:
  file.managed:
    - source: salt://collectd/files/nginx.conf
    - user: {{ collectd_settings.user }}
    - group: {{ collectd_settings.group }}
    - mode: 644
    - template: jinja
    - require:
      - sls: collectd.workaround-salt-ssh
    - watch_in:
      - service: collectd-service
