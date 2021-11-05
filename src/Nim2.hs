module Nim2
  ( nim
<<<<<<< HEAD
  , Player
  , nextPlayer
=======
  , Player(..)
  , Winner(..)
  , nimMain
>>>>>>> d69197daa2fc40e97d81e4eac587fa70473a41f9
  ) where

initialStones = 12

data Player
  = PlayerOne
  | PlayerTwo
  deriving Eq
<<<<<<< HEAD
  
=======
>>>>>>> d69197daa2fc40e97d81e4eac587fa70473a41f9

nextPlayer :: Player -> Player
nextPlayer PlayerOne = PlayerTwo
nextPlayer PlayerTwo = PlayerOne

instance Show Player where
  show PlayerOne = "Player One"
  show PlayerTwo = "Player Two"

data Winner = Winner Player deriving Show

type StonesLeft = Int
type Move = Int
type GetMove f = Player -> StonesLeft -> f Move

nim :: Monad f => GetMove f -> f Winner
nim getMove = play initialStones PlayerOne
  where
    play stones player = do
      move <- getMove player stones
      let stonesLeft = stones - move
      if stonesLeft == 0
        then pure $ Winner player
        else play stonesLeft (nextPlayer player)

nimMain :: IO ()
nimMain = nim getMoveIO >>= announceWinner

announceStonesLeft :: Int -> IO ()
announceStonesLeft stones = putStrLn ("Stones left " ++ show stones)

getMove :: Player -> IO Int
getMove player = do
  putStrLn (show player ++ ", what is your move?")
  fmap read getLine

announceWinner :: Winner -> IO ()
announceWinner (Winner player) = putStrLn (show player ++ " wins!")

getMoveIO :: GetMove IO
getMoveIO player stonesLeft = announceStonesLeft stonesLeft *> getMove player

