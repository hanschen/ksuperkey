INSTALL=install
PREFIX=/usr

TARGET := ksuperkey

CFLAGS += -Wall
CFLAGS += `pkg-config --cflags xtst x11`
LDFLAGS += `pkg-config --libs xtst x11`
LDFLAGS += -pthread

$(TARGET): xcape.c
	$(CC) $(CFLAGS) -o $@ $< $(LDFLAGS)

install:
	$(INSTALL) -Dm 755 $(TARGET) $(DESTDIR)$(PREFIX)/bin/$(TARGET)
	$(INSTALL) -Dm 644 ksuperkey.desktop $(DESTDIR)$(PREFIX)/share/autostart/ksuperkey.desktop

clean:
	if [ -e $(TARGET) ]; then rm $(TARGET); fi

.PHONY: clean
