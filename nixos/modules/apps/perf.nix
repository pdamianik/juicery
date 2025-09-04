{ config, ... }:
{
  environment.systemPackages = [
    config.kernelPackages.perf
  ];
}
