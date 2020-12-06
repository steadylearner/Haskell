import Data.Time
import Data.Time.Calendar.WeekDate


main :: IO ()
main = do
    let i =2
    putStrLn $ "write " ++ show i ++ " as "
    case i of
        1 -> putStrLn "one."
        2 -> putStrLn "two."
        3 -> putStrLn "three."
        _ -> putStrLn "Something else."

    now <- getCurrentTime
    let (_, _, week) = toWeekDate . utctDay $ now
    
    putStrLn $
        case week of
            6 -> "It's the weekend."
            7 -> "It's the weekend."
            _ -> "It's a weekday."

    localtime <- utcToLocalZonedTime now
    let hour = todHour . localTimeOfDay . zonedTimeToLocalTime $ localtime
    case hour of
        _
            | hour < 12 -> putStrLn "it's before noon"
            | otherwise -> putStrLn "it's after noon"