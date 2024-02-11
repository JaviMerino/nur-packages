{ fetchFromGitHub
, fetchzip
, lib
, python3Packages
  #, rpm
, python-requests-gssapi
, system
}:

python3Packages.buildPythonApplication rec {
  pname = "koji";
  version = "1.34.0";
  src = fetchzip {
    url = "https://pagure.io/koji/archive/koji-${version}/koji-koji-${version}.tar.gz";
    hash = "sha256-pUAfg/wS8Wxzj9Udhr/R+QEQvQSdRr8yGFqbDR7pfT0=";
  };
  propagatedBuildInputs = with python3Packages; [
    dateutil
    psycopg2
    requests
    python-requests-gssapi
    rpm
    six
  ];

  # TODO enable only the cli tests
  doCheck = false;

  meta = with lib; {
    description = "A flexible, secure, and reproducible way to build RPM-based software.";
    homepage = "https://pagure.io/koji/";
    maintainers = with maintainers; [ javimerino ];
    license = licenses.lgpl21Only;
    platforms = platforms.all;
  };
}
