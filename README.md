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

    ```
    $ sudo apt-get install git gcc make libx11-dev libxtst-dev
    ```

2. Clone project and compile:

    ```
    $ git clone https://github.com/hanschen/ksuperkey.git
    $ cd ksuperkey
    $ make
    ```

3. Launch ksuperkey. Make sure that the shortcut for the application launcher
   is set to Alt+F1.

Usage
-----
    $ xcape [-d] [-t <timeout ms>] [-e <map-expression>]

### `-d`

Debug mode. Does not fork into the background.

### `-t <timeout ms>`

If you hold a key longer than this timeout, xcape will not generate a key
event. Default is 50 ms.

### `-e <map-expression>`

The expression has the grammar `'ModKey=Key[|OtherKey][;NextExpression]'`

The list of key names is found in the header file `X11/keysymdef.h`
(remove the `XK_` prefix).

#### Example

    xcape -e 'Shift_L=Escape;Control_L=Control_L|O'

This will make Left Shift generate Escape when pressed and released on
it's own, and Left Control generate Ctrl-O combination when pressed and
released on it's own.

Note regarding xmodmap
----------------------

If you are in the habit of remapping keycodes to keysyms (eg, using xmodmap),
there are two issues you may encounter.

1) You will need to restart xcape after every time you modify the mapping from
   keycodes to keysyms (eg, with xmodmap), or xcape will still use the old
   mapping.
   
2) The key you wish to send must have a defined keycode. So for example, with
   the default mapping `Control_L=Escape`, you still need an escape key defined
   in your xmodmap mapping. (I get around this by using 255, which my keyboard
   cannot send).

Contact
-------

Find the latest version at
https://github.com/hanschen/ksuperkey

The author can be reached at
contact at hanschen dot org
