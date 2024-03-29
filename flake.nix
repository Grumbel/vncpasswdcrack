{
  description = "Deobfuscation tool for ~/.vnc/passwd";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in {
        packages = rec {
          default = vncpasswdcrack;

          vncpasswdcrack = pkgs.stdenv.mkDerivation {
            pname = "vncpasswdcrack";
            version = "0.1.0";

            src = nixpkgs.lib.cleanSource ./.;

            nativeBuildInputs = with pkgs; [
              cmake
            ];
           };
        };
      }
    );
}
