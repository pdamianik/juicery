{
  imports = [
    ../printing
    ../printing/canon_mx515.nix
  ];

  hardware.printers.ensureDefaultPrinter = "Canon_MX515";
}
