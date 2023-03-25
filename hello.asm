
CHAN_OPEN   equ  5633
PRINT       equ  8252

            org  0x5ccb
    
init
	    ld a, 0x00
loop
            ;ld   a, 2                ; 3E 02
            ;call CHAN_OPEN           ; CD 01 16
            ;ld   de, text           ; 11 0E 7F
            ;ld   bc, textend-text    ; 01 0E 00
            ;call PRINT               ; C3 3C 20

            ld bc, 0x4000
            ld hl, sprite_1
            
            ld d, a
            push de ; сохраняем текущее состояние цикла в стеке
            ld a, (hl)
            ld (bc), a
            inc hl
            inc bc
            ld a, (hl)
            ld (bc), a
            
            
            pop de
            ld a, d ; восстанавливаем текущее состояние цикла
            inc a
            cp a, 0x20
            jr nz, loop
            
            
            ret

sprite_1 
	    defb 0x7F, 0xFC
            defb 0xC0, 0x06
            defb 0x84, 0x12
            defb 0x8E, 0x2A
            defb 0x8E, 0x12
            defb 0x8E, 0x02
            defb 0x8E, 0x12
            defb 0x84, 0x2A
            defb 0x84, 0x12
            defb 0x80, 0x02
            defb 0x84, 0x12
            defb 0x8E, 0x2A
            defb 0x84, 0x12
            defb 0xC0, 0x06
            defb 0x7F, 0xFC
            defb 0x00, 0x00

text        defb 'Hello, World!'     ; 48 65 6C 6C 6F 2C 20 57
                                     ; 6F 72 6C 64 21
            defb 13                  ; 0D
            
textend
	org 0xff57
        defb 00h
