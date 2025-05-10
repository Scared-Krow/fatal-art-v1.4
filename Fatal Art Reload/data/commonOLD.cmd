[Command]
name = "x"
command = x
time = 1
[Command]
name = "y"
command = y
time = 1
[Command]
name = "z"
command = z
time = 1
[Command]
name = "a"
command = a
time = 1
[Command]
name = "b"
command = b
time = 1
[Command]
name = "c"
command = c
time = 1
[Command]
name = "s"
command = s
time = 1
[Command]
name = "d"
command = d
time = 1
[Command]
name = "w"
command = w
time = 1
[Command]
name = "m"
command = m
time = 1

;===================================
; BUFFER BUTTON
;===================================
[Command]
name = "x_"
command = x
time = 8
buffer.time = 8
[Command]
name = "y_"
command = y
time = 8
buffer.time = 8
[Command]
name = "z_"
command = z
time = 8
buffer.time = 8
[Command]
name = "a_"
command = a
time = 8
buffer.time = 8
[Command]
name = "b_"
command = b
time = 8
buffer.time = 8
[Command]
name = "c_"
command = c
time = 8
buffer.time = 8

;===================================
; HOLD BUTTON
;===================================
[Command]
name = "holdfwd"
command = /$F
time = 1
[Command]
name = "holdback"
command = /$B
time = 1
[Command]
name = "holdup"
command = /$U
time = 1
[Command]
name = "holddown"
command = /$D
time = 1
[Command]
name = "holdx"
command = /x
time = 1
[Command]
name = "holdy"
command = /y
time = 1
[Command]
name = "holdz"
command = /z
time = 1
[Command]
name = "holda"
command = /a
time = 1
[Command]
name = "holdb"
command = /b
time = 1
[Command]
name = "holdc"
command = /c
time = 1
[Command]
name = "holds"
command = /s
time = 1

;===================================
; RECOVERY
;===================================
[Command]
name = "recovery"
command = /a
time = 4
[Command]
name = "recovery"
command = /b
time = 4
[Command]
name = "recovery"
command = /c
time = 4
[Command]
name = "recovery"
command = /x
time = 4
[Command]
name = "recovery"
command = /y
time = 4
[Command]
name = "recovery"
command = /z
time = 4

;===================================
; DOUBLE BUTTON
;===================================
[Command]
name = "xa"
command = x+a
time = 2
[Command]
name = "xa"
command = x,a
time = 2
[Command]
name = "yb"
command = y+b
time = 2
[Command]
name = "yb"
command = y,b
time = 2
[Command]
name = "lucid"
command = x+b
time = 2
[Command]
name = "lucid"
command = x,b
time = 2
[Command]
name = "lucid"
command = y+a
time = 2
[Command]
name = "lucid"
command = y,a
time = 2
[Command]
name = "lucid"
command = w
time = 2
[Command]
name = "lucid"
command = d
time = 2

;===========
; DOUBLE TAP
;===========
[Command]
name = "FF"
command = F, F
time = 10
[Command]
name = "BB"
command = B, B
time = 10

;==========================================
; 360 DOUBLE PUNCH
;==========================================
[Command]
name = "360_2p"
command = ~D, B, U, F, x+y
time = 48
buffer.time = 8
[Command]
name = "360_2p"
command = ~B, U, F, D, x+y
time = 48
buffer.time = 8
[Command]
name = "360_2p"
command = ~U, F, D, B, x+y
time = 48
buffer.time = 8
[Command]
name = "360_2p"
command = ~F, D, B, U, x+y
time = 48
buffer.time = 8
[Command]
name = "360_2p"
command = ~D, F, U, B, x+y
time = 48
buffer.time = 8
[Command]
name = "360_2p"
command = ~F, U, B, D, x+y
time = 48
buffer.time = 8
[Command]
name = "360_2p"
command = ~U, B, D, F, x+y
time = 48
buffer.time = 8
[Command]
name = "360_2p"
command = ~B, D, F, U, x+y
time = 48
buffer.time = 8

