module IBAN exposing
    ( fromString
    , toString
    )

{-| IBAN parser


## Parse

@docs fromString


## Format

@docs toString

-}

import IBAN.Country as Country
import IBAN.Types exposing (..)
import IBAN.Validate as Validate


{-| Creates an IBAN value from a string

Builds and validates an IBAN given a String.

The input string can contain random spaces and lower letters.

-}
fromString : String -> Result Error IBAN
fromString =
    sanitize
        >> build
        >> Result.andThen validate


sanitize : String -> String
sanitize =
    String.filter ((/=) ' ') >> String.toUpper


{-| Builds a transient IBAN value that is not validated yet
-}
build : String -> Result Error IBAN
build string =
    let
        country =
            string
                |> String.left 2
                |> Country.fromString

        checkCode =
            String.slice 2 4 string

        bban =
            String.dropLeft 4 string
    in
    country
        |> Result.map IBAN
        |> Result.map (apply checkCode)
        |> Result.map (apply bban)


apply : a -> (a -> b) -> b
apply value callback =
    callback value


{-| IBAN validation

Given a tansient IBAN validates it.

1.  check that all characters are alphanumeric
2.  the length is correct (per Country basis)
3.  perform the sanity check

-}
validate : IBAN -> Result Error IBAN
validate ((IBAN country _ _) as iban) =
    iban
        |> toString Electronic
        |> Validate.chars
        |> Result.andThen (Validate.length country)
        |> Result.andThen Validate.sanityCheck
        |> Result.map (always iban)


{-| Format an IBAN value

Formats back an IBAN value to its canonic forms.
there are 2 forms:

1.  `Textual` i.e. characters are grouped in groups of 4
2.  `Electronic` i.e. without spaces, and capital letters

-}
toString : Format -> IBAN -> String
toString t =
    case t of
        Textual ->
            toTextualString

        Electronic ->
            toElectronicString


toTextualString : IBAN -> String
toTextualString =
    toElectronicString >> groupByGroupsOf 4


toElectronicString : IBAN -> String
toElectronicString (IBAN country checkCode bban) =
    Country.toString country ++ checkCode ++ bban


partitionAll : Int -> List a -> List (List a)
partitionAll n coll =
    case coll of
        [] ->
            []

        _ ->
            List.take n coll :: partitionAll n (List.drop n coll)


groupByGroupsOf : Int -> String -> String
groupByGroupsOf n =
    String.toList
        >> partitionAll 4
        >> List.map String.fromList
        >> List.intersperse " "
        >> String.concat
