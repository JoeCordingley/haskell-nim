import Test.QuickCheck
import Data.Foldable

import Nim2

prop_revapp :: [Int] -> [Int] -> Bool
prop_revapp xs ys = reverse (xs++ys) == reverse ys ++ reverse xs

prop_nextPlayer :: Player -> Bool
prop_nextPlayer player = (nextPlayer . nextPlayer $ player) == player


main = quickCheck prop_revapp 
