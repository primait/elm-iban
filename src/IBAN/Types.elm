module IBAN.Types
    exposing
        ( BBAN
        , CheckCode
        , Country(..)
        , Error(..)
        , Format(..)
        , IBAN(..)
        )


type IBAN
    = IBAN Country CheckCode BBAN


type alias CheckCode =
    String


type alias BBAN =
    String


type Error
    = IBANLengthError Country { actual : Int, expected : Int }
    | InvalidCharacter
    | SanityCheckFailed
    | UnknownCountryCode String


type Format
    = Textual
    | Electronic


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
