{ fetchFromGitHub
, lib
, ocaml-ng
}:

let
  # Using the same as xen-api
  ocamlPackages = ocaml-ng.ocamlPackages_4_14;
in
ocamlPackages.buildDunePackage rec {
  pname = "fd-send-recv";
  version = "2.0.2";

  src = fetchFromGitHub {
    owner = "xapi-project";
    repo = "ocaml-fd-send-recv";
    rev = "v${version}";
    hash = "sha256-gcChczm5uYLIgAiEOM23VdGbhyieu6CQ19B1lmwMajQ=";
  };

  patches = [
    ./0001-fd_send_recv_stubs-fix-build-with-ocaml-earlier-than.patch
  ];
  doCheck = true;

  meta = with lib; {
    homepage = "https://github.com/xapi-project/ocaml-fd-send-recv";
    description = "Bindings which allow Unix.file_descrs to be sent and received over Unix domain sockets";
    license = licenses.lgpl21Only;
    maintainers = with lib.maintainers; [ javimerino ];
  };
}
