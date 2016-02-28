#!/bin/bash

apt-get update
apt-get clean
apt-get autoclean
apt-get autoremove -y
apt-get install -y psmisc xvfb gtk2-engines-pixbuf libexif12 libxpm4 libxrender1 libgtk2.0-0 libnss3 libgconf-2-4 x11-xkb-utils xfonts-100dpi xfonts-75dpi xfonts-base xfonts-scalable xfonts-cyrillic x11-apps chromium-browser sqlite
