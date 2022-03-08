{ config, pkgs, ... }:
  # Para los valores...
with pkgs;
let
  powerlevel10k = pkgs.fetchFromGitHub {
    owner = "romkatv";
    repo = "powerlevel10k";
    rev = "b7d90c84671183797bdec17035fc2d36b5d12292";
    sha256 = "0nzvshv3g559mqrlf4906c9iw4jw8j83dxjax275b2wi8ix0wgmj";
  };
in
{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "polo";
  home.homeDirectory = "/home/polo";
  
  # Importar modulos extra :^
  imports = [ ./polybar.nix ];

  # Paquetes para mi home usuario polito owo
  
  nixpkgs.config.allowUnfree = true;
  home.packages = [
      pkgs.gotop
      pkgs.fortune  
      pkgs.pfetch
      pkgs.uwufetch
      pkgs.picom
      pkgs.python310
      pkgs.python310Packages.pysdl2
      pkgs.python310Packages.wxPython_4_1
      pkgs.heroku
      pkgs.tdesktop
      pkgs.tor-browser-bundle-bin
      pkgs.nmap
      pkgs.gnome.nautilus-python
      pkgs.gnome.sushi
      pkgs.eww
      pkgs.neovim-unwrapped
      pkgs.nodejs
      pkgs.calcurse
      pkgs.lsd
      pkgs.bat
      pkgs.du-dust
    ];
 
  # Configuración para los paquetes y algunos servicios facha owo

  programs.zsh = {
    enable = true;
    plugins = [{
      name = "powerlevel10k";
      src = powerlevel10k;
    }];
  };

  services.picom = {
      enable = true;
      backend = "xrender";
      vSync = true;
      shadow = true;
      inactiveOpacity = "0.90";
      activeOpacity = "0.99";
      menuOpacity = "0.90";
      experimentalBackends = true;
      fade = true;
      # blur = true;   
  };        

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
