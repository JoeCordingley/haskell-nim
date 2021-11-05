import Data.Foldable
import Nim2
import Control.Monad.Writer.Lazy
import Data.List
import Test.Tasty.QuickCheck
import Test.Tasty

<<<<<<< HEAD
import Nim2

prop_revapp :: [Int] -> [Int] -> Bool
prop_revapp xs ys = reverse (xs++ys) == reverse ys ++ reverse xs

prop_nextPlayer :: Player -> Bool
prop_nextPlayer player = (nextPlayer . nextPlayer $ player) == player

=======
prop_turn_sequence = testProperty "player sequence goes 1,2,1,2..." $ forAll playerSequences alternatesFromOne where
  playerSequences = execWriterT (nim getMoveRecordPlayer)
  alternatesFromOne sequence = sequence `isPrefixOf` expectedSequence
  expectedSequence = cycle [PlayerOne, PlayerTwo]

prop_moves_total_12 = testProperty "12 stones taken in total" $ forAll moveSequences movesTotal12 where
  moveSequences = execWriterT (nim getMoveRecordMove)
  movesTotal12 moves = sum moves == 12

prop_last_player_wins = testProperty "last player to play is the winner" $ forAll playerSequencesAndWinners lastPlayerWins where
  playerSequencesAndWinners = runWriterT (nim getMoveRecordPlayer)
  lastPlayerWins (Winner winningPlayer, playerSequence) = last playerSequence == winningPlayer

getMoveGen :: Int -> Gen Int
getMoveGen stonesLeft = choose (1, 3 `min` stonesLeft)

getMoveRecordPlayer :: Player -> Int -> WriterT [Player] Gen Int
getMoveRecordPlayer player stonesLeft = tell [player] *> lift (getMoveGen stonesLeft)

getMoveRecordMove :: Player -> Int -> WriterT [Int] Gen Int
getMoveRecordMove player stonesLeft = do
  move <- lift (getMoveGen stonesLeft)
  tell [move]
  return move

main = defaultMain $ testGroup "nim tests" [prop_turn_sequence, prop_moves_total_12, prop_last_player_wins]
>>>>>>> d69197daa2fc40e97d81e4eac587fa70473a41f9

main = quickCheck prop_revapp 
