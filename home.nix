{
  config,
  pkgs,
  ...
}: {
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "albert";
  home.homeDirectory = "/home/albert";
  nixpkgs.config.allowUnfree = true;
  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.
  imports = [
    (import ./tmux.nix)
    (import ./hyprland.nix)
    (import ./zsh.nix)
    (import ./alacritty.nix)
    (import ./hyprpaper.nix)
  ];
  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    alejandra
    fd
    fzf
    eww
    lazygit
    gnupg
    pass
    libreoffice
    hyprpaper
    hyprlock
    inkscape
    nodejs_22
    ferdium
    wev
    nerdfetch
    starship
    zoxide
    zsh
    adwaita-icon-theme
    morewaita-icon-theme
    nwg-drawer
    openssl
    nwg-dock-hyprland
    unzip
    gcc
    git
    vscodium
    nodePackages.pnpm
    firefox-devedition-bin
    btop
    zsh
    neovim
    alacritty
    #ags shit
    ags
    bun
    dart-sass
    fd
    brightnessctl
    swww
    grim
    slurp
    wf-recorder
    wl-clipboard
    wayshot
    swappy
    hyprpicker
    pavucontrol
    networkmanager
    gtk3
    haskellPackages.gi-dbusmenugtk3
    alsa-utils
    alsa-lib
    alsa-firmware
    alsa-plugins
    lsof
    linux-firmware
    sof-firmware
    google-cursor
    nwg-look
    glib
    dconf
    krita
    localsend
    git-credential-manager
    cargo
    rustc
    haskellPackages.webkit2gtk3-javascriptcore
    sbclPackages.cl-rsvg2
    android-studio
    tldr
    anytype
    killall
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
  programs.java.enable = true;
  programs.git = {
    enable = true;
    userName = "albertvala";
    userEmail = "albert.vala@haxagon.cz";
  };
  home.sessionVariables = {
    # EDITOR = "emacs";
  };
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
