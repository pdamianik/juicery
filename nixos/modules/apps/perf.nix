{ config, ... }:
{
  environment.systemPackages = [
    config.perf
  ];
}
