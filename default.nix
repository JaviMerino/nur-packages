{ pkgs }:

{
  # The `lib`, `modules`, and `overlays` names are special
  #lib = import ./lib { inherit pkgs; }; # functions
  modules = import ./modules; # NixOS modules
  #overlays = import ./overlays; # nixpkgs overlays

  example-package = pkgs.callPackage ./pkgs/example-package { };
}