;==========================================
; 360 DOUBLE KICK
;==========================================
[Command]
name = "360_2k"
command = ~D, B, U, F, a+b
time = 48
buffer.time = 8
[Command]
name = "360_2k"
command = ~B, U, F, D, a+b
time = 48
buffer.time = 8
[Command]
name = "360_2k"
command = ~U, F, D, B, a+b
time = 48
buffer.time = 8
[Command]
name = "360_2k"
command = ~F, D, B, U, a+b
time = 48
buffer.time = 8
[Command]
name = "360_2k"
command = ~D, F, U, B, a+b
time = 48
buffer.time = 8
[Command]
name = "360_2k"
command = ~F, U, B, D, a+b
time = 48
buffer.time = 8
[Command]
name = "360_2k"
command = ~U, B, D, F, a+b
time = 48
buffer.time = 8
[Command]
name = "360_2k"
command = ~B, D, F, U, a+b
time = 48
buffer.time = 8

;==========================================
; DOWN-BACK-DOWN-FORWARD DOUBLE PUNCH
;==========================================
[Command]
name = "DBDF_2p"
command = D, ~B, D, F, x+y
time = 28
buffer.time = 8
[Command]
name = "DBDF_2p"
command = D, ~B, D, F, x, y
time = 28
buffer.time = 8
[Command]
name = "DBDF_2p"
command = D, ~B, D, F, y, x
time = 28
buffer.time = 8

;==========================================
; DOWN-BACK-DOWN-FORWARD DOUBLE KICK
;==========================================
[Command]
name = "DBDF_2k"
command = D, ~B, D, F, a+b
time = 28
buffer.time = 8
[Command]
name = "DBDF_2k"
command = D, ~B, D, F, a, b
time = 28
buffer.time = 8
[Command]
name = "DBDF_2k"
command = D, ~B, D, F, b, a
time = 28
buffer.time = 8

;==========================================
; TRIPLE DOWN DOUBLE BUTTON
;==========================================
[Command]
name = "ddd_2p"
command = ~D, D, D, x+y
time = 40
buffer.time = 8
[Command]
name = "ddd_2p"
command = ~D, D, D, x, y
time = 40
buffer.time = 8
[Command]
name = "ddd_2p"
command = ~D, D, D, y, x
time = 40
buffer.time = 8

[Command]
name = "ddd_2k"
command = ~D, D, D, a+b
time = 40
buffer.time = 8
[Command]
name = "ddd_2k"
command = ~D, D, D, a, b
time = 40
buffer.time = 8
[Command]
name = "ddd_2k"
command = ~D, D, D, b, a
time = 40
buffer.time = 8

;==========================================
; DOUBLE QUARTER CIRCLE FORWARD DOUBLE PUNCH
;==========================================
[Command]
name = "2QCF_2p"
command = ~D, F, D, F, x+y
time = 24
buffer.time = 8
[Command]
name = "2QCF_2p"
command = D, F, D, F, x+y
time = 24
buffer.time = 8
[Command]
name = "2QCF_2p"
command = ~D, F, D, F, x, y
time = 24
buffer.time = 8
[Command]
name = "2QCF_2p"
command = D, F, D, F, x, y
time = 24
buffer.time = 8
[Command]
name = "2QCF_2p"
command = ~D, F, D, F, y, x
time = 24
buffer.time = 8
[Command]
name = "2QCF_2p"
command = D, F, D, F, y, x
time = 24
buffer.time = 8

