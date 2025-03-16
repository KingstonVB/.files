# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      /etc/nixos/hardware-configuration.nix
    ];

  nix = {
  	package = pkgs.nixVersions.stable;
	extraOptions = ''
		experimental-features = nix-command flakes
	'';
  };

  # Bootloader.
  boot = {
  	tmp.cleanOnBoot = true;
	loader = {
		efi.canTouchEfiVariables = true;
		grub = {
			device = "nodev";
			efiSupport = true;
			enable = true;
			useOSProber = true;
			timeoutStyle = "menu";
		};
		timeout = 300;
	};
  };

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.poppy = {
    isNormalUser = true;
    description = "poppy";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  	neovim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
	zed-editor
	ghostty
	fastfetch
	libsecret
	polkit
	hyprpolkitagent
	corefonts
	google-fonts
	nerdfonts
	jetbrains-mono
	btop
	rofi-wayland
	rofi-emoji
	rofi-calc
	wl-clipboard

	(builtins.getFlake "github:youwen5/zen-browser-flake").packages.${builtins.currentSystem}.default
  ];

  programs.hyprland.enable = true;

  programs.git = {
  	enable = true;
	config = {
		credential.helper = "store";
	};
  };

  security.rtkit.enable = true;
  services.pipewire = {
  	enable = true;
	pulse.enable = true;
	alsa.enable = true;
	alsa.support32Bit = true;
	jack.enable = true;
	wireplumber.enable = true;
  };

  hardware.nvidia = {
	modesetting.enable = true;
	open = false;
  };
  services.xserver.videoDrivers = ["nvidia"];
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
  system.stateVersion = "24.11"; # Did you read the comment?

}
