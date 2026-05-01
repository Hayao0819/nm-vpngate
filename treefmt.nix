{ lib, ... }:
{
  projectRootFile = "flake.nix";

  programs.nixfmt = {
    enable = true;
  };

  programs.shfmt = {
    enable = true;
    indent_size = 4;
  };

  settings.formatter.shfmt.options = lib.mkForce [
    "-i"
    "4"
    "-w"
  ];

  settings.formatter.shfmt.includes = [
    "nm-vpngate"
    "*.sh"
    "*.bash"
  ];

  settings.global.excludes = [
    "flake.lock"
    "nm-vpngate.conf"
  ];
}
