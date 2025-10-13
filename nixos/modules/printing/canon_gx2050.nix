{ pkgs, ... }:
let
  cnijfilter2 = pkgs.callPackage ../../../pkgs/cnijfilter_4_70/package.nix {};
in
{
  hardware.printers = {
    ensurePrinters = [
      {
        name = "Canon_GX2050";
        location = "Living Room";
        # deviceUri = "ipp://10.0.0.27:631/";
        deviceUri = "dnssd://Canon%20GX2000%20series._ipp._tcp.local/?uuid=00000000-0000-1000-8000-00110d013f1c";
        model = "canongx2000.ppd";
        ppdOptions = {
          PageSize = "A4";
          Duplex = "DuplexNoTumble";
        };
      }
    ];
  };

  services.printing.drivers = [
    cnijfilter2
  ];
}

