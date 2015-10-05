module Paths_simple (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "C:\\Users\\thepr\\Dropbox\\School Work\\HW\\Algorithms\\HWA\\simple\\.stack-work\\install\\x86_64-windows\\lts-3.6\\7.10.2\\bin"
libdir     = "C:\\Users\\thepr\\Dropbox\\School Work\\HW\\Algorithms\\HWA\\simple\\.stack-work\\install\\x86_64-windows\\lts-3.6\\7.10.2\\lib\\x86_64-windows-ghc-7.10.2\\simple-0.1.0.0-F1QUneAtpBV7KvjCfhLiy8"
datadir    = "C:\\Users\\thepr\\Dropbox\\School Work\\HW\\Algorithms\\HWA\\simple\\.stack-work\\install\\x86_64-windows\\lts-3.6\\7.10.2\\share\\x86_64-windows-ghc-7.10.2\\simple-0.1.0.0"
libexecdir = "C:\\Users\\thepr\\Dropbox\\School Work\\HW\\Algorithms\\HWA\\simple\\.stack-work\\install\\x86_64-windows\\lts-3.6\\7.10.2\\libexec"
sysconfdir = "C:\\Users\\thepr\\Dropbox\\School Work\\HW\\Algorithms\\HWA\\simple\\.stack-work\\install\\x86_64-windows\\lts-3.6\\7.10.2\\etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "simple_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "simple_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "simple_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "simple_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "simple_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
