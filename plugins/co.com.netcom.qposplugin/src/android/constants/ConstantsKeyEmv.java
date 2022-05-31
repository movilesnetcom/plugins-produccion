package co.com.netcom.qposplugin.android.constants;

import co.com.netcom.qposplugin.android.dto.EmvKeyDTO;

/**
 * Created by movilesequipo1 on 13/04/18.
 */
public class ConstantsKeyEmv {

    /**TEST*/
    public static final EmvKeyDTO  TEST_KEY1 = new EmvKeyDTO(
            "AA A0 00 00 01",
            "18",
            "BC CC A2 9A A4 E4 75 5B A3 6B 01 87 D1 0D 90 88 "+
            "8E 1C FA AA A3 FC D2 20 78 EC 9D 3E 8A 06 87 B1 "+
            "01 BB 5A EB EF 0F 2E 53 19 35 C8 18 35 B1 C7 0B "+
            "F3 FD 3F 83 EC 9C 95 AA E1 D7 FD E1 A0 DE DC 2C "+
            "FD B2 38 8E 82 C2 A1 9A 02 AD C4 5C 68 33 DB C8 "+
            "D6 CE 40 E2 DD 9E AA 44 E3 01 B8 A5 C6 22 14 B4 "+
            "90 65 29 D4 F0 80 D1 1D 12 E4 84 C5 1E CF 6F F8 "+
            "25 24 0B A1 D1 4A BE D8 91 76 10 CA D6 89 51 70 "+
            "4E 87 6D DB E2 89 E4 7A 2E 39 40 B7 47 66 A9 D5 "+
            "6E 25 91 30 E3 4E BB 3B CE 6F 5A 8A 52 0A BF 69 "+
            "73 71 68 16 BC 6F 13 5C BB EC 51 E3 65 62 22 1D "+
            "EA D7 FA 16 3C 75 3C 42 3A DD B7 E8 BA 7A 76 81 "+
            "F5 0A F9 B0 97 1E 99 A2 87 C1 F6 49 72 FE FD A1 "+
            "CF D8 09 68 2A D6 D3 EA AC 47 B7 68 68 72 F8 6E "+
            "51 40 24 53 F8 88 B7 D7 AE 64 B5 07 F1 6B 34 E0 "+
            "77 26 31 22 42 00 6C 9B ",
            "32 FF DC F6 7C E0 EB 1B F6 BD CD 01 68 D3 D7 B0 B7 FF F3 B5",
            "03"
    );
    public static final EmvKeyDTO  TEST_KEY2 = new EmvKeyDTO(
            "AA A0 00 00 01",
            "19",
            "E9 3F 3B 90 10 9F 46 46 B7 6B 60 03 35 51 08 4F "+
            "B6 E0 B8 9A C9 A7 C9 4D F3 24 C8 33 61 F0 CD 7A "+
            "2C 68 45 5B AE 46 5A 3A 9F DB A9 D4 43 03 54 5C "+
            "E1 65 D4 6A 38 70 EE 33 CC 0C BB 32 0E 7B 3B 67 "+
            "4C D9 E4 CF 2E 79 75 DE 27 A4 FA A1 D4 0B 85 0B "+
            "99 1E 13 1E 9A 47 91 32 15 78 1F 86 C4 A1 8C 94 "+
            "F1 39 76 13 15 6B 31 52 C5 EB 4E 80 C1 FD F9 D1 "+
            "79 53 BD C0 A7 5D D8 64 0E CD D4 1D 70 3B ED F2 "+
            "D0 47 95 6E C9 38 F7 ED 21 B2 50 CD E0 06 C9 20 "+
            "C8 52 26 C8 1F 86 9D 4F 35 B8 2D F3 F3 58 71 77 "+
            "63 C9 7D 84 5C 15 1C 31 92 0D 58 83 70 A6 46 94 "+
            "E8 83 E4 5C 09 43 CC 92 FF 26 CB 98 34 7D EC 93 "+
            "96 4D AF AC FC FC 4E 27 F7 3E 51 D7 71 34 01 84 "+
            "F3 88 50 A3 B6 5F 08 AA 09 F2 19 4A 40 67 28 27 "+
            "A3 25 2B 15 26 BF 9E 99 4F 09 46 91 D5 D2 D0 C9 "+
            "6A 77 49 A2 AB 3B D4 E1",
            "E1 F4 0A A9 3C F9 1B 82 35 A2 D9 26 44 46 38 85 14 9B 8A C4",
            "03"
    );
    public static final EmvKeyDTO  TEST_KEY3 = new EmvKeyDTO(
            "AA A0 00 00 01",
            "16",
            "B5 37 FC 19 AF 77 49 FD 41 F2 F6 01 CC 9E A0 51 "+
            "7A B5 32 01 4A B9 30 58 E5 DE 71 74 47 56 D7 D7 "+
            "EE 7C EB C2 86 92 76 FC DA 10 53 8F EA 6E 1E 9F "+
            "B9 E1 5F 3A 33 41 14 06 FC 32 04 BB 58 31 F1 F3 "+
            "88 2F 07 F7 2C 6D 72 E9 8A 51 86 07 17 C0 F4 E0 "+
            "03 23 D9 27 8D 81 30 A6 82 9D 8E D7 41 C5 B1 F5 "+
            "0C 56 1A 5C 07 53 92 86 35 6C FC 03 13 87 0E 13 "+
            "39 FE 4E 4A FB EF A3 DB D4 FE 8C 00 1F 20 81 2F "+
            "E7 8B AF 96 D2 6A F8 17 94 1C E0 D6 41 8F 83 8F "+
            "D7 65 47 CE 18 AD 22 E6 2E F6 B4 FE 0B D9 E9 E5 "+
            "29 52 90 7A 06 41 C0 C7 C6 E7 1F 9E 3F 11 4C 9B ",
            "30 42 BB FF E3 82 7B F7 EC 44 9D 3A 48 9B 6B 6A 27 C9 C7 33",
            "03");
    public static final EmvKeyDTO  TEST_KEY4 = new EmvKeyDTO(
            "AA A0 00 00 01",
            "14",
            "B3 1F F6 47 CA 3D 54 70 E8 68 FF AF F1 D7 AE 98 " +
            "B1 59 73 F4 30 3E 52 09 F1 B2 67 7C 5E 21 4D C3 " +
            "FC 38 01 5F E6 18 13 87 B9 D4 04 B0 CE D8 8A AB " +
            "C1 F9 36 09 07 F8 41 6C D7 D1 AF F5 6E 42 EA 2E " +
            "60 EC 76 89 E2 5C EF DD 1A 37 AD CB CA 9F BD D0 " +
            "AF 2C A5 F2 13 78 DB 40 1E 74 EA 3D 8B 2D 37 A7 " +
            "01 4B 78 ED 08 E1 0F 18 02 1F E3 7F 17 A1 42 0F " +
            "0B 61 7A 9A 94 A4 33 6F 85 40 75 BE 3D 26 EF 8D " +
            "75 9A 3D 3B E9 07 34 0B F7 EA 9D D5 C7 7F 17 F8 " +
            "9F 57 4A CF 7A AF 12 AE 0A A3 F8 F2 E2 0C 34 91 " +
            "32 98 74 10 C1 00 C0 5F A8 F2 07 7B 14 BF FA C5",
            "6B E6 BA 60 52 9B 3F B7 AF BB 1F 72 D8 3F AB 3E C3 1A A0 5D",
            "03");
    public static final EmvKeyDTO  TEST_KEY5 = new EmvKeyDTO(
            "AA A0 00 00 01",
            "1A",
            "97 91 51 BF 88 0C 8F D3 4E D6 51 0C 52 54 4F EE"+
            "1C 42 AC 66 66 A1 EF 36 24 11 90 0F 59 69 EA A0"+
            "32 CC 3C DF 28 A3 68 20 11 D2 30 42 D6 2C 6E 1E"+
            "39 0E 8F EB E0 40 2C D2 DC 82 17 6B 01 62 2A D6"+
            "AC E5 8E 3F 3F 7E EA 5E DB 96 FC 22 C5 FD 3A E6"+
            "5F 89 9F C9 68 39 43 39 9F 11 4B AE 7B 02 E3 DF"+
            "24 50 13 7A 4F F3 D9 34 E1 09 8C 92 A1 A7 C6 49"+
            "B2 74 5A 39 88 69 9A FE 60 16 EA D2 ED 3C 26 4E"+
            "05 E0 D3 29 B0 13 C8 2E 6A 58 47 2C 44 0C A4 B3"+
            "D5 CF 1A 45 1F 36 9B DB D3 70 87 DE 9F 62 AE 70"+
            "15 6C A9 75 E9 B3 AA 5B 19 DE 59 D9 E9 71 3B 50"+
            "E3 AC 0E A1 60 08 76 32 49 B0 1F 38 89 6D 5C 2E"+
            "E5 76 2D 81 DD 6F FA 66 E6 36 7C 38 92 86 A0 20"+
            "61 D1 EF 3E 30 4C AE A2 54 A9 D0 0A E6 28 FF 29"+
            "7D A9 62 AB AF 44 3A 25 F5 EE 73 1B 12 91 1E 4B"+
            "60 53 FA 65 BD 71 64 D3",
            "BD 65 8F CE A8 31 8D 77 80 54 89 C3 13 4E 2C 32 24 87 8F AB",
            "03"
    );
    public static final EmvKeyDTO  TEST_KEY6 = new EmvKeyDTO(
            "AA A0 00 00 01",
            "05",
            "B4 0C 48 63 DE FF 83 14 F1 04 38 E2 9C CF 80 17 "+
            "DA 27 63 FD A5 C8 C6 EC 61 53 75 8F 1E 30 6D 1B " +
            "AA AF 67 D5 79 0F 95 9A CC 07 EF AD 0C 00 81 73 " +
            "1E 45 B6 94 E0 30 26 2C 89 75 17 B2 C0 B2 5B 17 " +
            "E3 62 AC 2F D2 D0 01 94 FD DB 3B DC 85 DC 85 DE " +
            "1F DC 46 F8 27 7E 20 DE AD B9 A6 8C 70 72 40 76 " +
            "EE 58 9F 94 AF 7B 89 00 F2 AC 63 39 6C 77 5E ED " +
            "51 02 AE 6A E5 33 75 FB 4B 66 54 11 5D 13 0F 1E " +
            "DC 0A D8 47 87 96 E9 C4 85 D5 0C 64 81 23 8A DD " +
            "9B 0C 26 2D 58 EE 41 D8 6B F6 56 C5 8E 4D A7 4C " +
            "90 28 DC F8 04 C4 E4 5A CD 01 1D 48 E6 FE E6 D3",
            "ED 78 28 B7 23 38 B3 82 A9 C5 EE 76 86 C6 F4 CC 60 12 03 05",
            "03"
    );
    public static final EmvKeyDTO  TEST_KEY7 = new EmvKeyDTO(
            "AA A0 00 00 01",
            "F1",
            "A5 00 B6 EE D9 0F EA 29 99 86 2D 10 1C 2F 29 30 9A 24 D1 FD 3E 10 50 "+
            "1E B7 0D DE 3D E4 03 A5 45 1F 6B 5C DA 07 48 C8 7A 4E 8E FE 91 6F C9 "+
            "68 FB B3 80 8D 6C 75 61 ED 3A 3B 4C 74 E8 A1 58 17 9C 6E E8 FE A1 B6 "+
            "D9 87 7C 2C 22 B4 53 F5 A7 2E 23 07 89 70 FA AE F7 D6 85 5B A4 52 86 "+
            "5F 2D 69 CD F6 75 A8 2C C7 CF 19 BE E4 16 7D 5E 08 F1 4B B2 A7 56 BA "+
            "8F 13 B2 DB 40 25 89 50 37 ED 5B 75 02 F2 57 AA DC 50 AD E6 C0 E4 24 "+
            "DD E8 52 34 14 01 33 78 AD F5 9E 7C AE 88 EF A6 2B 5E 78 6B ED 01 1B "+
            "BD 64 BA AD 61 F4 DA DC 7B 15 FC F7 55 CB F1",
            "4E 01 BD B8 4A 0E EE 9D 14 CA 78 9C FF 51 60 FA BB E4 76 64",
            "03"
    );
    public static final EmvKeyDTO  TEST_KEY8 = new EmvKeyDTO(
            "A0 00 00 00 03",
            "50",
            "D1 11 97 59 00 57 B8 41 96 C2 F4 D1 1A 8F 3C 05 " +
            "40 8F 42 2A 35 D7 02 F9 01 06 EA 5B 01 9B B2 8A " +
            "E6 07 AA 9C DE BC D0 D8 1A 38 D4 8C 7E BB 00 62 " +
            "D2 87 36 9E C0 C4 21 24 24 6A C3 0D 80 CD 60 2A " +
            "B7 23 8D 51 08 4D ED 46 98 16 2C 59 D2 5E AC 1E " +
            "66 25 5B 4D B2 35 25 26 EF 09 82 C3 B8 AD 3D 1C " +
            "CE 85 B0 1D B5 78 8E 75 E0 9F 44 BE 73 61 36 6D " +
            "EF 9D 1E 13 17 B0 5E 5D 0F F5 29 0F 88 A0 DB 47",
            "B7 69 77 56 68 CA CB 5D 22 A6 47 D1 D9 93 14 1E DA B7 23 7B",
            "01 00 01"
    );
    public static final EmvKeyDTO  TEST_KEY9 = new EmvKeyDTO(
            "A0 00 00 00 03",
            "51",
            "DB 5F A2 9D 1F DA 8C 16 34 B0 4D CC FF 14 8A BE"+
            "E6 3C 77 20 35 C7 98 51 D3 51 21 07 58 6E 02 A9"+
            "17 F7 C7 E8 85 E7 C4 A7 D5 29 71 0A 14 53 34 CE"+
            "67 DC 41 2C B1 59 7B 77 AA 25 43 B9 8D 19 CF 2C"+
            "B8 0C 52 2B DB EA 0F 1B 11 3F A2 C8 62 16 C8 C6"+
            "10 A2 D5 8F 29 CF 33 55 CE B1 BD 3E F4 10 D1 ED"+
            "D1 F7 AE 0F 16 89 79 79 DE 28 C6 EF 29 3E 0A 19"+
            "28 2B D1 D7 93 F1 33 15 23 FC 71 A2 28 80 04 68"+
            "C0 1A 36 53 D1 4C 6B 48 51 A5 C0 29 47 8E 75 7F",
            "B9 D2 48 07 5A 3F 23 B5 22 FE 45 57 3E 04 37 4D C4 99 5D 71",
            "03"
    );
    public static final EmvKeyDTO  TEST_KEY10 = new EmvKeyDTO(
            "A0 00 00 00 03",
            "53",
            "BC D8 37 21 BE 52 CC CC 4B 64 57 32 1F 22 A7 DC " +
                    "76 9F 54 EB 80 25 91 3B E8 04 D9 EA BB FA 19 B3 " +
                    "D7 C5 D3 CA 65 8D 76 8C AF 57 06 7E EC 83 C7 E6 " +
                    "E9 F8 1D 05 86 70 3E D9 DD DA DD 20 67 5D 63 42 " +
                    "49 80 B1 0E B3 64 E8 1E B3 7D B4 0E D1 00 34 4C " +
                    "92 88 86 FF 4C CC 37 20 3E E6 10 6D 5B 59 D1 AC " +
                    "10 2E 2C D2 D7 AC 17 F4 D9 6C 39 8E 5F D9 93 EC " +
                    "B4 FF DF 79 B1 75 47 FF 9F A2 AA 8E EF D6 CB DA " +
                    "12 4C BB 17 A0 F8 52 81 46 38 71 35 E2 26 B0 05 " +
                    "A4 74 B9 06 2F F2 64 D2 FF 8E FA 36 81 4A A2 95 " +
                    "00 65 B1 B0 4C 0A 1A E9 B2 F6 9D 4A 4A A9 79 D6 " +
                    "CE 95 FE E9 48 5E D0 A0 3A EE 9B D9 53 E8 1C FD " +
                    "1E F6 E8 14 DF D3 C2 CE 37 AE FA 38 C1 F9 87 73 " +
                    "71 E9 1D 6A 5E B5 9F DE DF 75 D3 32 5F A3 CA 66 " +
                    "CD FB A0 E5 71 46 CC 78 98 18 FF 06 BE 5F CC 50 " +
                    "AB D3 62 AE 4B 80 99 6D",
            "AC 21 3A 2E 0D 2C 0C A3 5A D0 20 13 23 53 6D 58 09 7E 4E 57",
            "03"
    );