;==========================================
; DOUBLE QUARTER CIRCLE FORWARD DOUBLE KICK
;==========================================
[Command]
name = "2QCF_2k"
command = ~D, F, D, F, a+b
time = 24
buffer.time = 8
[Command]
name = "2QCF_2k"
command = D, F, D, F, a+b
time = 24
buffer.time = 8
[Command]
name = "2QCF_2k"
command = ~D, F, D, F, a, b
time = 24
buffer.time = 8
[Command]
name = "2QCF_2k"
command = D, F, D, F, a, b
time = 24
buffer.time = 8
[Command]
name = "2QCF_2k"
command = ~D, F, D, F, b, a
time = 24
buffer.time = 8
[Command]
name = "2QCF_2k"
command = D, F, D, F, b, a
time = 24
buffer.time = 8

;==========================================
; DOUBLE QUARTER CIRCLE BACK DOUBLE PUNCH
;==========================================
[Command]
name = "2QCB_2p"
command = ~D, B, D, B, x+y
time = 24
buffer.time = 8
[Command]
name = "2QCB_2p"
command = D, B, D, B, x+y
time = 24
buffer.time = 8
[Command]
name = "2QCB_2p"
command = ~D, B, D, B, x, y
time = 24
buffer.time = 8
[Command]
name = "2QCB_2p"
command = D, B, D, B, x, y
time = 24
buffer.time = 8
[Command]
name = "2QCB_2p"
command = ~D, B, D, B, y, x
time = 24
buffer.time = 8
[Command]
name = "2QCB_2p"
command = D, B, D, B, y, x
time = 24
buffer.time = 8

;==========================================
; DOUBLE QUARTER CIRCLE BACK DOUBLE KICK
;==========================================
[Command]
name = "2QCB_2k"
command = ~D, B, D, B, a+b
time = 24
buffer.time = 8
[Command]
name = "2QCB_2k"
command = D, B, D, B, a+b
time = 24
buffer.time = 8
[Command]
name = "2QCB_2k"
command = ~D, B, D, B, a, b
time = 24
buffer.time = 8
[Command]
name = "2QCB_2k"
command = D, B, D, B, a, b
time = 24
buffer.time = 8
[Command]
name = "2QCB_2k"
command = ~D, B, D, B, b, a
time = 24
buffer.time = 8
[Command]
name = "2QCB_2k"
command = D, B, D, B, b, a
time = 24
buffer.time = 8

;===================================
; DOUBLE QUARTER CIRCLE FORWARD PUNCH
;===================================
[Command]
name = "2QCF_x"
command = ~D, F, D, F, x
time = 24
buffer.time = 8
[Command]
name = "2QCF_x"
command = D, F, D, F, x
time = 24
buffer.time = 8
[Command]
name = "2QCF_y"
command = ~D, F, D, F, y
time = 24
buffer.time = 8
[Command]
name = "2QCF_y"
command = D, F, D, F, y
time = 24
buffer.time = 8

;===================================
; DOUBLE QUARTER CIRCLE FORWARD KICK
;===================================
[Command]
name = "2QCF_a"
command = ~D, F, D, F, a
time = 24
buffer.time = 8
[Command]
name = "2QCF_a"
command = D, F, D, F, a
time = 24
buffer.time = 8
[Command]
name = "2QCF_b"
command = ~D, F, D, F, b
time = 24
buffer.time = 8
[Command]
name = "2QCF_b"
command = D, F, D, F, b
time = 24
buffer.time = 8

;===================================
; DOUBLE QUARTER CIRCLE BACK PUNCH
;===================================
[Command]
name = "2QCB_x"
command = ~D, B, D, B, x
time = 24
buffer.time = 8
[Command]
name = "2QCB_x"
command = D, B, D, B, x
time = 24
buffer.time = 8
[Command]
name = "2QCB_y"
command = ~D, B, D, B, y
time = 24
buffer.time = 8
[Command]
name = "2QCB_y"
command = D, B, D, B, y
time = 24
buffer.time = 8

