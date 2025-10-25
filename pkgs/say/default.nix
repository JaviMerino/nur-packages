{ lib
, fetchFromGitHub
, piper-tts
, sox
, writeShellApplication
}:


let
  say_repo = fetchFromGitHub {
    owner = "JaviMerino";
    repo = "say-tts";
    rev = "71ab9aafc721c813459f2e93660c6485aa60c921";
    hash = "sha256-bjO+SW3HWEzis8iB74ogkaWI1+qfa/OtfobTKaD1xhQ=";
  };
  say_text = builtins.readFile "${say_repo}/say";
in
writeShellApplication {
  name = "say";

  text = say_text;
  runtimeInputs = [
    piper-tts
    sox
  ];

  meta = with lib; {
    broken = true;
    description = "Simple CLI for converting text to speech using piper-tts";
    homepage = "https://github.com/JaviMerino/say-tts";
    maintainers = with maintainers; [ javimerino ];
    license = licenses.mit;
  };
}
