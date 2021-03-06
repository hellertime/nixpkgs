{ cabal, freeglut, libICE, libSM, libXi, libXmu, mesa, OpenGL
, OpenGLRaw
}:

cabal.mkDerivation (self: {
  pname = "GLUT";
  version = "2.5.1.1";
  sha256 = "0n9dkdjmpnbcjg0ll0ny7mw21xwwix0gxy0hq6yagmgaakhpg0aa";
  buildDepends = [ OpenGL OpenGLRaw ];
  extraLibraries = [ freeglut libICE libSM libXi libXmu mesa ];
  meta = {
    homepage = "http://www.haskell.org/haskellwiki/Opengl";
    description = "A binding for the OpenGL Utility Toolkit";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
    maintainers = [ self.stdenv.lib.maintainers.andres ];
  };
})
