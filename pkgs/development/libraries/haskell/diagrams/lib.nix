{ cabal, active, colour, dataDefaultClass, diagramsCore, dualTree
, filepath, fingertree, hashable, intervals, JuicyPixels, lens
, MemoTrie, monoidExtras, optparseApplicative, safe, semigroups
, tagged, vectorSpace, vectorSpacePoints
}:

cabal.mkDerivation (self: {
  pname = "diagrams-lib";
  version = "1.2.0.1";
  sha256 = "0p7rq97hnal90dciq1nln1s16kdb1xk9rrwaxhkxqr6kjjr2njf4";
  buildDepends = [
    active colour dataDefaultClass diagramsCore dualTree filepath
    fingertree hashable intervals JuicyPixels lens MemoTrie
    monoidExtras optparseApplicative safe semigroups tagged vectorSpace
    vectorSpacePoints
  ];
  jailbreak = true;
  meta = {
    homepage = "http://projects.haskell.org/diagrams";
    description = "Embedded domain-specific language for declarative graphics";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})
