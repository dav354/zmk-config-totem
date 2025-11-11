{
  description = "Development environment for zmk";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {
        inherit system;
        config = {allowUnfree = true;};
      };
      python = pkgs.python312;
    in {
      devShells.default = pkgs.mkShell {
        packages = with pkgs; [
          python
          keymap-drawer
        ];
      };
    });
}
