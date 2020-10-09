{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name = "parsing-ip"
, dependencies =
  [ "console"
  , "effect"
  , "parsing"
  , "parsing-hexadecimal"
  , "parsing-repetition"
  , "prelude"
  , "psci-support"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
