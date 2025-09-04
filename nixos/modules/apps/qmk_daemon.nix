{ inputs, system , ... }:
{
  imports = [
    inputs.qmk_daemon.nixosModules.${system}.default
  ];
}
