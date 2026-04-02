{ pkgs, ... }:
{
  home.packages = with pkgs; [ music-discord-rpc ];
  systemd.user.services.music-discord-rpc = {
    Unit = {
      Description = "Cross-platform Discord rich presence for music with album cover and progress bar support.";
      After = ["network.target"];
    };

    Service = {
      ExecStart = "${pkgs.music-discord-rpc}/bin/music-discord-rpc";
      Restart = "Always";
      RestartSec = "10";
      StandardOutput = "journal";
      StandardError = "journal";
    };

    Install = {
      WantedBy = ["default.target"];
    };
  };
}