    public static final EmvKeyDTO  TEST_KEY11 = new EmvKeyDTO(
            "A0 00 00 00 03",
            "92",
            "99 6A F5 6F 56 91 87 D0 92 93 C1 48 10 45 0E D8 " +
                    "EE 33 57 39 7B 18 A2 45 8E FA A9 2D A3 B6 DF 65 " +
                    "14 EC 06 01 95 31 8F D4 3B E9 B8 F0 CC 66 9E 3F " +
                    "84 40 57 CB DD F8 BD A1 91 BB 64 47 3B C8 DC 9A " +
                    "73 0D B8 F6 B4 ED E3 92 41 86 FF D9 B8 C7 73 57 " +
                    "89 C2 3A 36 BA 0B 8A F6 53 72 EB 57 EA 5D 89 E7 " +
                    "D1 4E 9C 7B 6B 55 74 60 F1 08 85 DA 16 AC 92 3F " +
                    "15 AF 37 58 F0 F0 3E BD 3C 5C 2C 94 9C BA 30 6D " +
                    "B4 4E 6A 2C 07 6C 5F 67 E2 81 D7 EF 56 78 5D C4 " +
                    "D7 59 45 E4 91 F0 19 18 80 0A 9E 2D C6 6F 60 08 " +
                    "05 66 CE 0D AF 8D 17 EA D4 6A D8 E3 0A 24 7C 9F",
            "42 9C 95 4A 38 59 CE F9 12 95 F6 63 C9 63 E5 82 ED 6E B2 53",
            "03"
    );