;===================================
; DOUBLE QUARTER CIRCLE BACK KICK
;===================================
[Command]
name = "2QCB_a"
command = ~D, B, D, B, a
time = 24
buffer.time = 8
[Command]
name = "2QCB_a"
command = D, B, D, B, a
time = 24
buffer.time = 8
[Command]
name = "2QCB_b"
command = ~D, B, D, B, b
time = 24
buffer.time = 8
[Command]
name = "2QCB_b"
command = D, B, D, B, b
time = 24
buffer.time = 8

;===================================
; 360 PUNCH
;===================================
[Command]
name = "360_x"
command = ~D, ~B, U, F, x
time = 48
buffer.time = 8
[Command]
name = "360_x"
command = ~B, ~U, F, D, x
time = 48
buffer.time = 8
[Command]
name = "360_x"
command = ~U, ~F, D, B, x
time = 48
buffer.time = 8
[Command]
name = "360_x"
command = ~F, ~D, B, U, x
time = 48
buffer.time = 8
[Command]
name = "360_x"
command = ~D, ~F, U, B, x
time = 48
buffer.time = 8
[Command]
name = "360_x"
command = ~F, ~U, B, D, x
time = 48
buffer.time = 8
[Command]
name = "360_x"
command = ~U, ~B, D, F, x
time = 48
buffer.time = 8
[Command]
name = "360_x"
command = ~B, ~D, F, U, x
time = 48
buffer.time = 8
[Command]
name = "360_y"
command = ~D, ~B, U, F, y
time = 48
buffer.time = 8
[Command]
name = "360_y"
command = ~B, ~U, F, D, y
time = 48
buffer.time = 8
[Command]
name = "360_y"
command = ~U, ~F, D, B, y
time = 48
buffer.time = 8
[Command]
name = "360_y"
command = ~F, ~D, B, U, y
time = 48
buffer.time = 8
[Command]
name = "360_y"
command = ~D, ~F, U, B, y
time = 48
buffer.time = 8
[Command]
name = "360_y"
command = ~F, ~U, B, D, y
time = 48
buffer.time = 8
[Command]
name = "360_y"
command = ~U, ~B, D, F, y
time = 48
buffer.time = 8
[Command]
name = "360_y"
command = ~B, ~D, F, U, y
time = 48
buffer.time = 8

;===================================
; 360 KICK
;===================================
[Command]
name = "360_a"
command = ~D, ~B, U, F, a
time = 48
buffer.time = 8
[Command]
name = "360_a"
command = ~B, ~U, F, D, a
time = 48
buffer.time = 8
[Command]
name = "360_a"
command = ~U, ~F, D, B, a
time = 48
buffer.time = 8
[Command]
name = "360_a"
command = ~F, ~D, B, U, a
time = 48
buffer.time = 8
[Command]
name = "360_a"
command = ~D, ~F, U, B, a
time = 48
buffer.time = 8
[Command]
name = "360_a"
command = ~F, ~U, B, D, a
time = 48
buffer.time = 8
[Command]
name = "360_a"
command = ~U, ~B, D, F, a
time = 48
buffer.time = 8
[Command]
name = "360_a"
command = ~B, ~D, F, U, a
time = 48
buffer.time = 8
[Command]
name = "360_b"
command = ~D, ~B, U, F, b
time = 48
buffer.time = 8
[Command]
name = "360_b"
command = ~B, ~U, F, D, b
time = 48
buffer.time = 8
[Command]
name = "360_b"
command = ~U, ~F, D, B, b
time = 48
buffer.time = 8
[Command]
name = "360_b"
command = ~F, ~D, B, U, b
time = 48
buffer.time = 8
[Command]
name = "360_b"
command = ~D, ~F, U, B, b
time = 48
buffer.time = 8
[Command]
name = "360_b"
command = ~F, ~U, B, D, b
time = 48
buffer.time = 8
[Command]
name = "360_b"
command = ~U, ~B, D, F, b
time = 48
buffer.time = 8
[Command]
name = "360_b"
command = ~B, ~D, F, U, b
time = 48
buffer.time = 8

