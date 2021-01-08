import Test.QuickCheck
import Data.Foldable

prop_revapp :: [Int] -> [Int] -> Bool
prop_revapp xs ys = reverse (xs++ys) == reverse ys ++ reverse xs

props = [prop_revapp]

main = traverse_ quickCheck props

