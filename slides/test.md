% Nim, or final tagless and property testing by example
% Joe Cordingley
% March 22, 2005

# Preview

- Nim

::: notes

We're going to learn a very simple game, and try to make a very simple
implementation of it in scala and haskell (follow whichever you prefer)

:::

- How final tagless can help us

::: notes

We're going to learn how final tagless can help us make code more testable
and more composable and reusable.

:::

- How property testing can be useful

::: notes

We're going to learn property testing techniques using final tagless to make our
tests easier to write and test more cases.

:::



# Nim

## Rules to **Single pile Nim** or **The Subtraction Game**

- At the start of the game there are 12 stones
- The aim of the game is to take the last stone
- Two players take turns to make their move
- Each move, a player may take 1, 2, or 3 marbles

# Players

-----------------------------------------------------------------------------------
scala                                          haskell
---------------------------------------------- ------------------------------------
`sealed trait Player` \                        `data Player` \
`case object PlayerOne extends Player` \       `  = Player One` \
`case object PlayerTwo extends Player` \       `  | Player Two` \
                                              
`def nextPlayer: Player => Player = {` \       `nextPlayer :: Player -> Player` \
`  case PlayerOne => PlayerTwo` \              `nextPlayer PlayerOne = PlayerTwo` \
`  case PlayerTwo => PlayerOne` \              `nextPlayer PlayerTwo = PlayerOne` \
`}` \

`implicit val showPlayer: Show[Player] = {` \  `instance Show Player where` \
`  case PlayerOne => "Player One"` \           `  show PlayerOne = "Player One"` \
`  case PlayerTwo => "Player One"` \           `  show PlayerTwo = "Player Two"` \
`}` \
-----------------------------------------------------------------------------------

# Players

+-----------------------------------------------+------------------------------------+
|scala                                          | haskell                            |
+-----------------------------------------------+------------------------------------+
|`sealed trait Player  \                        |`data Player` \                     |
| case object PlayerOne extends Player  \       |`  = Player One` \                  |
| case object PlayerTwo extends Player`         |`  | Player Two` \                  |
+-----------------------------------------------+------------------------------------+
|`def nextPlayer: Player => Player = {` \       |`nextPlayer :: Player -> Player` \  |
|`  case PlayerOne => PlayerTwo` \              |`nextPlayer PlayerOne = PlayerTwo` \|
|`  case PlayerTwo => PlayerOne` \              |`nextPlayer PlayerTwo = PlayerOne` \|
|`}` \                                          |                                    |
+-----------------------------------------------+------------------------------------+
|`implicit val showPlayer: Show[Player] = {` \  |`instance Show Player where` \      |
|`  case PlayerOne => "Player One"` \           |`  show PlayerOne = "Player One"` \ |
|`  case PlayerTwo => "Player One"` \           |`  show PlayerTwo = "Player Two"` \ |
|`}` \                                          |                                    |
+-----------------------------------------------+------------------------------------+

~~~
Hi.

<table width="100%">
<tr><th>Scala</th><th>Haskell</th></tr>
<tr>
<td width="50%">

~~~scala
scala code here
~~~

</td>
<td width="50%">

~~~haskell
haskell code here
~~~

</td>
</tr>
</table>

... and so on for next pair of side-by-side code blocks.
~~~
