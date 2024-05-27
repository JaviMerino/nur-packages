# My personal [NUR](https://github.com/nix-community/NUR) repository

![Build and populate cache](https://github.com/JaviMerino/nur-packages/workflows/Build%20and%20populate%20cache/badge.svg)
![Lints](https://github.com/JaviMerino/nur-packages/workflows/Lints/badge.svg)
![Check
flake](https://github.com/JaviMerino/nur-packages/workflows/Check%20flake/badge.svg)

<!--
Uncomment this if you set up cachix:
[![Cachix Cache](https://img.shields.io/badge/cachix-<YOUR_CACHIX_CACHE_NAME>-blue.svg)](https://<YOUR_CACHIX_CACHE_NAME>.cachix.org)
-->

## Packages

Check [NUR search](https://nur.nix-community.org/repos/javimerino/)
for the available packages.

## Modules

Use these modules like you would any other home-manager module from NUR.  Set
nur-no-pkgs as [the NUR README
describes](https://github.com/nix-community/NUR?tab=readme-ov-file#using-modules-overlays-or-library-functions-in-nixos),
then add the module to your home-manager imports.  For example, for
ollama:

``` nix
  imports = [
    nur-no-pkgs.repos.javimerino.modules.ollama

    [...]
  ];
```

### ollama

systemd service as a home-manager module.

Example configuration:

``` nix
{pkgs, ... }:
{
  home.packages = [ pkgs.ollama ];

  services.ollama.enable = true;
}
```

After activating it with `home-manager switch`, don't forget to start
the service: `systemctl --user start ollama`.  Afterwards, any
`ollama` command will find the server running (eg. `ollama run
llama3`).

### say-tts

Add speech modules as data files for
[say](https://github.com/JaviMerino/say-tts).  An example
configuration:

``` nix
{pkgs, ... }:
{
  programs.say-tts = {
    enable = true;
    models = {
      "en_GB-alan-medium.onnx" = pkgs.fetchurl {
        url = "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_GB/alan/medium/en_GB-alan-medium.onnx";
        hash = "sha256-CjCWaJMiBedigB8e/Cc2zUsBIDKWIq32K+CeVjOdMzA=";
      };
      "en_GB-alan-medium.onnx.json" = pkgs.fetchurl {
        url = "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_GB/alan/medium/en_GB-alan-medium.onnx.json";
        hash = "sha256-wPDRJOWJXADnwDs13MgofzGaaZijZbGC3rXI51LujB4=";
      };
      "es_ES-sharvard-medium.onnx" = pkgs.fetchurl {
        url = "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/es/es_ES/sharvard/medium/es_ES-sharvard-medium.onnx";
        hash = "sha256-QP6/sWecaaRQX/MR3BNuEh40GaE6KQ7yZP30Pd7dD7E=";
      };
      "es_ES-sharvard-medium.onnx.json" = pkgs.fetchurl {
        url = "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/es/es_ES/sharvard/medium/es_ES-sharvard-medium.onnx.json";
        hash = "sha256-dDjJtpnHKwwziNrhto0/Nk3GaiFQ/lVKHBHwM3KVeyw=";
      };
    };
  };
}
```

You can get the URLs for the speech models from [the `VOICES.md` in piper
documentation](
https://github.com/rhasspy/piper/blob/master/VOICES.md).
