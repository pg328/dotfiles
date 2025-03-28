{ config, pkgs ? import <nixpkgs> {}, inputs, ... }:
# imports = [inputs.catppuccin.homeManagerModules.catppuccin];
# gtk = {
#   enable = true;
#   catppuccin = {
#     enable = true;
#     flavor = "mocha";
#     accent = "pink";
#     size = "standard";
#     tweaks = [ "normal" ];
#     };
#   };

{
  nixpkgs = {
    config = {
      allowUnfree = true;
      
    };
  };
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "phil";
  home.homeDirectory = "/home/phil";

  targets.genericLinux.enable = true;

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
    gnome.gvfs
    nautilus
    gnome-disk-utility
    polkit
    polkit_gnome
    pika-backup
    dbus
    libsForQt5.kdeconnect-kde
    neovim
    delta
    multipath-tools
    arch-install-scripts
    gparted
    catppuccin
    nwg-look
    wofi
    duplicati
    tmux
    p7zip
    overskride
    wayvnc
    ollama
    open-webui
    # nvidia-container-toolkit
    nvidia-docker

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];




  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;
    ".zshrc" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/phil/.config/.zshrc";
    };

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
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
  #  /etc/profiles/per-user/phil/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nvim";
    GIO_EXTRA_MODULES = "${pkgs.gvfs}/lib/gio/modules";
    LC_ALL="en_GB.UTF-8";
  };
  
  # catppuccin.enable = true;
  catppuccin.enable = true;
  catppuccin.accent = "peach";
  catppuccin.flavor = "mocha";
  gtk.enable = true;
  catppuccin.gtk.enable = true;
  catppuccin.gtk.accent = "peach";
  catppuccin.gtk.flavor = "mocha";
  programs.zsh = {
    enable = true;
  };

systemd.user.services.ollama = {
  # [Unit] section
  Unit = {
    Description = "Ollama Service (User)";
    After = [ "default.target" ];
    # If you don't need to wait on default.target, you can remove the line above
  };

  # [Service] section
  Service = {
    Type = "simple";
    ExecStart = "OLLAMA_HOST=0.0.0.0 OLLAMA_LLM_LIBRARY=\"cuda_v11\" ${pkgs.ollama}/bin/ollama serve";
    Restart = "always";
    RestartSec = "5s";
  };

  # [Install] section
  Install = {
    WantedBy = [ "default.target" ];
  };
};

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
