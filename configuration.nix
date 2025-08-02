{ config, pkgs, inputs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.home-manager
    ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";

    users.u200b = {
      home.stateVersion = "25.05";

      programs.fish = {
        enable = true;
        shellAbbrs = {
          ls = "eza --group-directories-first --color=auto";
          rebuild = "sudo nixos-rebuild switch --flake /etc/nixos#main";
          configure = "sudo nvim /etc/nixos/configuration.nix";
        };
        shellInit = ''
          set EDITOR ${pkgs.neovim}/bin/nvim
          set VISUAL ${pkgs.neovim}/bin/nvim
          set PAGER "${pkgs.less}/bin/less -R"

          fish_vi_key_bindings
          direnv hook fish | source
          zoxide init fish | source
        '';
        interactiveShellInit = ''
          startsway
        '';
        plugins = [];
      };

      xdg.configFile."fish/functions".source = ./terminal/fish/functions;
      xdg.configFile."fish/completions".source = ./terminal/fish/completions;
      xdg.configFile."fish/conf.d".source = ./terminal/fish/conf.d;
      xdg.configFile."fish/themes".source = ./terminal/fish/themes;
      xdg.configFile."fish/fish_plugins".source = ./terminal/fish/fish_plugins;
    };
  };  

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  networking.networkmanager.enable = true;
  time.timeZone = "Europe/Berlin";
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  users.users.u200b = {
    isNormalUser = true;
    description = "u200b";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.fish;
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    wget
    kitty
    fish
    zoxide
    git
    spotify
    direnv
    eza
    tldr
    wine
    neofetch
    jetbrains.idea-ultimate
    inputs.zen-browser.packages."${system}".default
    oh-my-fish
    (
      pkgs.writeTextFile {
        name = "startsway";
        destination = "/bin/startsway";
        executable = true;
        text = ''
          #! /usr/bin/env bash
          systemctl --user import-environment DISPLAY WAYLAND_DISPLAY PATH
          exec systemctl --user start sway.service
        '';
      }
    )
    (
      pkgs.writeTextFile {
        name = "configure-gtk";
        destination = "/bin/configure-gtk";
        executable = true;
        text = let
          schema = pkgs.gsettings-desktop-schemas;
          datadir = "${schema}/share/gsettings-schemas/${schema.name}";
        in ''
          export XDG_DATA_DIRS=${datadir}:$XDG_DATA_DIRS
          gnome_schema=org.gnome.desktop.interface
          gsettings set $gnome_schema gtk-theme 'Dracula'
        '';
      }
    )
    (
      lutris.override {
        extraPkgs = pkgs: [
          wine
          inputs.nix-gaming.packages.${pkgs.system}.wine-ge
	];
      }
    )
  ];
  
  environment = {
    etc = {
      "sway/config".source = import ./sway/sway.nix { inherit config; inherit pkgs; };
    };
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
  
  programs = {
    command-not-found.enable = true;
    neovim = {
      enable = true;
      defaultEditor = true;
    };
    fish.enable = true;
    sway = {
      enable = true;
      extraPackages = with pkgs; [ 
        bemenu
        kanshi # autorandr replacement
        kitty
        adwaita-icon-theme # icons for various applications
        i3status
        light
        mako
        rxvt-unicode
        swaylock
        swayidle
        wdisplays # arandr equivalent
        wl-clipboard
        xwayland
      ];
      wrapperFeatures.gtk = true;
    };
  };

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
  system.stateVersion = "25.05"; # Did you read the comment?
}