;===================================
; FORWARD BACK FORWARD
;===================================
[Command]
name = "FBF_x"
command = ~F, B, F, x
time = 20
buffer.time = 8
[Command]
name = "FBF_x"
command = F, B, F, x
time = 20
buffer.time = 8
[Command]
name = "FBF_y"
command = ~F, B, F, y
time = 20
buffer.time = 8
[Command]
name = "FBF_y"
command = F, B, F, y
time = 20
buffer.time = 8

;===================================
; HALF CIRCLE FORWARD DOUBLE PUNCH
;===================================
[Command]
name = "HCF_2p"
command = ~B, D, F, x+y
time = 24
buffer.time = 8
[Command]
name = "HCF_2p"
command = ~B, D, F, x, y
time = 24
buffer.time = 8
[Command]
name = "HCF_2p"
command = ~B, D, F, x, y
time = 24
buffer.time = 8
[Command]
name = "HCF_2p"
command = B, D, F, x+y
time = 24
buffer.time = 8
[Command]
name = "HCF_2p"
command = B, D, F, y, x
time = 24
buffer.time = 8
[Command]
name = "HCF_2p"
command = B, D, F, y, x
time = 24
buffer.time = 8

;===================================
; HALF CIRCLE FORWARD DOUBLE KICK
;===================================
[Command]
name = "HCF_2k"
command = ~B, D, F, a+b
time = 24
buffer.time = 8
[Command]
name = "HCF_2k"
command = ~B, D, F, a, b
time = 24
buffer.time = 8
[Command]
name = "HCF_2k"
command = ~B, D, F, a, b
time = 24
buffer.time = 8
[Command]
name = "HCF_2k"
command = B, D, F, a+b
time = 24
buffer.time = 8
[Command]
name = "HCF_2k"
command = B, D, F, b, a
time = 24
buffer.time = 8
[Command]
name = "HCF_2k"
command = B, D, F, b, a
time = 24
buffer.time = 8

;===================================
; HALF CIRCLE BACK DOUBLE PUNCH
;===================================
[Command]
name = "HCB_2p"
command = ~F, D, B, x+y
time = 24
buffer.time = 8
[Command]
name = "HCB_2p"
command = ~F, D, B, x, y
time = 24
buffer.time = 8
[Command]
name = "HCB_2p"
command = ~F, D, B, x, y
time = 24
buffer.time = 8
[Command]
name = "HCB_2p"
command = F, D, B, x+y
time = 24
buffer.time = 8
[Command]
name = "HCB_2p"
command = F, D, B, y, x
time = 24
buffer.time = 8
[Command]
name = "HCB_2p"
command = F, D, B, y, x
time = 24
buffer.time = 8

;===================================
; HALF CIRCLE BACK DOUBLE KICK
;===================================
[Command]
name = "HCB_2k"
command = ~F, D, B, a+b
time = 24
buffer.time = 8
[Command]
name = "HCB_2k"
command = ~F, D, B, a, b
time = 24
buffer.time = 8
[Command]
name = "HCB_2k"
command = ~F, D, B, a, b
time = 24
buffer.time = 8
[Command]
name = "HCB_2k"
command = F, D, B, a+b
time = 24
buffer.time = 8
[Command]
name = "HCB_2k"
command = F, D, B, b, a
time = 24
buffer.time = 8
[Command]
name = "HCB_2k"
command = F, D, B, b, a
time = 24
buffer.time = 8

;===================================
; HALF CIRCLE FORWARD PUNCH
;===================================
[Command]
name = "HCF_x"
command = ~B, D, F, x
time = 24
buffer.time = 8
[Command]
name = "HCF_x"
command = B, D, F, x
time = 24
buffer.time = 8
[Command]
name = "HCF_y"
command = ~B, D, F, y
time = 24
buffer.time = 8
[Command]
name = "HCF_y"
command = B, D, F, y
time = 24
buffer.time = 8

