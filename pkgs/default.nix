{ pkgs }:
pkgs.lib.makeScope pkgs.newScope (self:
let
  callPackage = self.callPackage;
in
{
  ack-results-parser = callPackage ./ack-results-parser { };
  pybeam = callPackage ./pybeam { fetchPypi = pkgs.python3Packages.fetchPypi; };
  python-hwinfo = callPackage ./python-hwinfo { };
  rpmlint = callPackage ./rpmlint { };
})
