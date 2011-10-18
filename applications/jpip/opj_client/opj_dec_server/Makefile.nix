J2KINCDIR = ../../../../libopenjpeg
J2KLIBDIR = $(J2KINCDIR)/.libs
JPIPLIBDIR = ../../libopenjpip
LIBFNAME = $(JPIPLIBDIR)/libopenjpip_local.a $(J2KLIBDIR)/libopenjpeg.a
CFLAGS  = -O3 -Wall -I$(JPIPLIBDIR) -I$(J2KINCDIR)
LDFLAGS = -L$(JPIPLIBDIR) -L$(J2KLIBDIR) -lm -lopenjpip_local
#-lws2_32

ALL = opj_dec_server

all: $(ALL)

opj_dec_server: opj_dec_server.o jp2k_decoder.o imgsock_manager.o jpipstream_manager.o cache_manager.o dec_clientmsg_handler.o $(LIBFNAME)
	$(CC) $(CFLAGS) $< jp2k_decoder.o imgsock_manager.o jpipstream_manager.o cache_manager.o dec_clientmsg_handler.o $(LDFLAGS) $(LIBFNAME) -o $@

clean:
	rm -f $(ALL) *.o *~
