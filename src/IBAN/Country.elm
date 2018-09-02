module IBAN.Country
    exposing
        ( fromString
        , toString
        )

import IBAN.Types exposing (..)


toString : Country -> String
toString country =
    case country of
        Albania ->
            "AL"

        Algeria ->
            "DZ"

        Andorra ->
            "AD"

        Angola ->
            "AO"

        Austria ->
            "AT"

        Azerbaijan ->
            "AZ"

        Bahrain ->
            "BH"

        Belarus ->
            "BY"

        Belgium ->
            "BE"

        Benin ->
            "BJ"

        BosniaHerzegovina ->
            "BA"

        BritishVirginIslands ->
            "VG"

        Brazil ->
            "BR"

        Bulgaria ->
            "BG"

        BurkinaFaso ->
            "BF"

        Burundi ->
            "BI"

        Cameroon ->
            "CM"

        CapeVerde ->
            "CV"

        CostaRica ->
            "CR"

        Croatia ->
            "HR"

        Cyprus ->
            "CY"

        CzechRepublic ->
            "CZ"

        Denmark ->
            "DK"

        DominicanRepublic ->
            "DO"

        EastTimor ->
            "TL"

        ElSalvador ->
            "SV"

        Estonia ->
            "EE"

        FaroeIslands ->
            "FO"

        Finland ->
            "FI"

        France ->
            "FR"

        Georgia ->
            "GE"

        Germany ->
            "DE"

        Gibraltar ->
            "GI"

        Greece ->
            "GR"

        Greenland ->
            "GL"

        Guatemala ->
            "GT"

        Hungary ->
            "HU"

        Iceland ->
            "IS"

        Iran ->
            "IR"

        Iraq ->
            "IQ"

        Ireland ->
            "IE"

        Israel ->
            "IL"

        Italy ->
            "IT"

        IvoryCoast ->
            "IC"

        Jordan ->
            "JO"

        Kazakhstan ->
            "KZ"

        Kosovo ->
            "XK"

        Kuwait ->
            "KW"

        Latvia ->
            "LV"

        Lebanon ->
            "LB"

        Liechtenstein ->
            "LI"

        Lithuania ->
            "LT"

        Luxembourg ->
            "LU"

        Macedonia ->
            "MK"

        Madagascar ->
            "MG"

        Mali ->
            "ML"

        Malta ->
            "MT"

        Mauritania ->
            "MR"

        Mauritius ->
            "MU"

        Monaco ->
            "MC"

        Moldova ->
            "MD"

        Montenegro ->
            "ME"

        Mozambique ->
            "MZ"

        Netherlands ->
            "NL"

        Norway ->
            "NO"

        Pakistan ->
            "PK"

        PalestinianTerritories ->
            "PS"

        Poland ->
            "PL"

        Portugal ->
            "PT"

        Qatar ->
            "QA"

        Romania ->
            "RO"

        SaintLucia ->
            "LC"

        SanMarino ->
            "SM"

        SaoTomeAndPrincipe ->
            "ST"

        SaudiArabia ->
            "SA"

        Senegal ->
            "SN"

        Seychelles ->
            "SC"

        Serbia ->
            "RS"

        Slovakia ->
            "SK"

        Slovenia ->
            "SI"

        Spain ->
            "ES"

        Sweden ->
            "SE"

        Switzerland ->
            "CH"

        Tunisia ->
            "TN"

        Turkey ->
            "TR"

        Ukraine ->
            "UA"

        UnitedArabEmirates ->
            "AE"

        UnitedKingdom ->
            "GB"


fromString : String -> Result Error Country
fromString code =
    case code of
        "AL" ->
            Ok Albania

        "DZ" ->
            Ok Algeria

        "AD" ->
            Ok Andorra

        "AO" ->
            Ok Angola

        "AT" ->
            Ok Austria

        "AZ" ->
            Ok Azerbaijan

        "BH" ->
            Ok Bahrain

        "BY" ->
            Ok Belarus

        "BE" ->
            Ok Belgium

        "BJ" ->
            Ok Benin

        "BA" ->
            Ok BosniaHerzegovina

        "BR" ->
            Ok Brazil

        "VG" ->
            Ok BritishVirginIslands

        "BG" ->
            Ok Bulgaria

        "BF" ->
            Ok BurkinaFaso

        "BI" ->
            Ok Burundi

        "CM" ->
            Ok Cameroon

        "CV" ->
            Ok CapeVerde

        "CR" ->
            Ok CostaRica

        "HR" ->
            Ok Croatia

        "CY" ->
            Ok Cyprus

        "CZ" ->
            Ok CzechRepublic

        "DK" ->
            Ok Denmark

        "DO" ->
            Ok DominicanRepublic

        "TL" ->
            Ok EastTimor

        "SV" ->
            Ok ElSalvador

        "EE" ->
            Ok Estonia

        "FO" ->
            Ok FaroeIslands

        "FI" ->
            Ok Finland

        "FR" ->
            Ok France

        "GE" ->
            Ok Georgia

        "DE" ->
            Ok Germany

        "GI" ->
            Ok Gibraltar

        "GR" ->
            Ok Greece

        "GL" ->
            Ok Greenland

        "GT" ->
            Ok Guatemala

        "HU" ->
            Ok Hungary

        "IS" ->
            Ok Iceland

        "IR" ->
            Ok Iran

        "IQ" ->
            Ok Iraq

        "IE" ->
            Ok Ireland

        "IL" ->
            Ok Israel

        "IT" ->
            Ok Italy

        "IC" ->
            Ok IvoryCoast

        "JO" ->
            Ok Jordan

        "KZ" ->
            Ok Kazakhstan

        "XK" ->
            Ok Kosovo

        "KW" ->
            Ok Kuwait

        "LV" ->
            Ok Latvia

        "LB" ->
            Ok Lebanon

        "LI" ->
            Ok Liechtenstein

        "LT" ->
            Ok Lithuania

        "LU" ->
            Ok Luxembourg

        "MK" ->
            Ok Macedonia

        "MG" ->
            Ok Madagascar

        "ML" ->
            Ok Mali

        "MT" ->
            Ok Malta

        "MR" ->
            Ok Mauritania

        "MU" ->
            Ok Mauritius

        "MC" ->
            Ok Monaco

        "MD" ->
            Ok Moldova

        "ME" ->
            Ok Montenegro

        "MZ" ->
            Ok Mozambique

        "NL" ->
            Ok Netherlands

        "NO" ->
            Ok Norway

        "PK" ->
            Ok Pakistan

        "PS" ->
            Ok PalestinianTerritories

        "PL" ->
            Ok Poland

        "PT" ->
            Ok Portugal

        "QA" ->
            Ok Qatar

        "RO" ->
            Ok Romania

        "LC" ->
            Ok SaintLucia

        "SM" ->
            Ok SanMarino

        "ST" ->
            Ok SaoTomeAndPrincipe

        "SA" ->
            Ok SaudiArabia

        "SN" ->
            Ok Senegal

        "SC" ->
            Ok Seychelles

        "RS" ->
            Ok Serbia

        "SK" ->
            Ok Slovakia

        "SI" ->
            Ok Slovenia

        "ES" ->
            Ok Spain

        "SE" ->
            Ok Sweden

        "CH" ->
            Ok Switzerland

        "TN" ->
            Ok Tunisia

        "TR" ->
            Ok Turkey

        "UA" ->
            Ok Ukraine

        "AE" ->
            Ok UnitedArabEmirates

        "GB" ->
            Ok UnitedKingdom

        code ->
            Err (UnknownCountryCode code)
