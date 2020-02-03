KSUPERKEY
=========

ksuperkey allows you to open the application launcher in desktop environments
such as KDE Plasma and Xfce using the Super key (also known as "Meta" or "the
Windows key").
If you hold down the Super key it will still act as a modifier key, allowing
you to use it for other keyboard shortcuts.

ksuperkey is a small desktop-agnostic application that runs in the background
as a daemon. It was forked from xcape by Albin Olsson:
https://github.com/alols/xcape

**Plasma 5.8 and above:**
This feature is supported by default in Plasma 5.8 and above.
However, ksuperkey may still be useful to map modifier keys (such as the Super
key) to arbitrary keyboard shortcuts.
If you want to use ksuperkey to map the Super key in Plasma > 5.8, make sure to
disable the Plasma mapping by modifying `~/.config/kwinrc` to:

```
[ModifierOnlyShortcuts]
Meta=
```


Installation
------------

For a list of distribution-specific packages, please see the
[ksuperkey page in the KDE Store](https://store.kde.org/p/1081256/).
Below are some generic instructions for how to compile ksuperkey from source.

1. Install dependencies. 

   Ubuntu:
    ```
    $ sudo apt-get install git gcc make libx11-dev libxtst-dev pkg-config
    ```

    CentOS:
    ```
    $ sudo yum install git gcc make libX11-devel libXtst-devel pkgconfig
    ```

    On some systems you also need to install the `build-essential` (or
    equivalent) package.

2. Clone project and compile:

    ```
    $ git clone https://github.com/hanschen/ksuperkey.git
    $ cd ksuperkey
    $ make
    ```

3. Install system-wide using e.g. `sudo` (optional):

    ```
    $ sudo make install
    ```

4. Launch ksuperkey. Make sure that the shortcut for the application launcher
   is set to Alt+F1.


Usage
-----

    $ ksuperkey [-d] [-t <timeout ms>] [-e <map-expression>]

`-d`

Debug mode. Does not fork into the background.

`-t <timeout ms>`

If you hold a key longer than this timeout, ksuperkey will not generate a key
event. Default is 500 ms.

`-e <map-expression>`

The expression has the grammar `'ModKey=Key[|OtherKey][;NextExpression]'`

The list of key names is found in the header file `X11/keysymdef.h` (remove
the `XK_` prefix). Note that due to limitations of X11 shifted keys *must*
be specified as a shift key followed by the key to be pressed rather than
the actual name of the character. For example to generate "{" the
expression `'ModKey=Shift_L|bracketleft'` could be used (assuming that you
have a key with "{" above "[").

You can also specify ModKey in decimal (prefix `#`), octal (`#0`), or
hexadecimal (`#0x`). It will be interpreted as a keycode unless no corresponding
key name is found.


#### Example 1

    ksuperkey

Makes left Super key generate Alt+F1 when pressed and released on its own (does 
not affect existing keyboard combinations using the Super key).


#### Example 2

    ksuperkey -e 'Control_L=Escape;Super_L=Alt_L|F2'

This will make Left Control generate Escape when pressed and released on
its own, and Left Super generate Alt+F2 combination when pressed and
released on its own.


Note regarding xmodmap
----------------------

If you are in the habit of remapping keycodes to keysyms (e.g. using xmodmap),
there are two issues you may encounter:

1) You will need to restart ksuperkey after every time you modify the mapping 
   from keycodes to keysyms (e.g. with xmodmap), or ksuperkey will still use 
   the old mapping.
   
2) The key you wish to send must have a defined keycode. So for example, with
   `Control_L=Escape`, you need an Escape key defined in your xmodmap mapping. 
   (A workaround is to use 255, which some keyboards cannot send.)


Contact
-------

Find the latest version at
https://github.com/hanschen/ksuperkey

The author can be reached at
contact at hanschen dot org
