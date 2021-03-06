{ cabal, ansiTerminal, options, patience, random, text
, transformers
}:

cabal.mkDerivation (self: {
  pname = "chell";
  version = "0.4";
  sha256 = "1hynr7n7wxgc3z6zrc3xrfpiqlh4zfb3kagwwfhqmcamv9d4x0ng";
  buildDepends = [
    ansiTerminal options patience random text transformers
  ];
  meta = {
    homepage = "https://john-millikin.com/software/chell/";
    description = "A simple and intuitive library for automated testing";
    license = self.stdenv.lib.licenses.mit;
    platforms = self.ghc.meta.platforms;
  };
})
