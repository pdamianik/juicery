{
  imports = [
    ../printing
    ../printing/canon_mx515.nix
    ../printing/canon_gx2050.nix
  ];

  hardware.printers.ensureDefaultPrinter = "Canon_GX2050";
}
