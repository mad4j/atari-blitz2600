
; *****************************************************
    bank 1
    temp1 = temp1

;  Standard used in North America and most of South America.
    set tv ntsc

;  This program uses the DPC+ kernel.
    set kernel DPC+
    set smartbranching on
    set optimization inlinerand
    set kernel_options collision(playfield, player1) 

; DEFINE VARS HERE

; Sets starting position of player0.
    player0x = 77 : player0y = 150
    NUSIZ0 = $03
    
; Defines shape of Player0 sprite.
    player0:
    %01000000
    %00010100
    %10110000
    %00000010
    %10100000
    %11011011
    %01111110
    %00111100
end

; Degine player0 colors
    player0color:
    $00
    $00
    $00
    $00
    $00
    $00
    $00
    $00
end    
    
    goto __Start_Restart bank2

; *****************************************************
    bank 2 
    temp1 = temp1

__Start_Restart

 gosub set_pf

__Main_Loop
 ; setup DPC+ Playfield @ 44 rows
 DF0FRACINC = 64   ; column 0 resolution
 DF1FRACINC = 64   ; column 1 resolution
 DF2FRACINC = 64   ; column 2 resolution
 DF3FRACINC = 64   ; column 3 resolution

 DF4FRACINC = 0    ; playfield colors
 DF6FRACINC = 0    ; background colors

 drawscreen
 
 goto __Main_Loop

set_pf

 pfcolors:
 $0E
end

 bkcolors:
 $00
end
 
    for temp1 = 0 to 31 step 2
        temp2 = (rand&31)+10
        temp3 = temp1 + 1
        pfvline temp1 temp2 43 on
        pfvline temp3 temp2 43 on
    next

    return thisbank



 ; *****************************************************
 bank 3
 temp1 = temp1

 ; *****************************************************
 bank 4
 temp1 = temp1

 ; *****************************************************
 bank 5
 temp1 = temp1

 ; *****************************************************
 bank 6
 temp1 = temp1
