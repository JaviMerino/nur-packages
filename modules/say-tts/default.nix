{ config, lib, pkgs, ... }:

let cfg = config.programs.say-tts;
in {
  options.programs.say-tts = {
    enable = lib.mkEnableOption "say-tts";
    package = lib.mkPackageOption pkgs "say" { };
    models = lib.mkOption {
      type = lib.types.anything;
      default = { };
      example = {
        "en_GB-alan-medium.onnx" = pkgs.fetchurl {
          url = "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_GB/alan/medium/en_GB-alan-medium.onnx";
          hash = "sha256-CjCWaJMiBedigB8e/Cc2zUsBIDKWIq32K+CeVjOdMzA=";
        };
        "en_GB-alan-medium.onnx.json" = pkgs.fetchurl {
          url = "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_GB/alan/medium/en_GB-alan-medium.onnx.json?download=true.json";
          hash = "sha256-wPDRJOWJXADnwDs13MgofzGaaZijZbGC3rXI51LujB4=";
        };
      };
      description = "Speech modules to get";
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      cfg.package
    ];
    xdg.dataFile = lib.attrsets.mapAttrs'
      (name: value: lib.attrsets.nameValuePair ("say-tts/" + name) { source = value; })
      cfg.models;
  };
}
