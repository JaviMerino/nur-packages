{ fd-send-recv
, fetchFromGitHub
, lib
, ocaml-ng
, stdenv
, xapi-backtrace
}:

let
  # Putting these two together to remember that they have to be updated at the same time.
  version = "24.10.0";
  # Use the same as in https://github.com/xapi-project/xs-opam/blob/master/tools/xs-opam-ci.env
  ocamlPackages = ocaml-ng.ocamlPackages_4_14;
in
stdenv.mkDerivation {
  pname = "xen-api";
  inherit version;

  src = fetchFromGitHub {
    owner = "xapi-project";
    repo = "xen-api";
    rev = "v${version}";
    hash = "sha256-z4ciVgiBpZvqMxmuBMbNrwSpmWAGZlM3gF9wGwnlOGI=";
  };

  nativeBuildInputs = with ocamlPackages; [
    dune_3
    dune-build-info
    dune-configurator
    findlib
    ocaml
  ];
  propagatedBuildInputs = with ocamlPackages; [
    astring
    cmdliner
    fd-send-recv
    logs
    ptime
    uuidm
    xapi-backtrace
    # From the README, you need:
    # PACKAGES="xapi-cli-protocol xapi-client xapi-consts xapi-datamodel xapi-types xapi xe xen-api-sdk xen-api-client xen-api-client-lwt xen-api-client-async xapi-rrdd xapi-rrdd-plugin xapi-rrd-transport xapi-rrd-transport-utils rrd-transport rrdd-plugin rrdd-plugins rrddump gzip http-lib pciutil safe-resources sexpr stunnel uuid xapi-compression xml-light2 zstd vhd-tool xs-toolstack"
  ];

  # TODO
  #doCheck = true;
  #checkInputs = [];

  meta = with lib; {
    broken = true;
    homepage = "https://xenproject.org/developers/teams/xen-api/";
    description = "A toolstack for use with the Xen hypervisor";
    longDescription = ''
      A Xen Project Toolstack that exposes the XAPI interface.  An
      interface for remotely configuring and controlling virtualized
      guests running on a Xen-enabled host. XAPI is the core component
      of Citrix Hypervisor / XenServer and XCP-ng.
    '';
    license = licenses.lgpl21Only;
    maintainers = with lib.maintainers; [ javimerino ];
  };
}