;===================================
; HALF CIRCLE FORWARD KICK
;===================================
[Command]
name = "HCF_a"
command = ~B, D, F, a
time = 24
buffer.time = 8
[Command]
name = "HCF_a"
command = B, D, F, a
time = 24
buffer.time = 8
[Command]
name = "HCF_b"
command = ~B, D, F, b
time = 24
buffer.time = 8
[Command]
name = "HCF_b"
command = B, D, F, b
time = 24
buffer.time = 8

;===================================
; HALF CIRCLE BACK PUNCH
;===================================
[Command]
name = "HCB_x"
command = ~F, D, B, x
time = 24
buffer.time = 8
[Command]
name = "HCB_x"
command = F, D, B, x
time = 24
buffer.time = 8
[Command]
name = "HCB_y"
command = ~F, D, B, y
time = 24
buffer.time = 8
[Command]
name = "HCB_y"
command = F, D, B, y
time = 24
buffer.time = 8

;===================================
; HALF CIRCLE BACK KICK
;===================================
[Command]
name = "HCB_a"
command = ~F, D, B, a
time = 24
buffer.time = 8
[Command]
name = "HCB_a"
command = F, D, B, a
time = 24
buffer.time = 8
[Command]
name = "HCB_b"
command = ~F, D, B, b
time = 24
buffer.time = 8
[Command]
name = "HCB_b"
command = F, D, B, b
time = 24
buffer.time = 8

;===================================
; UPPERCUT FORWARD DOUBLE PUNCH
;===================================
[Command]
name = "DP_2p"
command = F, D, DF, x+y
time = 16
buffer.time = 8
[Command]
name = "DP_2p"
command = F, D, DF, x, y
time = 16
buffer.time = 8
[Command]
name = "DP_2p"
command = F, D, DF, y, x
time = 16
buffer.time = 8

[Command]
name = "DP_2p"
command = F, D, F, x+y
time = 12
buffer.time = 8
[Command]
name = "DP_2p"
command = F, D, F, x, y
time = 12
buffer.time = 8
[Command]
name = "DP_2p"
command = F, D, F, y, x
time = 12
buffer.time = 8

;===================================
; UPPERCUT FORWARD DOUBLE KICK
;===================================
[Command]
name = "DP_2k"
command = F, D, DF, a+b
time = 16
buffer.time = 8
[Command]
name = "DP_2k"
command = F, D, DF, a, b
time = 16
buffer.time = 8
[Command]
name = "DP_2k"
command = F, D, DF, b, a
time = 16
buffer.time = 8

[Command]
name = "DP_2k"
command = F, D, F, a+b
time = 12
buffer.time = 8
[Command]
name = "DP_2k"
command = F, D, F, a, b
time = 12
buffer.time = 8
[Command]
name = "DP_2k"
command = F, D, F, b, a
time = 12
buffer.time = 8

;===================================
; UPPERCUT REVERSE DOUBLE PUNCH
;===================================
[Command]
name = "rDP_2p"
command = B, D, DF, x+y
time = 16
buffer.time = 8
[Command]
name = "rDP_2p"
command = B, D, DF, x, y
time = 16
buffer.time = 8
[Command]
name = "rDP_2p"
command = B, D, DF, y, x
time = 16
buffer.time = 8

[Command]
name = "rDP_2p"
command = B, D, F, x+y
time = 12
buffer.time = 8
[Command]
name = "rDP_2p"
command = B, D, F, x, y
time = 12
buffer.time = 8
[Command]
name = "rDP_2p"
command = B, D, F, y, x
time = 12
buffer.time = 8

;===================================
; UPPERCUT REVERSE DOUBLE KICK
;===================================
[Command]
name = "rDP_2k"
command = B, D, DB, a+b
time = 16
buffer.time = 8
[Command]
name = "rDP_2k"
command = B, D, DB, a, b
time = 16
buffer.time = 8
[Command]
name = "rDP_2k"
command = B, D, DB, b, a
time = 16
buffer.time = 8

