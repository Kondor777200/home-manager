# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    <home-manager/nixos>
  ];
  nixpkgs.config.allowUnfree = true;
  xdg.portal = {
    enable = true;
    extraPortals = [pkgs.xdg-desktop-portal-gtk];
  };
  environment.shells = with pkgs; [zsh];

  home-manager.users.albert = {pkgs, ...}: {
    home.stateVersion = "24.05";
    home.packages = with pkgs; [
      libreoffice
      hyprpaper
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
    ];

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
        ];
        exec-once = [
          "asztal"
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
          };
        };
        gestures = {
          workspace_swipe = true;
          workspace_swipe_use_r = true;
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
          # window floating
          "$mod, V, togglefloating,"
        ];
        bindm = [
          "$mod, mouse:272, movewindow"
          "$mod, mouse:273, resizewindow"
        ];
      };
    };
  };

  hardware.opengl.extraPackages = [
    pkgs.amdvlk
  ];
  hardware.opengl = {
    enable = true;
    driSupport32Bit = true;
  };

  # Pipewire shit
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
  };

  boot.extraModprobeConfig = ''
    options snd slots=snd-hda-intel
  '';

  #Shit no one cares about (until they do)

  #fonts
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    fira-code-nerdfont
  ];
  # Bootloader.
  boot.loader.systemd-boot.enable = false;
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.useOSProber = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelParams = [
    "quiet"
    "splash"
    "radeon.audio=1"
  ];

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Prague";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "cs_CZ.UTF-8";
    LC_IDENTIFICATION = "cs_CZ.UTF-8";
    LC_MEASUREMENT = "cs_CZ.UTF-8";
    LC_MONETARY = "cs_CZ.UTF-8";
    LC_NAME = "cs_CZ.UTF-8";
    LC_NUMERIC = "cs_CZ.UTF-8";
    LC_PAPER = "cs_CZ.UTF-8";
    LC_TELEPHONE = "cs_CZ.UTF-8";
    LC_TIME = "cs_CZ.UTF-8";
  };

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
  users.users.albert = {
    isNormalUser = true;
    description = "Albert";
    extraGroups = ["networkmanager" "wheel" "video" "pipewire"];
    packages = with pkgs; [];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    #  wget
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