    public static final EmvKeyDTO  TEST_KEY12 = new EmvKeyDTO(
            "A0 00 00 00 03",
            "94",
            "AC D2 B1 23 02 EE 64 4F 3F 83 5A BD 1F C7 A6 F6 " +
            "2C CE 48 FF EC 62 2A A8 EF 06 2B EF 6F B8 BA 8B " +
            "C6 8B BF 6A B5 87 0E ED 57 9B C3 97 3E 12 13 03 " +
            "D3 48 41 A7 96 D6 DC BC 41 DB F9 E5 2C 46 09 79 " +
            "5C 0C CF 7E E8 6F A1 D5 CB 04 10 71 ED 2C 51 D2 " +
            "20 2F 63 F1 15 6C 58 A9 2D 38 BC 60 BD F4 24 E1 " +
            "77 6E 2B C9 64 80 78 A0 3B 36 FB 55 43 75 FC 53 " +
            "D5 7C 73 F5 16 0E A5 9F 3A FC 53 98 EC 7B 67 75 " +
            "8D 65 C9 BF F7 82 8B 6B 82 D4 BE 12 4A 41 6A B7 " +
            "30 19 14 31 1E A4 62 C1 9F 77 1F 31 B3 B5 73 36 " +
            "00 0D FF 73 2D 3B 83 DE 07 05 2D 73 03 54 D2 97 " +
            "BE C7 28 71 DC CF 0E 19 3F 17 1A BA 27 EE 46 4C " +
            "6A 97 69 09 43 D5 9B DA BB 2A 27 EB 71 CE EB DA " +
            "FA 11 76 04 64 78 FD 62 FE C4 52 D5 CA 39 32 96 " +
            "53 0A A3 F4 19 27 AD FE 43 4A 2D F2 AE 30 54 F8 " +
            "84 06 57 A2 6E 0F C6 17",
            "C4 A3 C4 3C CF 87 32 7D 13 6B 80 41 60 E4 7D 43 B6 0E 6E 0F",
            "03"
    );