[Command]
name = "rDP_2k"
command = B, D, B, a+b
time = 12
buffer.time = 8
[Command]
name = "rDP_2k"
command = B, D, B, a, b
time = 12
buffer.time = 8
[Command]
name = "rDP_2k"
command = B, D, B, b, a
time = 12
buffer.time = 8

;===================================
; UPPERCUT FORWARD PUNCH
;===================================
[Command]
name = "DP_x"
command = F, D, DF, x
time = 16
buffer.time = 8
[Command]
name = "DP_y"
command = F, D, DF, y
time = 16
buffer.time = 8

[Command]
name = "DP_x"
command = F, D, F, x
time = 12
buffer.time = 8
[Command]
name = "DP_y"
command = F, D, F, y
time = 12
buffer.time = 8

;===================================
; UPPERCUT FORWARD KICK
;===================================
[Command]
name = "DP_a"
command = F, D, DF, a
time = 16
buffer.time = 8
[Command]
name = "DP_b"
command = F, D, DF, b
time = 16
buffer.time = 8

[Command]
name = "DP_a"
command = F, D, F, a
time = 12
buffer.time = 8
[Command]
name = "DP_b"
command = F, D, F, b
time = 12
buffer.time = 8

;===================================
; UPPERCUT REVERSE PUNCH
;===================================
[Command]
name = "rDP_x"
command = B, D, DB, x
time = 16
buffer.time = 8
[Command]
name = "rDP_y"
command = B, D, DB, y
time = 16
buffer.time = 8

[Command]
name = "rDP_x"
command = B, D, B, x
time = 12
buffer.time = 8
[Command]
name = "rDP_y"
command = B, D, B, y
time = 12
buffer.time = 8

;===================================
; UPPERCUT REVERSE KICK
;===================================
[Command]
name = "rDP_a"
command = B, D, DB, a
time = 16
buffer.time = 8
[Command]
name = "rDP_b"
command = B, D, DB, b
time = 16
buffer.time = 8

[Command]
name = "rDP_a"
command = B, D, B, a
time = 12
buffer.time = 8
[Command]
name = "rDP_b"
command = B, D, B, b
time = 12
buffer.time = 8

;===================================
; QUARTER CIRCLE FORWARD DOUBLE PUNCH
;===================================
[Command]
name = "QCF_2p"
command = ~D, F, x+y
time = 16
buffer.time = 8
[Command]
name = "QCF_2p"
command = D, F, x+y
time = 16
buffer.time = 8
[Command]
name = "QCF_2p"
command = ~D, F, x, y
time = 16
buffer.time = 8
[Command]
name = "QCF_2p"
command = D, F, x, y
time = 16
buffer.time = 8
[Command]
name = "QCF_2p"
command = ~D, F, y, x
time = 16
buffer.time = 8
[Command]
name = "QCF_2p"
command = D, F, y, x
time = 16
buffer.time = 8

;===================================
; QUARTER CIRCLE FORWARD DOUBLE KICK
;===================================
[Command]
name = "QCF_2k"
command = ~D, F, a+b
time = 16
buffer.time = 8
[Command]
name = "QCF_2k"
command = D, F, a+b
time = 16
buffer.time = 8
[Command]
name = "QCF_2k"
command = ~D, F, a, b
time = 16
buffer.time = 8
[Command]
name = "QCF_2k"
command = D, F, a, b
time = 16
buffer.time = 8
[Command]
name = "QCF_2k"
command = ~D, F, b, a
time = 16
buffer.time = 8
[Command]
name = "QCF_2k"
command = D, F, b, a
time = 16
buffer.time = 8

