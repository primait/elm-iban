module Errors exposing (suite)

import Expect exposing (Expectation)
import IBAN
import IBAN.Types exposing (..)
import Test exposing (..)


suite : Test
suite =
    describe "Test iban"
        [ test "IBAN is correct" <|
            \() ->
                Expect.equal (IBAN.fromString "BE68539007547034")
                    (Ok (IBAN Belgium "68" "539007547034"))
        , test "IBAN contains not allowed symbols" <|
            \() ->
                Expect.equal (IBAN.fromString "BE68539007547034€")
                    (Err InvalidCharacter)
        , test "IBAN is longer" <|
            \() ->
                Expect.equal (IBAN.fromString "BE6853900754703467")
                    (Err (IBANLengthError Belgium { actual = 18, expected = 16 }))
        , test "IBAN is shorter" <|
            \() ->
                Expect.equal (IBAN.fromString "BE685390075470")
                    (Err (IBANLengthError Belgium { actual = 14, expected = 16 }))
        , test "IBAN unknown country code" <|
            \() ->
                Expect.equal (IBAN.fromString "ZZ685390075470")
                    (Err (UnknownCountryCode "ZZ"))
        , test "IBAN sanity check fail" <|
            \() ->
                Expect.equal (IBAN.fromString "BE68539007547035")
                    (Err SanityCheckFailed)
        ]
