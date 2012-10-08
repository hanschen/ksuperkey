KSUPERKEY
=========

ksuperkey allows you to open the application launcher in KDE Plasma Desktop
using the Super key (also known as the "Windows key"). If you hold down the
Super key it will still act as a modifier key, allowing you to use it for
other keyboard shortcuts.

ksuperkey is a small application that runs in the background as a daemon. It
was forked from xcape by Albin Olsson: https://github.com/alols/xcape

Installation
------------

1. Install dependencies. On Ubuntu:
    $ sudo apt-get install git gcc make libx11-dev libxtst-dev

2. Clone project and compile:
    $ git clone https://github.com/hanschen/ksuperkey.git
    $ cd ksuperkey
    $ make

3. Launch ksuperkey. Make sure that the shortcut for the application launcher
   is set to Alt+F1.

Contact
-------

Find the latest version at
https://github.com/hanschen/ksuperkey

The author can be reached at
contact at hanschen dot org
