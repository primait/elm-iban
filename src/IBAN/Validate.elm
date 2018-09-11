module IBAN.Validate exposing
    ( chars
    , ibanLength
    , length
    , sanityCheck
    )

{-| Validation

Validates an IBAN by performing these checks:

1.  the IBAN contains only alphanumeric characters
2.  the IBAN matches per country length
3.  the sanity check is positive.

this library **doesn't** perform country specific
checks on the BBAN part.

-}

import Char
import IBAN.Types exposing (..)


{-| Length validation

Checks that the string length is correct per country basis

-}
length : Country -> String -> Result Error String
length country string =
    let
        expected =
            ibanLength country

        actual =
            String.length string
    in
    if expected == actual then
        Ok string

    else
        Err (lengthErr country actual expected)


lengthErr : Country -> Int -> Int -> Error
lengthErr country actual expected =
    IBANLengthError country
        { actual = actual
        , expected = expected
        }


{-| Character validation

Checks that all characters in the string are valid (i.e. alphanumeric\*)

-}
chars : String -> Result Error String
chars string =
    if String.all isAlphaNumeric string then
        Ok string

    else
        Err InvalidCharacter


{-| Sanity Check

Performs sanity check

see:
[[[https://en.wikipedia.org/wiki/International\_Bank\_Account\_Number#Structure](https://en.wikipedia.org/wiki/International_Bank_Account_Number#Structure)](https://en.wikipedia.org/wiki/International_Bank_Account_Number#Structure)](https://en.wikipedia.org/wiki/International_Bank_Account_Number#Structure)

-}
sanityCheck : String -> Result Error String
sanityCheck string =
    if performSanityCheck string then
        Ok string

    else
        Err SanityCheckFailed


isAlphaNumeric : Char -> Bool
isAlphaNumeric c =
    Char.isDigit c || Char.isUpper c


ibanLength : Country -> Int
ibanLength country =
    case country of
        Albania ->
            28

        Andorra ->
            24

        Austria ->
            20

        Azerbaijan ->
            28

        Bahrain ->
            22

        Belarus ->
            28

        Belgium ->
            16

        BosniaHerzegovina ->
            20

        Brazil ->
            29

        Bulgaria ->
            22

        CostaRica ->
            22

        Croatia ->
            21

        Cyprus ->
            28

        CzechRepublic ->
            24

        Denmark ->
            18

        DominicanRepublic ->
            28

        EastTimor ->
            23

        Estonia ->
            20

        FaroeIslands ->
            18

        Finland ->
            18

        France ->
            27

        Georgia ->
            22

        Germany ->
            22

        Gibraltar ->
            23

        Greece ->
            27

        Greenland ->
            18

        Guatemala ->
            28

        Hungary ->
            28

        Iceland ->
            26

        Ireland ->
            22

        Israel ->
            23

        Italy ->
            27

        Jordan ->
            30

        Kazakhstan ->
            20

        Kosovo ->
            20

        Kuwait ->
            30

        Latvia ->
            21

        Lebanon ->
            28

        Liechtenstein ->
            21

        Lithuania ->
            20

        Luxembourg ->
            20

        Macedonia ->
            19

        Malta ->
            31

        Mauritania ->
            27

        Mauritius ->
            30

        Monaco ->
            27

        Moldova ->
            24

        Montenegro ->
            22

        Netherlands ->
            18

        Norway ->
            15

        Pakistan ->
            24

        PalestinianTerritories ->
            29

        Poland ->
            28

        Portugal ->
            25

        Qatar ->
            29

        Romania ->
            24

        SanMarino ->
            27

        SaudiArabia ->
            24

        Serbia ->
            22

        Slovakia ->
            24

        Slovenia ->
            19

        Spain ->
            24

        Sweden ->
            24

        Switzerland ->
            21

        Tunisia ->
            24

        Turkey ->
            26

        UnitedArabEmirates ->
            23

        UnitedKingdom ->
            22

        BritishVirginIslands ->
            24

        Algeria ->
            24

        Angola ->
            25

        Benin ->
            28

        BurkinaFaso ->
            28

        Burundi ->
            16

        Cameroon ->
            28

        CapeVerde ->
            25

        Iran ->
            26

        IvoryCoast ->
            28

        Madagascar ->
            27

        Mali ->
            28

        Mozambique ->
            25

        Senegal ->
            28

        Ukraine ->
            29

        ElSalvador ->
            28

        SaoTomeAndPrincipe ->
            25

        Seychelles ->
            31

        SaintLucia ->
            32

        Iraq ->
            23


{-| Perform the sanity check,

It moves the country code and the check code to the end of the string,
then replaces alphabetic characters with number, i.e.

A -> 10, B -> 11 ...

The resulting string is a decimal representation of a number.

The check is positive if the modulo 97 operation on that number equals
to 1.

-}
performSanityCheck : String -> Bool
performSanityCheck =
    rotate 4
        >> prepare
        >> String.toList
        >> List.map digitToInt
        >> modulo 97
        >> (==) 1


digitToInt : Char -> Int
digitToInt =
    Char.toCode >> (\a -> (-) a base0)


prepare : String -> String
prepare =
    String.toList
        >> List.map convert
        >> String.concat


convert : Char -> String
convert char =
    if Char.isDigit char then
        String.fromChar char

    else
        String.fromInt (Char.toCode char - baseA + 10)


baseA : Int
baseA =
    Char.toCode 'A'


base0 : Int
base0 =
    Char.toCode '0'


{-| Modulo operation

Modulo operation on the iban number. the number is represented as a sequence of Int digits.

see:
[[[https://en.wikipedia.org/wiki/International\_Bank\_Account\_Number#Modulo\_operation\_on\_IBAN](https://en.wikipedia.org/wiki/International_Bank_Account_Number#Modulo_operation_on_IBAN)](https://en.wikipedia.org/wiki/International_Bank_Account_Number#Modulo_operation_on_IBAN)](https://en.wikipedia.org/wiki/International_Bank_Account_Number#Modulo_operation_on_IBAN)

-}
modulo : Int -> List Int -> Int
modulo div =
    List.foldl (folder div) 0


folder : Int -> Int -> Int -> Int
folder div digit total =
    modBy div (total * 10 + digit)


rotate : Int -> String -> String
rotate n string =
    String.dropLeft n string ++ String.left n string
