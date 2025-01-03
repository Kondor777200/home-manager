{
  pkgs,
  inputs,
  ...
}: {
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
        "GTK_THEME,Adwaita:dark"
        "$XDG_CONFIG_HOME,/home/albert/.config"
        "AMD_VULKAN_ICD,RADV"
      ];
      exec-once = [
        "hyprpanel"
        "udiskie"
        "dbus-update-activation-environment --system --all"
      ];
      monitor = [
        ",preferred,auto,1"
      ];
      general = {
        gaps_in = 5;
        gaps_out = 5;
        border_size = 2;
        "col.active_border" = "rgba(47bac0ff) rgba(e4609bff) 45deg";
        "col.inactive_border" = "rgba(595959aa)";
      };
      decoration = {
        rounding = 5;
      };
      input = {
        kb_layout = "us";
        kb_variant = "cz_sk_de";
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
        "$mod, L, exec, hyprlock"
        "$mod, Q, exec, kitty"
        "$mod, F, exec, zen"
        "$mod, SPACE, exec, ./.config/rofi/scripts/launcher_t7"
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
}
