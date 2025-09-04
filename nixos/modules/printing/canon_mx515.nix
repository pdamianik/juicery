{ pkgs, ... }:
{
  hardware.printers = {
    ensurePrinters = [
      {
        name = "Canon_MX515";
        location = "Cellar";
        # deviceUri = "ipp://10.0.0.27:631/";
        deviceUri = "dnssd://Canon%20MX510%20series._ipp._tcp.local/?uuid=00000000-0000-1000-8000-888717BD4B64";
        model = "gutenprint.5.3://bjc-PIXMA-MX515/expert";
        ppdOptions = {
          PageSize = "A4";
          Duplex = "DuplexNoTumble";
        };
      }
    ];
  };

  services.printing.drivers = with pkgs; [
    gutenprint
    gutenprintBin
    cnijfilter2
  ];
}

