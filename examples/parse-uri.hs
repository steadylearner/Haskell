-- Install $stack install network-uri

-- List $stack exec ghc - pkg -- list
-- Then, delete manually.
-- rm -rf package.cache package.cache
import Network.URI

main = do
  let target = "postgres://user:pass@host.com:5432/path?k=v#f"
  case parseURI target of
    Nothing -> error "no URI"
    Just uri -> do
      putStrLn $ uriScheme uri
      
      case uriAuthority uri of
        Nothing -> error "no Authority"
        Just auth -> do
          putStrLn $ uriUserInfo auth
          putStrLn $ uriRegName auth
          putStrLn $ uriPort auth

      putStrLn $ uriPath uri
      putStrLn $ uriQuery uri
      putStrLn $ uriFragment uri