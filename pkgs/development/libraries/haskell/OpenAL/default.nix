{ cabal, openal, OpenGL }:

cabal.mkDerivation (self: {
  pname = "OpenAL";
  version = "1.6.0.0";
  sha256 = "0bw20ykn8vi3g4im4nsrfz7p1qq9qwnx8da83zwdbr3wjm9934gd";
  buildDepends = [ OpenGL ];
  extraLibraries = [ openal ];
  meta = {
    homepage = "https://github.com/haskell-openal/ALUT";
    description = "A binding to the OpenAL cross-platform 3D audio API";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
    maintainers = [ self.stdenv.lib.maintainers.andres ];
  };
})
