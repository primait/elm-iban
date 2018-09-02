module ParseFormat exposing (..)

import Expect exposing (Expectation)
import IBAN
import IBAN.Types exposing (..)
import Test exposing (..)


suite : Test
suite =
    describe "Test iban"
        [ test "IBAN from string " <|
            \() ->
                Expect.equal (IBAN.fromString "BE68539007547034")
                    (Ok (IBAN Belgium "68" "539007547034"))
        , test "IBAN to string textual" <|
            \() ->
                Expect.equal (IBAN.toString Textual (IBAN France "76" "30006000011234567890189"))
                    "FR76 3000 6000 0112 3456 7890 189"
        , test "IBAN to string electronic" <|
            \() ->
                Expect.equal (IBAN.toString Electronic (IBAN France "76" "30006000011234567890189"))
                    "FR7630006000011234567890189"
        ]
