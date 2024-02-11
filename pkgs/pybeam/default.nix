{ lib
, fetchPypi
, python3Packages
}:

python3Packages.buildPythonPackage rec {
  pname = "pybeam";
  version = "0.7";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-zHqcRLK1f73NeR2XXas2nfPjMzAR5qxosM506g/cmL8=";
  };

  propagatedBuildInputs = with python3Packages; [
    construct
    six
    sphinx
  ];

  meta = with lib; {
    description = "Python module to parse Erlang BEAM files";
    homepage = "https://github.com/matwey/pybeam";
    maintainers = with maintainers; [ javimerino ];
    license = [ licenses.mit ];
    platforms = platforms.all;
  };
}
