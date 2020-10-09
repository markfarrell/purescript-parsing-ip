module Text.Parsing.IP
  ( Octet
  , Address
  , ipv4
  ) where

import Prelude

import Text.Parsing.Parser (ParserT)
import Text.Parsing.Parser.String as S

import Text.Parsing.Char.Hexadecimal as H
import Text.Parsing.String.Repetition as R

newtype Octet = Octet String

data Address = IPv4 Octet Octet Octet Octet

octet :: forall a m. S.StringLike a => Monad m => ParserT a m Octet
octet = Octet <$> R.exact 3 H.decimal

ipv4 :: forall a m. S.StringLike a => Monad m => ParserT a m Address
ipv4 = do
  w <- octet
  _ <- dot
  x <- octet
  _ <- dot
  y <- octet
  _ <- dot
  z <- octet
  pure $ IPv4 w x y z
  where dot = S.char '.'
