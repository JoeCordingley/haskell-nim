module Nim2
  ( nim
  , Player
  , nextPlayer
  ) where

initialStones = 12

data Player
  = PlayerOne
  | PlayerTwo
  deriving Eq
  

nextPlayer :: Player -> Player
nextPlayer PlayerOne = PlayerTwo
nextPlayer PlayerTwo = PlayerOne

instance Show Player where
  show PlayerOne = "Player One"
  show PlayerTwo = "Player Two"

nim :: IO ()
nim = play initialStones PlayerOne
  where
    play stones player = do
      announceStonesLeft stones
      move <- getMove player
      let stonesLeft = stones - move
      if stonesLeft == 0
        then announceWinner player
        else play stonesLeft (nextPlayer player)

announceStonesLeft :: Int -> IO ()
announceStonesLeft stones = putStrLn ("Stones left " ++ show stones)

getMove :: Player -> IO Int
getMove player = do
  putStrLn (show player ++ ", what is your move?")
  fmap read getLine


announceWinner :: Player -> IO ()
announceWinner player = putStrLn (show player ++ " wins!")
