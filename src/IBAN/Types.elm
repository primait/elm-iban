module IBAN.Types
    exposing
        ( BBAN
        , CheckCode
        , Country(..)
        , Error(..)
        , Format(..)
        , IBAN(..)
        )

{-| Types
various types used by IBAN library


## Types

@docs IBAN
@docs Country
@docs CheckCode
@docs BBAN
@docs Error
@docs Format

-}


{-| IBAN type.
-}
type IBAN
    = IBAN Country CheckCode BBAN


{-| CheckCode is a 2 digit string
-}
type alias CheckCode =
    String


{-| BBAN is just a string
-}
type alias BBAN =
    String


{-| Error

The `Err` part of the result of `fromString` operation

-}
type Error
    = IBANLengthError Country { actual : Int, expected : Int }
    | InvalidCharacter
    | SanityCheckFailed
    | UnknownCountryCode String


{-| Format
Enumeration used to dispatch `toString` to the right formatter
-}
type Format
    = Textual
    | Electronic


{-| Country

Enumeration of all the countries that supports IBAN format

-}
type Country
    = Albania
    | Algeria
    | Andorra
    | Angola
    | Austria
    | Azerbaijan
    | Bahrain
    | Benin
    | Belarus
    | Belgium
    | BosniaHerzegovina
    | Brazil
    | BritishVirginIslands
    | Bulgaria
    | BurkinaFaso
    | Burundi
    | Cameroon
    | CapeVerde
    | CostaRica
    | Croatia
    | Cyprus
    | CzechRepublic
    | Denmark
    | DominicanRepublic
    | EastTimor
    | ElSalvador
    | Estonia
    | FaroeIslands
    | Finland
    | France
    | Georgia
    | Germany
    | Gibraltar
    | Greece
    | Greenland
    | Guatemala
    | Hungary
    | Iceland
    | Iran
    | Iraq
    | Ireland
    | Israel
    | Italy
    | IvoryCoast
    | Jordan
    | Kazakhstan
    | Kosovo
    | Kuwait
    | Latvia
    | Lebanon
    | Liechtenstein
    | Lithuania
    | Luxembourg
    | Macedonia
    | Madagascar
    | Mali
    | Malta
    | Mauritania
    | Mauritius
    | Monaco
    | Moldova
    | Montenegro
    | Mozambique
    | Netherlands
    | Norway
    | Pakistan
    | PalestinianTerritories
    | Poland
    | Portugal
    | Qatar
    | Romania
    | SaintLucia
    | SanMarino
    | SaoTomeAndPrincipe
    | SaudiArabia
    | Senegal
    | Serbia
    | Seychelles
    | Slovakia
    | Slovenia
    | Spain
    | Sweden
    | Switzerland
    | Tunisia
    | Turkey
    | Ukraine
    | UnitedArabEmirates
    | UnitedKingdom