    public static final EmvKeyDTO  TEST_KEY13 = new EmvKeyDTO(
            "A0 00 00 00 03",
            "95",
            "BE 9E 1F A5 E9 A8 03 85 29 99 C4 AB 43 2D B2 86 " +
            "00 DC D9 DA B7 6D FA AA 47 35 5A 0F E3 7B 15 08 " +
            "AC 6B F3 88 60 D3 C6 C2 E5 B1 2A 3C AA F2 A7 00 " +
            "5A 72 41 EB AA 77 71 11 2C 74 CF 9A 06 34 65 2F " +
            "BC A0 E5 98 0C 54 A6 47 61 EA 10 1A 11 4E 0F 0B " +
            "55 72 AD D5 7D 01 0B 7C 9C 88 7E 10 4C A4 EE 12 " +
            "72 DA 66 D9 97 B9 A9 0B 5A 6D 62 4A B6 C5 7E 73 " +
            "C8 F9 19 00 0E B5 F6 84 89 8E F8 C3 DB EF B3 30 " +
            "C6 26 60 BE D8 8E A7 8E 90 9A FF 05 F6 DA 62 7B",
            "EE 15 11 CE C7 10 20 A9 B9 04 43 B3 7B 1D 5F 6E 70 30 30 F6",
            "03"
    );

    public static final EmvKeyDTO  TEST_KEY14 = new EmvKeyDTO(
            "A0 00 00 00 03",
            "96",
            "B7 45 86 D1 9A 20 7B E6 62 7C 5B 0A AF BC 44 A2 " +
            "EC F5 A2 94 2D 3A 26 CE 19 C4 FF AE EE 92 05 21 " +
            "86 89 22 E8 93 E7 83 82 25 A3 94 7A 26 14 79 6F " +
            "B2 C0 62 8C E8 C1 1E 38 25 A5 6D 3B 1B BA EF 78 " +
            "3A 5C 6A 81 F3 6F 86 25 39 51 26 FA 98 3C 52 16 " +
            "D3 16 6D 48 AC DE 8A 43 12 12 FF 76 3A 7F 79 D9 " +
            "ED B7 FE D7 6B 48 5D E4 5B EB 82 9A 3D 47 30 84 " +
            "8A 36 6D 33 24 C3 02 70 32 FF 8D 16 A1 E4 4D 8D",
            "76 16 E9 AC 8B E0 14 AF 88 CA 11 A8 FB 17 96 7B 73 94 03 0E",
            "03"
    );

    public static final EmvKeyDTO  TEST_KEY15 = new EmvKeyDTO(
            "A0 00 00 00 03",
            "97",
            "AF 07 54 EA ED 97 70 43 AB 6F 41 D6 31 2A B1 E2 " +
            "2A 68 09 17 5B EB 28 E7 0D 5F 99 B2 DF 18 CA E7 " +
            "35 19 34 1B BB D3 27 D0 B8 BE 9D 4D 0E 15 F0 7D " +
            "36 EA 3E 3A 05 C8 92 F5 B1 9A 3E 9D 34 13 B0 D9 " +
            "7E 7A D1 0A 5F 5D E8 E3 88 60 C0 AD 00 4B 1E 06 " +
            "F4 04 0C 29 5A CB 45 7A 78 85 51 B6 12 7C 0B 29",
            "80 01 CA 76 C1 20 39 55 E2 C6 28 41 CD 6F 20 10 87 E5 64 BF",
            "03"
    );

    public static final EmvKeyDTO  TEST_KEY16 = new EmvKeyDTO(
            "A0 00 00 00 03",
            "98",
            "CA 02 6E 52 A6 95 E7 2B D3 0A F9 28 19 6E ED C9 "+
            "FA F4 A6 19 F2 49 2E 3F B3 11 69 78 9C 27 6F FB "+
            "B7 D4 31 16 64 7B A9 E0 D1 06 A3 54 2E 39 65 29 "+
            "2C F7 78 23 DD 34 CA 8E EC 7D E3 67 E0 80 70 89 "+
            "50 77 C7 EF AD 93 99 24 CB 18 70 67 DB F9 2C B1 "+
            "E7 85 91 7B D3 8B AC E0 C1 94 CA 12 DF 0C E5 B7 "+
            "A5 02 75 AC 61 BE 7C 3B 43 68 87 CA 98 C9 FD 39",
            "E7 AC 9A A8 EE D1 B5 FF 1B D5 32 CF 14 89 A3 E5 55 75 72 C1",
            "03"
    );

    public static final EmvKeyDTO  TEST_KEY17 = new EmvKeyDTO(
            "A0 00 00 00 03",
            "99",
            "AB 79 FC C9 52 08 96 96 7E 77 6E 64 44 4E 5D CD " +
                    "D6 E1 36 11 87 4F 39 85 72 25 20 42 52 95 EE A4 " +
                    "BD 0C 27 81 DE 7F 31 CD 3D 04 1F 56 5F 74 73 06 " +
                    "EE D6 29 54 B1 7E DA BA 3A 6C 5B 85 A1 DE 1B EB " +
                    "9A 34 14 1A F3 8F CF 82 79 C9 DE A0 D5 A6 71 0D " +
                    "08 DB 41 24 F0 41 94 55 87 E2 03 59 BA B4 7B 75 " +
                    "75 AD 94 26 2D 4B 25 F2 64 AF 33 DE DC F2 8E 09 " +
                    "61 5E 93 7D E3 2E DC 03 C5 44 45 FE 7E 38 27 77",
            "4A BF FD 6B 1C 51 21 2D 05 55 2E 43 1C 5B 17 00 7D 2F 5E 6D",
            "03"
    );

    public static final EmvKeyDTO  TEST_KEY18 = new EmvKeyDTO(
            "A0 00 00 00 04",
            "00",
            "9E 15 21 42 12 F6 30 8A CA 78 B8 0B D9 86 AC " +
                    "28 75 16 84 6C 8D 54 8A 9E D0 A4 2E 7D 99 7C " +
                    "90 2C 3E 12 2D 1B 9D C3 09 95 F4 E2 5C 75 DD " +
                    "7E E0 A0 CE 29 3B 8C C0 2B 97 72 78 EF 25 6D " +
                    "76 11 94 92 47 64 94 2F E7 14 FA 02 E4 D5 7F " +
                    "28 2B A3 B2 B6 2C 9E 38 EF 65 17 82 3F 2C A8 " +
                    "31 BD DF 6D 36 3D",
            "8B B9 9A DD F7 B5 60 11 09 55 01 45 05 FB 6B 5F 83 08 CE 27",
            "03"
    );

    public static final EmvKeyDTO  TEST_KEY19 = new EmvKeyDTO(
            "A0 00 00 00 04",
            "04",
            "A6 DA 42 83 87 A5 02 D7 DD FB 7A 74 D3 F4 12 BE " +
                    "76 26 27 19 7B 25 43 5B 7A 81 71 6A 70 01 57 DD " +
                    "D0 6F 7C C9 9D 6C A2 8C 24 70 52 7E 2C 03 61 6B " +
                    "9C 59 21 73 57 C2 67 4F 58 3B 3B A5 C7 DC F2 83 " +
                    "86 92 D0 23 E3 56 24 20 B4 61 5C 43 9C A9 7C 44 " +
                    "DC 9A 24 9C FC E7 B3 BF B2 2F 68 22 8C 3A F1 33 " +
                    "29 AA 4A 61 3C F8 DD 85 35 02 37 3D 62 E4 9A B2 " +
                    "56 D2 BC 17 12 0E 54 AE DC ED 6D 96 A4 28 7A CC " +
                    "5C 04 67 7D 4A 5A 32 0D B8 BE E2 F7 75 E5 FE C5",
            "38 1A 03 5D A5 8B 48 2E E2 AF 75 F4 C3 F2 CA 46 9B A4 AA 6C",
            "03"
    );

