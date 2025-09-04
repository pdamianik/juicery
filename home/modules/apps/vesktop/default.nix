{ lib, config, username, ... }:
let
  themes = builtins.attrNames (builtins.readDir ./themes);
  cfg = config.programs.vesktop;
in
{
  imports = [
    ../../../users/${username}/modules/apps/vesktop
  ];

  options.programs.vesktop = {
    theme = builtins.listToAttrs (map (theme: {
      name = theme;
      value = {
        enable = lib.mkEnableOption "the Vencord theme \"${theme}\"";
      };
    }) themes);
    arrpc = lib.mkOption {
      default = true;
      type = lib.types.bool;
      description = "Enable Arrpc to provide RPC information to Vesktop";
      example = false;
    };
  };

  config = {
    programs.vesktop = {
      enable = true;
      vencord = {
        settings.enabledThemes = map (theme: "${theme}.css") (builtins.filter (theme: cfg.theme.${theme}.enable) themes);
        themes = builtins.listToAttrs (map (theme: {
          name = theme;
          value = ./themes/${theme};
        }) themes);
      };
    };
    services.arrpc.enable = cfg.arrpc;
  };
}

