{
  description = "VPN Gate client for NetworkManager";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      treefmt-nix,
    }:
    let
      mkPackage =
        pkgs:
        pkgs.stdenv.mkDerivation {
          pname = "nm-vpngate";
          version = "unstable-${self.shortRev or self.dirtyShortRev or "dirty"}";

          src = ./.;

          nativeBuildInputs = [ pkgs.makeWrapper ];

          buildInputs = [ pkgs.bash ];

          dontBuild = true;

          installPhase = ''
            runHook preInstall

            install -Dm755 nm-vpngate $out/bin/nm-vpngate
            install -Dm644 nm-vpngate.conf $out/share/nm-vpngate/nm-vpngate.conf

            wrapProgram $out/bin/nm-vpngate \
              --prefix PATH : ${
                pkgs.lib.makeBinPath [
                  pkgs.curl
                  pkgs.gnugrep
                  pkgs.gnused
                  pkgs.coreutils
                  pkgs.gawk
                  pkgs.networkmanager
                ]
              }

            runHook postInstall
          '';

          meta = with pkgs.lib; {
            description = "VPN Gate client for NetworkManager";
            homepage = "https://github.com/Hayao0819/nm-vpngate";
            license = licenses.wtfpl;
            platforms = platforms.linux;
            maintainers = [ ];
            mainProgram = "nm-vpngate";
          };
        };

      defaultPackageFor = pkgs: mkPackage pkgs;

      nixosModule = import ./nixos/module.nix { defaultPackage = defaultPackageFor; };
    in
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        nm-vpngate = mkPackage pkgs;
        treefmtEval = treefmt-nix.lib.evalModule pkgs ./treefmt.nix;
      in
      {
        packages = {
          default = nm-vpngate;
          nm-vpngate = nm-vpngate;
        };

        apps.default = {
          type = "app";
          program = "${nm-vpngate}/bin/nm-vpngate";
        };

        formatter = treefmtEval.config.build.wrapper;

        checks.formatting = treefmtEval.config.build.check self;

        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            bash
            shellcheck
            shfmt
            curl
            gnugrep
            gnused
            coreutils
            treefmtEval.config.build.wrapper
          ];
        };
      }
    )
    // {
      nixosModules.default = nixosModule;
      nixosModules.nm-vpngate = nixosModule;

      overlays.default = final: _prev: {
        nm-vpngate = mkPackage final;
      };
    };
}
