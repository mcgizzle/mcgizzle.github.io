{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_web (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/seanmcgroarty/code/mcgizzle.github.io/.stack-work/install/x86_64-osx/9b9c1516d6083ef11ca6bf7557f68d54cba88b21ee2ba16987b51be1861f1843/8.6.5/bin"
libdir     = "/Users/seanmcgroarty/code/mcgizzle.github.io/.stack-work/install/x86_64-osx/9b9c1516d6083ef11ca6bf7557f68d54cba88b21ee2ba16987b51be1861f1843/8.6.5/lib/x86_64-osx-ghc-8.6.5/web-0.1.0.0-AAEeiuwcAQgA6xIPCYh4Kw-build-site"
dynlibdir  = "/Users/seanmcgroarty/code/mcgizzle.github.io/.stack-work/install/x86_64-osx/9b9c1516d6083ef11ca6bf7557f68d54cba88b21ee2ba16987b51be1861f1843/8.6.5/lib/x86_64-osx-ghc-8.6.5"
datadir    = "/Users/seanmcgroarty/code/mcgizzle.github.io/.stack-work/install/x86_64-osx/9b9c1516d6083ef11ca6bf7557f68d54cba88b21ee2ba16987b51be1861f1843/8.6.5/share/x86_64-osx-ghc-8.6.5/web-0.1.0.0"
libexecdir = "/Users/seanmcgroarty/code/mcgizzle.github.io/.stack-work/install/x86_64-osx/9b9c1516d6083ef11ca6bf7557f68d54cba88b21ee2ba16987b51be1861f1843/8.6.5/libexec/x86_64-osx-ghc-8.6.5/web-0.1.0.0"
sysconfdir = "/Users/seanmcgroarty/code/mcgizzle.github.io/.stack-work/install/x86_64-osx/9b9c1516d6083ef11ca6bf7557f68d54cba88b21ee2ba16987b51be1861f1843/8.6.5/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "web_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "web_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "web_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "web_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "web_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "web_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
