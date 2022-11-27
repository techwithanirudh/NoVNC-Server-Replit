{ pkgs }: {
    deps = [
      pkgs.unzip
      pkgs.zip
      pkgs.bashInteractive
      pkgs.openbox
      pkgs.xterm
      pkgs.xorg.xcalc
      pkgs.xorg.xclock
      pkgs.xorg.xeyes
      pkgs.dbus
      pkgs.python3
      pkgs.proot
      pkgs.htop
      pkgs.fluxbox
    ];
  env = {
    DBUS_PATH = "${pkgs.dbus}";
  };
}
