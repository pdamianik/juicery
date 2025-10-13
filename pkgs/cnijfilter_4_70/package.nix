{
  stdenv,
  lib,
  fetchzip,
  autoconf,
  automake,
  cups,
  glib,
  libxml2,
  libusb1,
  libtool,
  withDebug ? false,
}:

stdenv.mkDerivation {
  pname = "cnijfilter2";

  version = "6.70a";

  src = fetchzip {
    url = "https://gdlp01.c-wss.com/gds/7/0100012137/01/cnijfilter2-source-6.70-1.tar.gz";
    sha256 = "9n5fXfMFkniO4FOAw2fDE5y1zqILIuQqDjTFhDL8C1M=";
  };

  nativeBuildInputs = [
    automake
    autoconf
  ];
  buildInputs = [
    cups
    glib
    libxml2
    libusb1
    libtool
  ];

  patches = [
    ./patches/get_protocol.patch
    ./patches/add_missing_import.patch
  ];

  # lgmon3's --enable-libdir flag is used solely for specifying in which
  # directory the cnnnet.ini cache file should reside.
  # NixOS uses /var/cache/cups, and given the name, it seems like a reasonable
  # place to put the cnnet.ini file, and thus we do so.
  #
  # Note that the drivers attempt to dlopen
  # $out/lib/cups/filter/libcnbpcnclapicom2.so
  buildPhase = ''
    mkdir -p $out/lib
    cp com/libs_bin_x86_64/* $out/lib
    mkdir -p $out/lib/cups/filter
    ln -s $out/lib/libcnbpcnclapicom2.so $out/lib/cups/filter

    export NIX_LDFLAGS="$NIX_LDFLAGS -L$out/lib"
  ''
  + lib.optionalString withDebug ''
    export NIX_CFLAGS_COMPILE="$NIX_CFLAGS_COMPILE -D__DEBUG__ -DDEBUG_LOG"
  ''
  + ''

    (
      cd lgmon3
      substituteInPlace src/Makefile.am \
        --replace /usr/include/libusb-1.0 \
                  ${libusb1.dev}/include/libusb-1.0
      ./autogen.sh --prefix=$out --enable-progpath=$out/bin \
                   --datadir=$out/share \
                   --enable-libdir=/var/cache/cups
      make
    )

    (
      cd cmdtocanonij2
      ./autogen.sh --prefix=$out
      make
    )

    (
      cd cmdtocanonij3
      ./autogen.sh --prefix=$out
      make
    )

    (
      cd cnijbe2
      substituteInPlace src/Makefile.am \
        --replace "/usr/lib/cups/backend" \
                  "$out/lib/cups/backend"
      ./autogen.sh --prefix=$out --enable-progpath=$out/bin
      make
    )

    (
      cd rastertocanonij
      ./autogen.sh --prefix=$out --enable-progpath=$out/bin
      make
    )

    (
      cd tocanonij
      ./autogen.sh --prefix=$out --enable-progpath=$out/bin
      make
    )

    (
      cd tocnpwg
      ./autogen.sh --prefix=$out --enable-progpath=$out/bin
      make
    )
  '';

  installPhase = ''
    (
      cd lgmon3
      make install
    )

    (
      cd cmdtocanonij2
      make install
    )

    (
      cd cmdtocanonij3
      make install
    )

    (
      cd cnijbe2
      make install
    )

    (
      cd rastertocanonij
      make install
    )

    (
      cd tocanonij
      make install
    )

    (
      cd tocnpwg
      make install
    )

    mkdir -p $out/share/cups/model
    cp ppd/*.ppd $out/share/cups/model
  '';

  meta = with lib; {
    description = "Canon InkJet printer drivers";
    longDescription = ''
      Canon InjKet printer drivers for series GX1040 GX1050 GX2040 GX2050 GX5540
      GX5550 MAXIFY GX6540 MAXIFY GX6550 PIXMA TS7640i PIXMA TS7650i PIXMA TS7740i
      PIXMA TS7750i PIXMA TS8750 PIXMA TS8751.
    '';
    homepage = "https://hk.canon/en/support/0101048401/1";
    license = licenses.unfree;
    platforms = [
      "i686-linux"
      "x86_64-linux"
    ];
    maintainers = [ ];
  };
}
