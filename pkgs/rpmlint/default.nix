{ lib
, binutils
, bzip2
, cpio
, fetchFromGitHub
, gzip
, rpm
, pybeam
, python3Packages
, xz
, zstd
}:

python3Packages.buildPythonApplication rec {
  pname = "rpmlint";
  version = "2.5.0";
  format = "pyproject";

  src = fetchFromGitHub {
    owner = "rpm-software-management";
    repo = "rpmlint";
    rev = version;
    sha256 = "sha256-OaEwKLCg++4RRcgPvHCGH2RdvJ901aLIjmI+Z/KBysQ=";
  };

  nativeBuildInputs = [
    python3Packages.setuptools
  ];
  propagatedBuildInputs = [
    binutils
    rpm
    cpio
    gzip
    bzip2
    xz
    zstd
  ] ++ (with python3Packages; [
    pybeam
    pyenchant
    python-magic
    pyxdg
    rpm
    tomli
    tomli-w
    zstandard
  ]);

  meta = with lib; {
    description = "Tool for checking common errors in rpm packages";
    homepage = "https://github.com/rpm-software-management/rpmlint";
    maintainers = with maintainers; [ javimerino ];
    license = [ licenses.gpl2 ];
    platforms = platforms.all;
  };
}
