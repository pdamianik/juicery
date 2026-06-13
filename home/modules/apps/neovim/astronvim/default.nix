{ pkgs, ... }:
let
  refresh = pkgs.writeScriptBin "nvim-refresh" ''
    rm -rf ~/.config/nvim/lazy-lock.json
    rm -rf ~/.config/lvim
    
    rm -rf ~/.cache/lvim
    rm -rf ~/.cache/nvim
    
    rm -rf ~/.local/share/lvim
    rm -rf ~/.local/share/nvim
    
    rm -rf ~/.local/state/lvim
    rm -rf ~/.local/state/nvim
  '';
in
{
  config = {
    home.packages = with pkgs; [
      # Essential
      # neovim
      ripgrep
      lazygit
      gdu
      bottom
      # LSP dependencies
      stylua
      selene
      ruff
      nixd
      deadnix
      rustup # Must run `rustup default stable`
      nodejs_26
      python315
    ] ++ [
      refresh
    ];
    xdg.configFile = {
      "nvim/lua" = {
        source = src/lua;
        recursive = true;
      };
      "nvim/init.lua" = {
        source = src/init.lua;
      };
    };
  };
}

