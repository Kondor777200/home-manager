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
    pfetch-rs
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
    logseq
    git-credential-manager
    cargo
    rustc
    haskellPackages.webkit2gtk3-javascriptcore
    sbclPackages.cl-rsvg2
    android-studio
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "ls -l";
      update = "sudo nixos-rebuild switch";
    };
    initExtra = ''
      pfetch
      eval "$(zoxide init zsh)"
      eval "$(starship init zsh)";
    '';
    history = {
      size = 10000;
    };
  };
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

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    settings = {
      env = [
        "HYPRCURSOR_THEME,GoogleDot-Black"
        "HYPRCURSOR_SIZE,24"
        "XCURSOR_THEME,GoogleDot-Black"
        "XCURSOR_SIZE,24"
        "GCM_CREDENTIAL_STORE,gpg"
        "NIXPKGS_ALLOW_INSECURE,1"
        "GTK_THEME=Adwaita:dark"
      ];
      exec-once = [
        "eww open bar"
      ];
      monitor = [
        ",preferred,auto,1"
      ];
      general = {
        gaps_in = 5;
        gaps_out = 5;
        border_size = 2;
        "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";
      };
      decoration = {
        rounding = 5;
      };
      input = {
        touchpad = {
          "disable_while_typing" = false;
        };
      };
      gestures = {
        workspace_swipe = true;
        workspace_swipe_use_r = true;
        workspace_swipe_direction_lock = false;
        workspace_swipe_forever = true;
      };

      "$mod" = "SUPER";
      bind = [
        # launch apps
        "$mod, Q, exec, alacritty"
        "$mod, F, exec, firefox-developer-edition"
        "$mod, SPACE, exec, nwg-drawer"
        # kill active
        "$mod, C, killactive,"
        # movefocus
        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        "$mod SHIFT, 0, movetoworkspace, 10"
        " , Print, exec, grim -g \"$(slurp -d)\" - | wl-copy"
        # window floating
        "$mod, V, togglefloating,"
      ];
      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];
    };
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/albert/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
