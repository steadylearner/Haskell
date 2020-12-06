vals :: () -> (Int, Int)
vals () = (1, 2)

main = do
    let (one, two) = vals ()
    print one
    print two

