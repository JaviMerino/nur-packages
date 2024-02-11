{ pkgs }:
pkgs.lib.makeScope pkgs.newScope (self:
let
  callPackage = self.callPackage;
in
{
  ack-results-parser = callPackage ./ack-results-parser { };
  python-hwinfo = callPackage ./python-hwinfo { };
})
