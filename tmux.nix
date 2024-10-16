{pkgs, ...}: let
  tmux-vim-navigator =
    pkgs.tmuxPlugins.mkTmuxPlugin
    {
      pluginName = "tmux-vim-navigator";
      version = "latest";
      src = pkgs.fetchFromGitHub {
        owner = "christoomey";
        repo = "vim-tmux-navigator";
        rev = "master";
        sha256 = "sha256-IcgMyMbI2/evwRqdawXYJmJw3Q/jGbVuCOWUKYXz2mk=";
      };
    };
in {
  programs.tmux = {
    enable = true;
    shell = "${pkgs.zsh}/bin/zsh";
    terminal = "tmux-256color";
    historyLimit = 100000;
    plugins = with pkgs; [
      tmuxPlugins.sensible
      tmuxPlugins.better-mouse-mode
      {
        plugin = tmux-vim-navigator;
      }
    ];
    extraConfig = ''
    '';
  };
}