    public static final EmvKeyDTO  TEST_KEY20 = new EmvKeyDTO(
            "A0 00 00 00 04",
            "05",
            "B8 04 8A BC 30 C9 0D 97 63 36 54 3E 3F D7 09 1C " +
            "8F E4 80 0D F8 20 ED 55 E7 E9 48 13 ED 00 55 5B " +
            "57 3F EC A3 D8 4A F6 13 1A 65 1D 66 CF F4 28 4F " +
            "B1 3B 63 5E DD 0E E4 01 76 D8 BF 04 B7 FD 1C 7B " +
            "AC F9 AC 73 27 DF AA 8A A7 2D 10 DB 3B 8E 70 B2 " +
            "DD D8 11 CB 41 96 52 5E A3 86 AC C3 3C 0D 9D 45 " +
            "75 91 64 69 C4 E4 F5 3E 8E 1C 91 2C C6 18 CB 22 " +
            "DD E7 C3 56 8E 90 02 2E 6B BA 77 02 02 E4 52 2A " +
            "2D D6 23 D1 80 E2 15 BD 1D 15 07 FE 3D C9 0C A3 " +
            "10 D2 7B 3E FC CD 8F 83 DE 30 52 CA D1 E4 89 38 " +
            "C6 8D 09 5A AC 91 B5 F3 7E 28 BB 49 EC 7E D5 97",
            "EB FA 0D 5D 06 D8 CE 70 2D A3 EA E8 90 70 1D 45 E2 74 C8 45",
            "03"
    );
    public static final EmvKeyDTO  TEST_KEY21 = new EmvKeyDTO(
            "A0 00 00 00 04",
            "06",
            "CB 26 FC 83 0B 43 78 5B 2B CE 37 C8 1E D3 34 62 " +
                    "2F 96 22 F4 C8 9A AE 64 10 46 B2 35 34 33 88 3F " +
                    "30 7F B7 C9 74 16 2D A7 2F 7A 4E C7 5D 9D 65 73 " +
                    "36 86 5B 8D 30 23 D3 D6 45 66 76 25 C9 A0 7A 6B " +
                    "7A 13 7C F0 C6 41 98 AE 38 FC 23 80 06 FB 26 03 " +
                    "F4 1F 4F 3B B9 DA 13 47 27 0F 2F 5D 8C 60 6E 42 " +
                    "09 58 C5 F7 D5 0A 71 DE 30 14 2F 70 DE 46 88 89 " +
                    "B5 E3 A0 86 95 B9 38 A5 0F C9 80 39 3A 9C BC E4 " +
                    "4A D2 D6 4F 63 0B B3 3A D3 F5 F5 FD 49 5D 31 F3 " +
                    "78 18 C1 D9 40 71 34 2E 07 F1 BE C2 19 4F 60 35 " +
                    "BA 5D ED 39 36 50 0E B8 2D FD A6 E8 AF B6 55 B1 " +
                    "EF 3D 0D 7E BF 86 B6 6D D9 F2 9F 6B 1D 32 4F E8 " +
                    "B2 6C E3 8A B2 01 3D D1 3F 61 1E 7A 59 4D 67 5C " +
                    "44 32 35 0E A2 44 CC 34 F3 87 3C BA 06 59 29 87 " +
                    "A1 D7 E8 52 AD C2 2E F5 A2 EE 28 13 20 31 E4 8F " +
                    "74 03 7E 3B 34 AB 74 7F",
            "F9 10 A1 50 4D 5F FB 79 3D 94 F3 B5 00 76 5E 1A BC AD 72 D9",
            "03"
    );

    public static final EmvKeyDTO  TEST_KEY22 = new EmvKeyDTO(
            "A0 00 00 00 04",
            "EF",
            "A1 91 CB 87 47 3F 29 34 9B 5D 60 A8 8B 3E AE E0 " +
                    "97 3A A6 F1 A0 82 F3 58 D8 49 FD DF F9 C0 91 F8 " +
                    "99 ED A9 79 2C AF 09 EF 28 F5 D2 24 04 B8 8A 22 " +
                    "93 EE BB C1 94 9C 43 BE A4 D6 0C FD 87 9A 15 39 " +
                    "54 4E 09 E0 F0 9F 60 F0 65 B2 BF 2A 13 EC C7 05 " +
                    "F3 D4 68 B9 D3 3A E7 7A D9 D3 F1 9C A4 0F 23 DC " +
                    "F5 EB 7C 04 DC 8F 69 EB A5 65 B1 EB CB 46 86 CD " +
                    "27 47 85 53 0F F6 F6 E9 EE 43 AA 43 FD B0 2C E0 " +
                    "0D AE C1 5C 7B 8F D6 A9 B3 94 BA BA 41 9D 3F 6D " +
                    "C8 5E 16 56 9B E8 E7 69 89 68 8E FE A2 DF 22 FF " +
                    "7D 35 C0 43 33 8D EA A9 82 A0 2B 86 6D E5 32 85 " +
                    "19 EB BC D6 F0 3C DD 68 66 73 84 7F 84 DB 65 1A " +
                    "B8 6C 28 CF 14 62 56 2C 57 7B 85 35 64 A2 90 C8 " +
                    "55 6D 81 85 31 26 8D 25 CC 98 A4 CC 6A 0B DF FF " +
                    "DA 2D CC A3 A9 4C 99 85 59 E3 07 FD DF 91 50 06 " +
                    "D9 A9 87 B0 7D DA EB 3B",
            "21 76 6E BB 0E E1 22 AF B6 5D 78 45 B7 3D B4 6B AB 65 42 7A",
            "03"
    );

    public static final EmvKeyDTO  TEST_KEY23 = new EmvKeyDTO(
            "A0 00 00 00 04",
            "F0",
            "75 63 C5 1B 52 76 AA 63 70 AB 84 05 52 24 14 64 " +
                    "58 32 B6 BE F2 A9 89 C7 71 47 5B 2E 8D C6 54 DC " +
                    "8A 5B FF 9E 28 E3 1F F1 A3 70 A4 0D C3 FF EB 06 " +
                    "BC 85 48 7D 5F 1C B6 1C 24 41 FD 71 CB CD 05 D8 " +
                    "83 F8 DE 41 3B 24 3A FC 9D CA 76 8B 06 1E 35 B8 " +
                    "84 B5 D2 1B 6B 01 6A A3 6B A1 2D AB CF E4 9F 8E " +
                    "52 8C 89 3C 34 C7 D4 79 39 77 E4 CC 99 AB 09 64 " +
                    "0D 9C 7A AB 7E C5 FF 3F 40 E3 D4 D1 8D F7 E3 A7",
            "AE 66 74 45 F8 DE 6F 82 C3 88 00 E5 EB AB A3 22 F0 3F 58 F2",
            "03"
    );

