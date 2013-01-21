kiwix-pkg:
  pkg.installed:
    - names:
      - libicu48
      - libclucene0ldbl
      - aria2
      - libmicrohttpd5
  require:
    - file: /usr/local/bin
    - cmd: aria2-ppa

aria2-ppa:
  cmd.run:
    - name: sudo add-apt-repository -y ppa:t-tujikawa/ppa
  cmd.run:
    - name: sudo apt-get update

kiwix-serve:
  cmd.run:
    - name: kiwix-serve --port=8081 --daemon /srv/zim/wikipedia_en_simple_all_08_2011.zim
  require:
    - pkg: kiwix-pkg

/usr/local/bin:
  file.recurse:
    - user: root
    - group: root
    - file_mode: 775
    - dir_mode: 664
    - source: salt://kiwix/bin