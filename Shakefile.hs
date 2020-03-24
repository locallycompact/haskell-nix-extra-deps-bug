{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}

module Main where

import           Development.Shake
import           Development.Shake.Classes
import           Development.Shake.Forward
import           Development.Shake.FilePath
import           RIO
import qualified RIO.Text as T


---Config-----------------------------------------------------------------------

outputFolder = "public"

buildAnimation :: FilePath -> Action ()
buildAnimation srcPath = do
  cacheAction ("build" :: T.Text, srcPath) $ do
    command_ [] "runhaskell" [srcPath, "render", "--format", "mp4", "--raster", "convert"]
    copyFileChanged (srcPath -<.> "mp4") (outputFolder </> (dropDirectory1 $ srcPath -<.> "mp4"))


buildRules :: Action ()
buildRules = do
  buildAnimation "site/animations/doc_drawBox.hs"

main :: IO ()
main = do
  let shOpts = forwardOptions $ shakeOptions { shakeVerbosity = Chatty, shakeLintInside = ["\\"]}
  shakeArgsForward shOpts buildRules