;===================================
; QUARTER CIRCLE BACK DOUBLE PUNCH
;===================================
[Command]
name = "QCB_2p"
command = ~D, B, x+y
time = 16
buffer.time = 8
[Command]
name = "QCB_2p"
command = D, B, x+y
time = 16
buffer.time = 8
[Command]
name = "QCB_2p"
command = ~D, B, x, y
time = 16
buffer.time = 8
[Command]
name = "QCB_2p"
command = D, B, x, y
time = 16
buffer.time = 8
[Command]
name = "QCB_2p"
command = ~D, B, y, x
time = 16
buffer.time = 8
[Command]
name = "QCB_2p"
command = D, B, y, x
time = 16
buffer.time = 8

;===================================
; QUARTER CIRCLE BACK DOUBLE KICK
;===================================
[Command]
name = "QCB_2k"
command = ~D, B, a+b
time = 16
buffer.time = 8
[Command]
name = "QCB_2k"
command = D, B, a+b
time = 16
buffer.time = 8
[Command]
name = "QCB_2k"
command = ~D, B, a, b
time = 16
buffer.time = 8
[Command]
name = "QCB_2k"
command = D, B, a, b
time = 16
buffer.time = 8
[Command]
name = "QCB_2k"
command = ~D, B, b, a
time = 16
buffer.time = 8
[Command]
name = "QCB_2k"
command = D, B, b, a
time = 16
buffer.time = 8

;===================================
; QUARTER CIRCLE FORWARD PUNCH
;===================================
[Command]
name = "QCF_x"
command = ~D, F, x
time = 16
buffer.time = 8
[Command]
name = "QCF_x"
command = D, F, x
time = 16
buffer.time = 8
[Command]
name = "QCF_y"
command = ~D, F, y
time = 16
buffer.time = 8
[Command]
name = "QCF_y"
command = D, F, y
time = 16
buffer.time = 8

;===================================
; QUARTER CIRCLE FORWARD KICK
;===================================
[Command]
name = "QCF_a"
command = ~D, F, a
time = 16
buffer.time = 8
[Command]
name = "QCF_a"
command = D, F, a
time = 16
buffer.time = 8
[Command]
name = "QCF_b"
command = ~D, F, b
time = 16
buffer.time = 8
[Command]
name = "QCF_b"
command = D, F, b
time = 16
buffer.time = 8

;===================================
; QUARTER CIRCLE BACK PUNCH
;===================================
[Command]
name = "QCB_x"
command = ~D, B, x
time = 16
buffer.time = 8
[Command]
name = "QCB_x"
command = D, B, x
time = 16
buffer.time = 8
[Command]
name = "QCB_y"
command = ~D, B, y
time = 16
buffer.time = 8
[Command]
name = "QCB_y"
command = D, B, y
time = 16
buffer.time = 8

;===================================
; QUARTER CIRCLE BACK KICK
;===================================
[Command]
name = "QCB_a"
command = ~D, B, a
time = 16
buffer.time = 8
[Command]
name = "QCB_a"
command = D, B, a
time = 16
buffer.time = 8
[Command]
name = "QCB_b"
command = ~D, B, b
time = 16
buffer.time = 8
[Command]
name = "QCB_b"
command = D, B, b
time = 16
buffer.time = 8

;===================================
; DOWN DOWN BUTTON
;===================================
[Command]
name = "DD_x"
command = ~D, D, x
buffer.time = 8
[Command]
name = "DD_x"
command = D, D, x
buffer.time = 8
[Command]
name = "DD_y"
command = ~D, D, y
buffer.time = 8
[Command]
name = "DD_y"
command = D, D, y
buffer.time = 8
[Command]
name = "DD_a"
command = ~D, D, a
buffer.time = 8
[Command]
name = "DD_a"
command = D, D, a
buffer.time = 8
[Command]
name = "DD_b"
command = ~D, D, b
buffer.time = 8
[Command]
name = "DD_b"
command = D, D, b
buffer.time = 8