    public static final EmvKeyDTO  TEST_KEY24 = new EmvKeyDTO(
            "A0 00 00 00 04",
            "F1",
            "A0 DC F4 BD E1 9C 35 46 B4 B6 F0 41 4D 17 4D DE " +
                    "29 4A AB BB 82 8C 5A 83 4D 73 AA E2 7C 99 B0 B0 " +
                    "53 A9 02 78 00 72 39 B6 45 9F F0 BB CD 7B 4B 9C " +
                    "6C 50 AC 02 CE 91 36 8D A1 BD 21 AA EA DB C6 53 " +
                    "47 33 7D 89 B6 8F 5C 99 A0 9D 05 BE 02 DD 1F 8C " +
                    "5B A2 0E 2F 13 FB 2A 27 C4 1D 3F 85 CA D5 CF 66 " +
                    "68 E7 58 51 EC 66 ED BF 98 85 1F D4 E4 2C 44 C1 " +
                    "D5 9F 59 84 70 3B 27 D5 B9 F2 1B 8F A0 D9 32 79 " +
                    "FB BF 69 E0 90 64 29 09 C9 EA 27 F8 98 95 95 41 " +
                    "AA 67 57 F5 F6 24 10 4F 6E 1D 3A 95 32 F2 A6 E5 " +
                    "15 15 AE AD 1B 43 B3 D7 83 50 88 A2 FA FA 7B E7",
            "D8 E6 8D A1 67 AB 5A 85 D8 C3 D5 5E CB 9B 05 17 A1 A5 B4 BB",
            "03"
    );

    public static final EmvKeyDTO  TEST_KEY25 = new EmvKeyDTO(
            "A0 00 00 00 04",
            "F3",
            "98 F0 C7 70 F2 38 64 C2 E7 66 DF 02 D1 E8 33 DF " +
                    "F4 FF E9 2D 69 6E 16 42 F0 A8 8C 56 94 C6 47 9D " +
                    "16 DB 15 37 BF E2 9E 4F DC 6E 6E 8A FD 1B 0E B7 " +
                    "EA 01 24 72 3C 33 31 79 BF 19 E9 3F 10 65 8B 2F " +
                    "77 6E 82 9E 87 DA ED A9 C9 4A 8B 33 82 19 9A 35 " +
                    "0C 07 79 77 C9 7A FF 08 FD 11 31 0A C9 50 A7 2C " +
                    "3C A5 00 2E F5 13 FC CC 28 6E 64 6E 3C 53 87 53 " +
                    "5D 50 95 14 B3 B3 26 E1 23 4F 9C B4 8C 36 DD D4 " +
                    "4B 41 6D 23 65 40 34 A6 6F 40 3B A5 11 C5 EF A3",
            "A6 9A C7 60 3D AF 56 6E 97 2D ED C2 CB 43 3E 07 E8 B0 1A 9A",
            "03"
    );

    public static final EmvKeyDTO  TEST_KEY26 = new EmvKeyDTO(
            "A0 00 00 00 04",
            "F5",
            "A6 E6 FB 72 17 95 06 F8 60 CC CA 8C 27 F9 9C EC " +
                    "D9 4C 7D 4F 31 91 D3 03 BB EE 37 48 1C 7A A1 5F " +
                    "23 3B A7 55 E9 E4 37 63 45 A9 A6 7E 79 94 BD C1 " +
                    "C6 80 BB 35 22 D8 C9 3E B0 CC C9 1A D3 1A D4 50 " +
                    "DA 30 D3 37 66 2D 19 AC 03 E2 B4 EF 5F 6E C1 82 " +
                    "82 D4 91 E1 97 67 D7 B2 45 42 DF DE FF 6F 62 18 " +
                    "55 03 53 20 69 BB B3 69 E3 BB 9F B1 9A C6 F1 C3 " +
                    "0B 97 D2 49 EE E7 64 E0 BA C9 7F 25 C8 73 D9 73 " +
                    "95 3E 51 53 A4 20 64 BB FA BF D0 6A 4B B4 86 86 " +
                    "0B F6 63 74 06 C9 FC 36 81 3A 4A 75 F7 5C 31 CC " +
                    "A9 F6 9F 8D E5 9A DE CE F6 BD E7 E0 78 00 FC BE " +
                    "03 5D 31 76 AF 84 73 E2 3E 9A A3 DF EE 22 11 96 " +
                    "D1 14 83 02 67 7C 72 0C FE 25 44 A0 3D B5 53 E7 " +
                    "F1 B8 42 7B A1 CC 72 B0 F2 9B 12 DF EF 4C 08 1D " +
                    "07 6D 35 3E 71 88 0A AD FF 38 63 52 AF 0A B7 B2 " +
                    "8E D4 9E 1E 67 2D 11 F9",
            "C2 23 98 04 C8 09 81 70 BE 52 D6 D5 D4 15 9E 81 CE 84 66 BF",
            "01 00 01"
    );

    public static final EmvKeyDTO  TEST_KEY27 = new EmvKeyDTO(
            "A0 00 00 00 04",
            "F6",
            "A2 5A 6B D7 83 A5 EF 6B 8F B6 F8 30 55 C2 60 F5 " +
                    "F9 9E A1 66 78 F3 B9 05 3E 0F 64 98 E8 2C 3F 5D " +
                    "1E 8C 38 F1 35 88 01 7E 2B 12 B3 D8 FF 6F 50 16 " +
                    "7F 46 44 29 10 72 9E 9E 4D 1B 37 39 E5 06 7C 0A " +
                    "C7 A1 F4 48 7E 35 F6 75 BC 16 E2 33 31 51 65 CB " +
                    "14 2B FD B2 5E 30 1A 63 2A 54 A3 37 1E BA B6 57 " +
                    "2D EE BA F3 70 F3 37 F0 57 EE 73 B4 AE 46 D1 A8 " +
                    "BC 4D A8 53 EC 3C C1 2C 8C BC 2D A1 83 22 D6 85 " +
                    "30 C7 0B 22 BD AC 35 1D D3 60 68 AE 32 1E 11 AB " +
                    "F2 64 F4 D3 56 9B B7 12 14 54 50 05 55 8D E2 60 " +
                    "83 C7 35 DB 77 63 68 17 2F E8 C2 F5 C8 5E 8B 5B " +
                    "89 0C C6 82 91 1D 2D E7 1F A6 26 B8 81 7F CC C0 " +
                    "89 22 B7 03 86 9F 3B AE AC 14 59 D7 7C D8 53 76 " +
                    "BC 36 18 2F 42 38 31 4D 6C 42 12 FB DD 7F 23 D3",
            "50 29 09 ED 54 5E 3C 8D BD 00 EA 58 2D 06 17 FE E9 F6 F6 84",
            "03"
    );

