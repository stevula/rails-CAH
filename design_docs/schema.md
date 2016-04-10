# SCHEMA
## Game
Fields: Win Threshold (int)
Has many: Players, Decks
Has a: Draw Pile, Discard Pile

## Player
Fields: Name (str), Number (int), Points (int)
Has many: Cards

## Category
Fields: Name (str)
Has many: Decks

## Deck
Fields: Name (str), Series (str), Official (bool), Description (text)
Has many: Cards
Belongs to: Category

## Pile (Draw/Discard)
Fields: Type (str)
Has many: Cards
Belongs to: Game

## Card
Fields: Text (text), Black (bool), Slots (int)
Belongs to: Deck, Player
