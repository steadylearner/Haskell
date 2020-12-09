class Geometry g where
    area :: g -> Double
    perim:: g -> Double

data Square = Square Double Double deriving Show
newtype Circle = Circle Double deriving Show -- It has only a filed so use newtype.

instance Geometry Square where
    area (Square w h) = w * h
    perim (Square w h) = 2 * (w + h)

instance Geometry Circle where
    area (Circle r) = pi * r * r
    perim (Circle r) = 2 * pi * r

measure :: (Geometry a, Show a) => a -> IO ()
measure g = do
    print g
    print $ area g
    print $ perim g

main :: IO ()
main = do
    let s = Square 10 11
    let c = Circle 10

    measure s
    measure c