    public static final EmvKeyDTO  TEST_KEY28 = new EmvKeyDTO(
            "A0 00 00 00 04",
            "F7",
            "94 EA 62 F6 D5 83 20 E3 54 C0 22 AD DC F0 55 9D " +
                    "8C F2 06 CD 92 E8 69 56 49 05 CE 21 D7 20 F9 71 " +
                    "B7 AE A3 74 83 0E BE 17 57 11 5A 85 E0 88 D4 1C " +
                    "6B 77 CF 5E C8 21 F3 0B 1D 89 04 17 BF 2F A3 1E " +
                    "59 08 DE D5 FA 67 7F 8C 7B 18 4A D0 90 28 FD DE " +
                    "96 B6 A6 10 98 50 AA 80 01 75 EA BC DB BB 68 4A " +
                    "96 C2 EB 63 79 DF EA 08 D3 2F E2 33 1F E1 03 23 " +
                    "3A D5 8D CD B1 E6 E0 77 CB 9F 24 EA EC 5C 25 AF",
            "EE B0 DD 9B 24 77 BE E3 20 9A 91 4C DB A9 4C 1C 4A 9B DE D9",
            "01 00 01"
    );

    public static final EmvKeyDTO  TEST_KEY29 = new EmvKeyDTO(
            "A0 00 00 00 04",
            "F8",
            "A1 F5 E1 C9 BD 86 50 BD 43 AB 6E E5 6B 89 1E F7 " +
                    "45 9C 0A 24 FA 84 F9 12 7D 1A 6C 79 D4 93 0F 6D " +
                    "B1 85 2E 25 10 F1 8B 61 CD 35 4D B8 3A 35 6B D1 " +
                    "90 B8 8A B8 DF 04 28 4D 02 A4 20 4A 7B 6C B7 C5 " +
                    "55 19 77 A9 B3 63 79 CA 3D E1 A0 8E 69 F3 01 C9 " +
                    "5C C1 C2 05 06 95 92 75 F4 17 23 DD 5D 29 25 29 " +
                    "05 79 E5 A9 5B 0D F6 32 3F C8 E9 27 3D 6F 84 91 " +
                    "98 C4 99 62 09 16 6D 9B FC 97 3C 36 1C C8 26 E1 ",
            "F0 6E CC 6D 2A AE BF 25 9B 7E 75 5A 38 D9 A9 B2 4E 2F F3 DD",
            "03"
    );

    public static final EmvKeyDTO  TEST_KEY30 = new EmvKeyDTO(
            "A0 00 00 00 04",
            "F9",
            "A9 9A 6D 3E 07 18 89 ED 9E 3A 0C 39 1C 69 B0 B8 " +
                    "04 FC 16 0B 2B 4B DD 57 0C 92 DD 5A 0F 45 F5 3E " +
                    "86 21 F7 C9 6C 40 22 42 66 73 5E 1E E1 B3 C0 62 " +
                    "38 AE 35 04 63 20 FD 8E 81 F8 CE B3 F8 B4 C9 7B " +
                    "94 09 30 A3 AC 5E 79 00 86 DA D4 1A 6A 4F 51 17 " +
                    "BA 1C E2 43 8A 51 AC 05 3E B0 02 AE D8 66 D2 C4 " +
                    "58 FD 73 35 90 21 A1 20 29 A0 C0 43 04 5C 11 66 " +
                    "4F E0 21 9E C6 3C 10 BF 21 55 BB 27 84 60 9A 10 " +
                    "64 21 D4 51 63 79 97 38 C1 C3 09 09 BB 6C 6F E5 " +
                    "2B BB 76 39 7B 97 40 CE 06 4A 61 3F F8 41 11 85 " +
                    "F0 88 42 A4 23 EA D2 0E DF FB FF 1C D6 C3 FE 0C " +
                    "98 21 47 91 99 C2 6D 85 72 CC 8A FF F0 87 A9 C3 ",
            "33 67 12 DC C2 85 54 80 9C 6A A9 B0 23 58 DE 6F 75 51 64 DB",
            "03"
    );

    public static final EmvKeyDTO  TEST_KEY31 = new EmvKeyDTO(
            "A0 00 00 00 04",
            "FA",
            "A9 0F CD 55 AA 2D 5D 99 63 E3 5E D0 F4 40 17 76 " +
                    "99 83 2F 49 C6 BA B1 5C DA E5 79 4B E9 3F 93 4D " +
                    "44 62 D5 D1 27 62 E4 8C 38 BA 83 D8 44 5D EA A7 " +
                    "41 95 A3 01 A1 02 B2 F1 14 EA DA 0D 18 0E E5 E7 " +
                    "A5 C7 3E 0C 4E 11 F6 7A 43 DD AB 5D 55 68 3B 14 " +
                    "74 CC 06 27 F4 4B 8D 30 88 A4 92 FF AA DA D4 F4 " +
                    "24 22 D0 E7 01 35 36 C3 C4 9A D3 D0 FA E9 64 59 " +
                    "B0 F6 B1 B6 05 65 38 A3 D6 D4 46 40 F9 44 67 B1 " +
                    "08 86 7D EC 40 FA AE CD 74 0C 00 E2 B7 A8 85 2D ",
            "5B ED 40 68 D9 6E A1 6D 2D 77 E0 3D 60 36 FC 7A 16 0E A9 9C",
            "03"
    );

    public static final EmvKeyDTO  TEST_KEY32 = new EmvKeyDTO(
            "A0 00 00 00 04",
            "FB",
            "A9 54 8D FB 39 8B 48 12 3F AF 41 E6 CF A4 AE " +
                    "1E 23 52 B5 18 AB 4B CE FE CD B0 B3 ED EC 09 " +
                    "02 87 D8 8B 12 25 9F 36 1C 1C C0 88 E5 F0 66 " +
                    "49 44 17 E8 EE 8B BF 89 91 E2 B3 2F F1 6F 99 " +
                    "46 97 84 2B 3D 6C B3 7A 2B B5 74 2A 44 0B 63 " +
                    "56 C6 2A A3 3D B3 C4 55 E5 9E DD F7 86 47 01 " +
                    "D0 3A 5B 83 EE 9E 9B D8 3A B9 33 02 AC 2D FE " +
                    "63 E6 61 20 B0 51 CF 08 1F 56 32 6A 71 30 3D " +
                    "95 2B B3 36 FF 12 61 0D ",
            "A5 4C B4 AE C9 BD 9D 4F 57 97 56 A2 B9 E0 9C DB 49 E4 77 E8",
            "02"
    );

