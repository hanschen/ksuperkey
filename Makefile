INSTALL=install
PREFIX=/usr
AUTOSTART=/etc/xdg/autostart

TARGET := ksuperkey
DESKTOP := ksuperkey.desktop

CFLAGS += -Wall
CFLAGS += `pkg-config --cflags xtst x11`
LDFLAGS += `pkg-config --libs xtst x11`
LDFLAGS += -pthread

all: $(TARGET)

$(TARGET): xcape.c
	$(CC) $(CFLAGS) -o $@ $< $(LDFLAGS)

install:
	$(INSTALL) -d -m 0755 $(DESTDIR)$(PREFIX)/bin
	$(INSTALL) -m 0755 $(TARGET) $(DESTDIR)$(PREFIX)/bin/$(TARGET)
	$(INSTALL) -d -m 0755 $(DESTDIR)$(AUTOSTART)
	$(INSTALL) -m 0644 $(DESKTOP) $(DESTDIR)$(AUTOSTART)/$(DESKTOP)

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/$(TARGET)
	rm -f $(DESTDIR)$(PREFIX)$(AUTOSTART)/$(DESKTOP)

clean:
	if [ -e $(TARGET) ]; then rm $(TARGET); fi

.PHONY: all clean install
