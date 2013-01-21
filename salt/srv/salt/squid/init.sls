squid:
  pkg.installed

/etc/squid3/squid.conf:
  file.managed:
     - user: root
     - group: root
     - mode: 644
     - source: salt://squid/squid.conf
     - require:
       - pkg: squid
    
/etc/squid3/storeurl.pl:
  file.managed:
    - user: root
    - group: root
    - mode: 775
    - source: salt://squid/storeurl.pl
    - require:
      - pkg: squid