
CHAN_OPEN   equ  5633
PRINT       equ  8252

            org  0x5ccb
            
loop
            ld   a, 2                ; 3E 02
            call CHAN_OPEN           ; CD 01 16
            ld   de, text            ; 11 0E 7F
            ld   bc, textend-text    ; 01 0E 00
            call PRINT               ; C3 3C 20
            ld	 a, 0xFF
            ld   (0x4000), a
            ld	 (0x4001), a
            ld (0x4010),a
            ld (0x4011),a
            ld (0x4020),a
            ld (0x4021),a
            ret

text        defb 'Hello, World!'     ; 48 65 6C 6C 6F 2C 20 57
                                     ; 6F 72 6C 64 21
            defb 13                  ; 0D
textend

	org 0xff57
        defb 00h
