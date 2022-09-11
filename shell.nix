{ pkgs ? import <nixos> {}}:

let
  # Python 3.8 environment with all of the packages I require
  pythonEnv = pkgs.python39.withPackages (ps: [
    # Scientific python essentials
    ps.numpy
    ps.scipy
    ps.pandas
    ps.matplotlib

    ps.mdutils

    # Grab samples from the net via Python
    #ps.requests
    #ps.beautifulsoup4

    # Need this to make the samples more bearable
    #ps.nltk

    # Notebook editing
    ps.jupyter
    ps.ipython
  ]);
in
pkgs.mkShell {
  packages = [
    pythonEnv        # The Python 3.8 environment I made.

    # Useful tools to grab samples from the net quickly
    #pkgs.wget
    #pkgs.curl
    #pkgs.httpie      # I'm not good at `curl'. This might help me.
    # Download audio/video samples from the net
    #pkgs.youtube-dl
    #pkgs.ffmpeg
  ];
}