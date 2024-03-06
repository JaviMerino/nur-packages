{ fetchFromGitHub
, lib
, ocaml-ng
}:

let
  # Using the same as xen-api
  ocamlPackages = ocaml-ng.ocamlPackages_4_14;
in
ocamlPackages.buildDunePackage rec {
  pname = "xapi-backtrace";
  version = "0.7";

  src = fetchFromGitHub {
    owner = "xapi-project";
    repo = "backtrace";
    rev = "v${version}";
    hash = "sha256-r6PLMQOb/134LYMxCuFepdVOczhrjt1qYPzkDZMzs8c=";
  };

  nativeBuildInputs = with ocamlPackages; [
    dune_3
    ocaml
  ];

  propagatedBuildInputs = with ocamlPackages; [
    ppx_deriving_rpc
    ppx_sexp_conv
    rpclib
    yojson
  ];

  meta = with lib; {
    homepage = "https://xapi-project.github.io/backtrace/";
    description = "Helper functions to preserve and transport exception backtraces";
    license = licenses.lgpl21Only;
    maintainers = with lib.maintainers; [ javimerino ];
  };
}