    public static final EmvKeyDTO  TEST_KEY33 = new EmvKeyDTO(
            "A0 00 00 00 04",
            "FC",
            "B3 7B FD 2A 96 74 AD 62 21 C1 A0 01 08 1C 62 " +
                    "65 3D C2 80 B0 A9 BD 05 2C 67 7C 91 3C E7 A0 " +
                    "D9 02 E7 7B 12 F4 D4 D7 90 37 B1 E9 B9 23 A8 " +
                    "BB 3F AC 3C 61 20 45 BB 39 14 F8 DF 41 E9 A1 " +
                    "B6 1B FA 5B 41 70 5A 69 1D 09 CE 6F 53 0F E4 " +
                    "8B 30 24 0D 98 F4 E6 92 FF D6 AA DB 87 24 3B " +
                    "A8 59 7A B2 37 58 6E CF 25 8F 41 48 75 1B E5 " +
                    "DA 5A 3B E6 CC 34 BD",
            "74 75 55 21 F6 0C AC F9 D2 0E 75 99 57 D2 41 E1 2B E0 C9 57",
            "02"
    );

    public static final EmvKeyDTO  TEST_KEY34 = new EmvKeyDTO(
            "A0 00 00 00 04",
            "FD",
            "B3 57 2B A4 9A E4 C7 B7 A0 01 9E 51 89 E1 42 " +
                    "CF CD ED 94 98 DD B5 F0 47 05 67 AB 0B A7 13 " +
                    "B8 DA 22 64 24 62 29 55 B5 4B 93 7A BF EF AA " +
                    "D9 79 19 E3 77 62 1E 22 19 6A BC 14 19 D5 AD " +
                    "C1 23 48 42 09 EA 7C B7 02 9E 66 A0 D5 4C 5B " +
                    "45 C8 AD 61 5A ED B6 AE 9E 0A 2F 75 31 0E A8 " +
                    "96 12 87 24 12 45",
            "62 31 89 46 5E 31 48 DD 2A C2 8E 19 34 91 58 03 AD 9A 60 E4",
            "02"
    );

    public static final EmvKeyDTO  TEST_KEY35 = new EmvKeyDTO(
            "A0 00 00 00 04",
            "FE",
            "A6 53 EA C1 C0 F7 86 C8 72 4F 73 7F 17 29 97 D6 " +
                    "3D 1C 32 51 C4 44 02 04 9B 86 5B AE 87 7D 0F 39 " +
                    "8C BF BE 8A 60 35 E2 4A FA 08 6B EF DE 93 51 E5 " +
                    "4B 95 70 8E E6 72 F0 96 8B CD 50 DC E4 0F 78 33 " +
                    "22 B2 AB A0 4E F1 37 EF 18 AB F0 3C 7D BC 58 13 " +
                    "AE AE F3 AA 77 97 BA 15 DF 7D 5B A1 CB AF 7F D5 " +
                    "20 B5 A4 82 D8 D3 FE E1 05 07 78 71 11 3E 23 A4 " +
                    "9A F3 92 65 54 A7 0F E1 0E D7 28 CF 79 3B 62 A1",
            "9A 29 5B 05 FB 39 0E F7 92 3F 57 61 8A 9F DA 29 41 FC 34 E0",
            "03"
    );

    public static final EmvKeyDTO  TEST_KEY36 = new EmvKeyDTO(
            "A0 00 00 00 04",
            "FF",
            "B8 55 CC 64 31 3A F9 9C 45 3D 18 16 42 EE 7D " +
                    "D2 1A 67 D0 FF 50 C6 1F E2 13 BC DC 18 AF BC " +
                    "D0 77 22 EF DD 25 94 EF DC 22 7D A3 DA 23 AD " +
                    "CC 90 E3 FA 90 74 53 AC C9 54 C4 73 23 BE DC " +
                    "F8 D4 86 2C 45 7D 25 F4 7B 16 D7 C3 50 2B E0 " +
                    "81 91 3E 5B 04 82 D8 38 48 40 65 DA 5F 66 59 " +
                    "E0 0A 9E 5D 57 0A DA 1E C6 AF 8C 57 96 00 75 " +
                    "11 95 81 FC 81 46 8D",
            "B4 E7 69 CE CF 7A AC 47 83 F3 05 E0 B1 10 60 2A 07 A6 35 5B",
            "01 00 01"
    );

    public static final EmvKeyDTO  TEST_KEY37 = new EmvKeyDTO(
            "A0 00 00 02 27",
            "40",
            "F8 02 C3 08 54 48 73 AD 22 25 A8 19 43 73 2A 4B " +
                    "7C FF A4 E3 15 7D 17 CD 5A 77 23 F8 58 F0 B1 1E " +
                    "63 6D 29 30 FA 93 37 78 F2 7C 7C 49 12 7E 0C CA " +
                    "31 70 21 CF E8 E0 F7 73 78 5E B3 FF 07 58 7E 98 " +
                    "CE 8E D4 FE 9E 1C A1 85 9F 41 A9 CF 25 72 D8 A0 " +
                    "93 C5 46 5F 5A 29 61 2A 45 B1 70 0F 4D A1 38 14 " +
                    "C3 D4 DF 07 5E AA DE 8D B4 BE 4D 7B 3A E0 25 6F " +
                    "7A 0C 12 E3 4B D4 16 CA C4 F9 25 0C 38 B7 E1 3B",
            "20 15 49 7B E4 B8 6F 10 4B BF 33 76 91 82 5E ED 64 E1 01 CA",
            "03"
    );

    public static final EmvKeyDTO  TEST_KEY38 = new EmvKeyDTO(
            "A0 00 00 00 25",
            "97",
            "E1 78 FF E8 34 B4 B7 67 AF 3C 9A 51 1F 97 3D 8E " +
                    "85 05 C5 FC B2 D3 76 80 75 AB 7C C9 46 A9 55 78 " +
                    "99 55 87 9A AF 73 74 07 15 15 21 99 6D FA 43 C5 " +
                    "8E 6B 13 0E B1 D8 63 B8 5D C9 FF B4 05 09 47 A2 " +
                    "67 6A A6 A0 61 A4 A7 AE 1E DB 0E 36 A6 97 E8 7E " +
                    "03 75 17 EB 89 23 13 68 75 BA 2C A1 08 7C BA 7E " +
                    "C7 65 3E 5E 28 A0 C2 61 A0 33 AF 27 E3 A6 7B 64 " +
                    "BB A2 69 56 30 7E C4 7E 67 4E 3F 8B 72 2B 3A E0 " +
                    "49 8D B1 6C 79 85 31 0D 9F 3D 11 73 00 D3 2B 09 "
            ,
            "EB DA 52 2B 63 1B 3E B4 F4 CB FC 06 79 C4 50 13 9D 2B 69 CD",
            "03"
    );




    /**Prod*/
    public static final EmvKeyDTO  prod_k1 = new EmvKeyDTO(
            "",
            "",
            "",
            "",
            "");

}
