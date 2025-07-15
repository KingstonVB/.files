{ config, pkgs, ... }:

let

in
{
	imports = [
		./hardware-configuration.nix
	];

	nix.settings.experimental-features = [ "nix-command" "flakes" ];
	nix.settings.download-buffer-size = 52428800;

	# Boot Loader
	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

	# Lates Kernel
	boot.kernelPackages = pkgs.linuxPackages_latest;

	# Networking
	networking.hostName = "nixos";
	networking.networkmanager.enable = true;

	# Time Zone
	time.timeZone = "America/New_York";

	# Locales
	i18n.defaultLocale = "en_US.UTF-8";
	i18n.extraLocaleSettings = {
		LC_ADDRESS = "en_US.UTF-8";
		LC_IDENTIFICATION = "en_US.UTF-8";
		LC_MEASUREMENT = "en_US.UTF-8";
		LC_MONETARY = "en_US.UTF-8";
		LC_NAME = "en_US.UTF-8";
		LC_NUMERIC = "en_US.UTF-8";
		LC_PAPER = "en_US.UTF-8";
		LC_TELEPHONE  = "en_US.UTF-8";
		LC_TIME = "en_US.UTF-8";
	};

	# Users
	users.users.poppy = {
		isNormalUser = true;
		extraGroups = [ "networkmanager" "wheel" ];
	};

	# Allow non-free packages
	nixpkgs.config.allowUnfree = true;

	# System Packages
	environment.systemPackages = with pkgs; [
		neovim
		git
		ghostty
		zsh
		zsh-completions
		zsh-autosuggestions
		zsh-autocomplete
	];

	# Services to be enabled
	services.openssh.enable = true;

	# Don't Change
	system.stateVersion = "25.05";
}
