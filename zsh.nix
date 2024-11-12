{pkgs, ...}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "ls -l";
      update = "sudo nixos-rebuild switch";
      nsp = "nix-shell -p";
    };
    initExtra = ''
      nerdfetch -e
      eval "$(zoxide init zsh)"
      eval "$(starship init zsh)"
    '';
    history = {
      size = 10000;
    };
  };
}
