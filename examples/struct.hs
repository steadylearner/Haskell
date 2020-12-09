data Person = Person {
    name :: String,
    age :: Int
} deriving Show

main :: IO ()
main = do
    print $ Person "Bob" 1
    print $ Person {name = "Jane", age = 2}
    
    let someone = Person "Somone" 10
    let ageOnly = age someone
    print ageOnly