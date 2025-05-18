; The CMD file.
;
; Two parts: 1. Command definition and  2. State entry
; (state entry is after the commands def section)
;
; 1. Command definition
; ---------------------
; Note: The commands are CASE-SENSITIVE, and so are the command names.
; The eight directions are:
;   B, DB, D, DF, F, UF, U, UB     (all CAPS)
;   corresponding to back, down-back, down, downforward, etc.
; The six buttons are:
;   a, b, c, x, y, z               (all lower case)
;   In default key config, abc are are the bottom, and xyz are on the
;   top row. For 2 button characters, we recommend you use a and b.
;   For 6 button characters, use abc for kicks and xyz for punches.
;
; Each [Command] section defines a command that you can use for
; state entry, as well as in the CNS file.
; The command section should look like:
;
;   [Command]
;   name = some_name
;   command = the_command
;   time = time (optional)
;   buffer.time = time (optional)
;
; - some_name
;   A name to give that command. You'll use this name to refer to
;   that command in the state entry, as well as the CNS. It is case-
;   sensitive (QCB_a is NOT the same as Qcb_a or QCB_A).
;
; - command
;   list of buttons or directions, separated by commas. Each of these
;   buttons or directions is referred to as a "symbol".
;   Directions and buttons can be preceded by special characters:
;   slash (/) - means the key must be held down
;          egs. command = /D       ;hold the down direction
;               command = /DB, a   ;hold down-back while you press a
;   tilde (~) - to detect key releases
;          egs. command = ~a       ;release the a button
;               command = ~D, F, a ;release down, press fwd, then a
;          If you want to detect "charge moves", you can specify
;          the time the key must be held down for (in game-ticks)
;          egs. command = ~30a     ;hold a for at least 30 ticks, then release
;   dollar ($) - Direction-only: detect as 4-way
;          egs. command = $D       ;will detect if D, DB or DF is held
;               command = $B       ;will detect if B, DB or UB is held
;   plus (+) - Buttons only: simultaneous press
;          egs. command = a+b      ;press a and b at the same time
;               command = x+y+z    ;press x, y and z at the same time
;   greater-than (>) - means there must be no other keys pressed or released
;                      between the previous and the current symbol.
;          egs. command = a, >~a   ;press a and release it without having hit
;                                  ;or released any other keys in between
;   You can combine the symbols:
;     eg. command = ~30$D, a+b     ;hold D, DB or DF for 30 ticks, release,
;                                  ;then press a and b together
;
;   Note: Successive direction symbols are always expanded in a manner similar
;         to this example:
;           command = F, F
;         is expanded when MUGEN reads it, to become equivalent to:
;           command = F, >~F, >F
;
;   It is recommended that for most "motion" commads, eg. quarter-circle-fwd,
;   you start off with a "release direction". This makes the command easier
;   to do.
;
; - time (optional)
;   Time allowed to do the command, given in game-ticks. The default
;   value for this is set in the [Defaults] section below. A typical
;   value is 15.
;
; - buffer.time (optional)
;   Time that the command will be buffered for. If the command is done
;   successfully, then it will be valid for this time. The simplest
;   case is to set this to 1. That means that the command is valid
;   only in the same tick it is performed. With a higher value, such
;   as 3 or 4, you can get a "looser" feel to the command. The result
;   is that combos can become easier to do because you can perform
;   the command early. Attacks just as you regain control (eg. from
;   getting up) also become easier to do. The side effect of this is
;   that the command is continuously asserted, so it will seem as if
;   you had performed the move rapidly in succession during the valid
;   time. To understand this, try setting buffer.time to 30 and hit
;   a fast attack, such as KFM's light punch.
;   The default value for this is set in the [Defaults] section below.
;   This parameter does not affect hold-only commands (eg. /F). It
;   will be assumed to be 1 for those commands.
;
; If you have two or more commands with the same name, all of them will
; work. You can use it to allow multiple motions for the same move.
;
; Some common commands examples are given below.
;
; [Command] ;Quarter circle forward + x
; name = "QCF_x"
; command = ~D, DF, F, x
;
; [Command] ;Half circle back + a
; name = "HCB_a"
; command = ~F, DF, D, DB, B, a
;
; [Command] ;Two quarter circles forward + y
; name = "2QCF_y"
; command = ~D, DF, F, D, DF, F, y
;
; [Command] ;Tap b rapidly
; name = "5b"
; command = b, b, b, b, b
; time = 30
;
; [Command] ;Charge back, then forward + z
; name = "charge_B_F_z"
; command = ~60$B, F, z
; time = 10
;
; [Command] ;Charge down, then up + c
; name = "charge_D_U_c"
; command = ~60$D, U, c
; time = 10


;-| Button Remapping |-----------------------------------------------------
; This section lets you remap the player's buttons (to easily change the
; button configuration). The format is:
;   old_button = new_button
; If new_button is left blank, the button cannot be pressed.
[Remap]
x = x
y = y
z = z
a = a
b = b
c = c
s = s

;-| Default Values |-------------------------------------------------------
[Defaults]
; Default value for the "time" parameter of a Command. Minimum 1.
command.time = 15

; Default value for the "buffer.time" parameter of a Command. Minimum 1,
; maximum 30.
command.buffer.time = 1


;-| Super Motions |--------------------------------------------------------
;The following two have the same name, but different motion.
;Either one will be detected by a "command = TripleKFPalm" trigger.
;Time is set to 20 (instead of default of 15) to make the move
;easier to do.
;
[Command]
name = "LVL2"
command = ~D, DF, F, D, DF, F, x
buffer.time = 3
time = 20

[Command]
name = "LVL2"
command = ~D, DF, F, D, DF, F, ~x
buffer.time = 3
time = 20

[Command]
name = "LVL2"   ;Same name as above
command = ~D, DF, F, D, DF, F, y
buffer.time = 3
time = 20

[Command]
name = "LVL2"   ;Same name as above
command = ~D, DF, F, D, DF, F, ~y
buffer.time = 3
time = 20

[Command]
name = "SmashKFUpper"
command = ~D, DF, F, D, DF, F, a
time = 22
buffer.time = 3

[Command]
name = "SmashKFUpper"   ;Same name as above
command = ~D, DF, F, D, DF, F, b
time = 22
buffer.time = 3

;-| Special Motions |------------------------------------------------------
[Command]
name = "blocking"
command = y+b
time = 3
buffer.time = 3

[Command]
name = "blocking" ;Same name as above (buttons in opposite order)
command = b+y
time = 3
buffer.time = 3

[Command]
name = "upper_x"
command = ~F, D, DF, x
buffer.time = 3

[Command]
name = "upper_y"
command = ~F, D, DF, y
buffer.time = 3

[Command]
name = "upper_xy"
command = ~D, DF, F, b
buffer.time = 3

[Command]
name = "HCBab"
command = ~F, D, $B, a+b
buffer.time = 8
[Command]
name = "HCBab"
command = ~F, D, $B, b+a
buffer.time = 8
[Command]
name = "HCBa"
command = ~F, D, $B, a
buffer.time = 8
[Command]
name = "HCBa"
command = ~F, D, $B, ~a
buffer.time = 8
[Command]
name = "HCBb"
command = ~F, D, $B, b
buffer.time = 8
[Command]
name = "HCBb"
command = ~F, D, $B, ~b
buffer.time = 8
[Command]
name = "HCBxy"
command = ~F, D, $B, x+y
buffer.time = 8
[Command]
name = "HCBxy"
command = ~F, D, $B, y+x
buffer.time = 8
[Command]
name = "HCBx"
command = ~F, D, $B, x
buffer.time = 8
[Command]
name = "HCBx"
command = ~F, D, $B, ~x
buffer.time = 8
[Command]
name = "HCBy"
command = ~F, D, $B, y
buffer.time = 8
[Command]
name = "HCBy"
command = ~F, D, $B, ~y
buffer.time = 8

[Command]
name = "HCFab"
command = ~B, D, $F, a+b
buffer.time = 8
[Command]
name = "HCFab"
command = ~B, D, $F, b+a
buffer.time = 8
[Command]
name = "HCFa"
command = ~B, D, $F, a
buffer.time = 8
[Command]
name = "HCFa"
command = ~B, D, $F, ~a
buffer.time = 8
[Command]
name = "HCFb"
command = ~B, D, $F, b
buffer.time = 8
[Command]
name = "HCFb"
command = ~B, D, $F, ~b
buffer.time = 8
[Command]
name = "HCFxy"
command = ~B, D, $F, x+y
buffer.time = 8
[Command]
name = "HCFxy"
command = ~B, D, $F, y+x
buffer.time = 8
[Command]
name = "HCFx"
command = ~B, D, $F, x
buffer.time = 8
[Command]
name = "HCFx"
command = ~B, D, $F, ~x
buffer.time = 8
[Command]
name = "HCFy"
command = ~B, D, $F, y
buffer.time = 8
[Command]
name = "HCFy"
command = ~B, D, $F, ~y
buffer.time = 8

[Command]
name = "QCF_x"
command = ~D, DF, F, x
buffer.time = 3

[Command]
name = "QCF_x"
command = ~D, DF, F, ~x
buffer.time = 3

[Command]
name = "QCF_y"
command = ~D, DF, F, y
buffer.time = 3

[Command]
name = "QCF_y"
command = ~D, DF, F, ~y
buffer.time = 3

[Command]
name = "QCF_xy"
command = ~D, DF, F, x+y
buffer.time = 3

[Command]
name = "QCF_xy"
command = ~D, DF, F, ~x+y
buffer.time = 3

[Command]
name = "QCB_x"
command = ~D, DB, B, x
buffer.time = 3

[Command]
name = "QCB_x"
command = ~D, DB, B, ~x
buffer.time = 3

[Command]
name = "QCB_y"
command = ~D, DB, B, y
buffer.time = 3

[Command]
name = "QCB_y"
command = ~D, DB, B, ~y
buffer.time = 3

[Command]
name = "QCB_xy"
command = ~D, DB, B, x+y
buffer.time = 10

[Command]
name = "QCB_xy"
command = ~D, DB, B, ~x+y
buffer.time = 3

[Command]
name = "QCF_a"
command = ~D, DF, F, a
buffer.time = 3

[Command]
name = "QCF_a"
command = ~D, DF, F, ~a
buffer.time = 3

[Command]
name = "QCF_b"
command = ~D, DF, F, b
buffer.time = 3

[Command]
name = "QCF_b"
command = ~D, DF, F, ~b
buffer.time = 3


[Command]
name = "QCF_ab"
command = ~D, DF, F, a+b
buffer.time = 3

[Command]
name = "QCF_ab"
command = ~D, DF, F, ~a+b
buffer.time = 3

[Command]
name = "DD_z"
command = D, D, z
buffer.time = 3

;-| Double Tap |-----------------------------------------------------------
[Command]
name = "FF"     ;Required (do not remove)
command = F, F
time = 15
buffer.time = 6

[Command]
name = "bFF"     ;Required (do not remove)
command = F, F
time = 15
buffer.time = 6

[Command]
name = "BB"     ;Required (do not remove)
command = B, B
time = 10
buffer.time = 6

[Command]
name = "DD"
command = D, D
buffer.time = 6

;-| Dir + Button |---------------------------------------------------------
[Command]
name = "down_a"
command = /$D,a
time = 1
buffer.time = 3

[Command]
name = "down_b"
command = /$D,b
time = 1
buffer.time = 3

;-| Single Button |---------------------------------------------------------
[Command]
name = "a"
command = a
time = 1
buffer.time = 3

[Command]
name = "b"
command = b
time = 1
buffer.time = 3

[Command]
name = "c"
command = c
time = 1
buffer.time = 3

[Command]
name = "x"
command = x
time = 1
buffer.time = 3

[Command]
name = "y"
command = y
time = 1
buffer.time = 3

[Command]
name = "z"
command = z
time = 1
buffer.time = 1

[Command]
name = "Ba"
command = a
time = 3
buffer.time = 3

[Command]
name = "Bb"
command = b
time = 3
buffer.time = 3

[Command]
name = "Bc"
command = c
time = 3
buffer.time = 3

[Command]
name = "Bx"
command = x
time = 3
buffer.time = 3

[Command]
name = "By"
command = y
time = 3
buffer.time = 3

[Command]
name = "Bz"
command = z
time = 3
buffer.time = 3

[Command]
name = "start"
command = s
time = 1
buffer.time = 3

;-| ‚Q`‚RŒÂ‚Ìƒ{ƒ^ƒ““¯Žž‰Ÿ‚µ‹Z |-----------------------------------------------
[Command]
name = "xy"
command = x+y
time = 1
buffer.time = 3

[Command]
name = "yx"
command = y+x
time = 1
buffer.time = 3

[Command]
name = "yz"
command = y+z
time = 1
buffer.time = 3

[Command]
name = "xz"
command = x+z
time = 1
buffer.time = 3

[Command]
name = "ab"
command = a+b
time = 1
buffer.time = 3

[Command]
name = "bc"
command = b+c
time = 1
buffer.time = 3

[Command]
name = "ac"
command = a+c
time = 1
buffer.time = 3

[Command]
name = "ax"
command = a+x
time = 1
buffer.time = 3

[Command]
name = "by"
command = b+y
time = 1
buffer.time = 3

[Command]
name = "cz"
command = c+z
time = 1
buffer.time = 3

;-| Hold Dir |--------------------------------------------------------------
[Command]
name = "holdfwd";Required (do not remove)
command = /$F
time = 1
buffer.time = 3

[Command]
name = "holdback";Required (do not remove)
command = /$B
time = 1
buffer.time = 3

[Command]
name = "holdup" ;Required (do not remove)
command = /$U
time = 1
buffer.time = 3

[Command]
name = "holddown";Required (do not remove)
command = /$D
time = 1
buffer.time = 3

;---------------------------------------------------------------------------
; 2. State entry
; --------------
; This is where you define what commands bring you to what states.
;
; Each state entry block looks like:
;   [State -1, Label]           ;Change Label to any name you want to use to
;                               ;identify the state with.
;   type = ChangeState          ;Don't change this
;   value = new_state_number
;   trigger1 = command = command_name
;   . . .  (any additional triggers)
;
; - new_state_number is the number of the state to change to
; - command_name is the name of the command (from the section above)
; - Useful triggers to know:
;   - statetype
;       S, C or A : current state-type of player (stand, crouch, air)
;   - ctrl
;       0 or 1 : 1 if player has control. Unless "interrupting" another
;                move, you'll want ctrl = 1
;   - stateno
;       number of state player is in - useful for "move interrupts"
;   - movecontact
;       0 or 1 : 1 if player's last attack touched the opponent
;                useful for "move interrupts"
;
; Note: The order of state entry is important.
;   State entry with a certain command must come before another state
;   entry with a command that is the subset of the first.
;   For example, command "fwd_a" must be listed before "a", and
;   "fwd_ab" should come before both of the others.
;
; For reference on triggers, see CNS documentation.
;
; Just for your information (skip if you're not interested):
; This part is an extension of the CNS. "State -1" is a special state
; that is executed once every game-tick, regardless of what other state
; you are in.


; Don't remove the following line. It's required by the CMD standard.
[Statedef -1]
;---------------------------------------------------------------------------
;Taunt
[State -1, Taunt]
type = ChangeState
value = 195
triggerall = command = "start"
trigger1 = statetype != A
trigger1 = ctrl
;===========================================================================
;---------------------------------------------------------------------------
;Smash Kung Fu Upper (uses one super bar)
[State -1, Smash Kung Fu Upper]
type = ChangeState
value = 3050
triggerall = command = "SmashKFUpper"
triggerall = power >= 3000
triggerall = statetype != A
triggerall = stateno !=[300,302]
trigger1 = ctrl
trigger2 = movecontact

[State -1, Smash Kung Fu Upper]
type = ChangeState
value = 3000
triggerall = command = "LVL2"
triggerall = power >= 2000
triggerall = statetype != A
triggerall = stateno !=[300,302]
trigger1 = ctrl
trigger2 = movecontact

[State -1, Breaker]
type = ChangeState
value = 300
triggerall = enemy,HitDefAttr = SCA,NA,NP,NP,SP
triggerall = power >= 2000
triggerall = life != 0 || roundstate != 3
triggerall = command = "cz" 
triggerall = stateno = [5000,5071]
trigger1 = movetype = H

[State -1, Guard Rush]
type = ChangeState
value = 360
triggerall = power >= 500
triggerall = command = "x" && command = "y"
triggerall = stateno = [150,151]
trigger1 = statetype = S || statetype = C
trigger1 = pos y = 0

[State -1, Guard Rush]
type = ChangeState
value = 370
triggerall = power >= 500
triggerall = command = "a" && command = "b"
triggerall = stateno = [140,151]
trigger1 = statetype = S || statetype = C
trigger1 = pos y = 0
;---------------------------------------------------------------------------


;===========================================================================
;This is not a move, but it sets up var(1) to be 1 if conditions are right
;for a combo into a special move (used below).
;Since a lot of special moves rely on the same conditions, this reduces
;redundant logic.
[State -1, Combo condition Reset]
type = VarSet
trigger1 = 1
var(1) = 0

[State -1, Combo condition Check]
type = VarSet
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200,299]) || (stateno = [400,499]) || (stateno = [1000,1004])
trigger2 = stateno != 440 && stateno != 221
trigger2 = movecontact
var(1) = 1
;---------------------------------------------------------------------------
;[State 220, Launcher]
;type = ChangeState
;value = 220
;triggerall = command = "z"
;TRIGGER1 = ctrl
;trigger1 = var(1) ;Use combo condition (above)
;trigger2 = stateno = 200 && movecontact
;trigger3 = stateno = 210 && movecontact
;trigger4 = stateno = 230 && movecontact
;trigger5 = stateno = 240 && movecontact
;trigger6 = stateno = 211 && movecontact

;---------------------------------------------------------------------------
[State 221, Overhead]
type = ChangeState
value = 221
triggerall = command = "c"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 240 && movecontact
trigger3 = stateno = 211 && movecontact
;---------------------------------------------------------------------------
[State 1500, 22L: EX Stance]
type = ChangeState
value = 1500
triggerall = command = "DD_z"
triggerall = statetype != A
triggerall = map(exl)<=0
triggerall = power >= 1000
triggerall = HitDefAttr != SCA,HA
triggerall = stateno != [1023,1024]
trigger1 = ctrl
trigger2 = var(1) ;Use combo condition (above)
trigger3 = stateno = [1000,1999] && movecontact
;trigger2 = movecontact && HitDefAttr != SCA,HA,HP,HT
;---------------------------------------------------------------------------
[State 1000, LC: Jet Stance]
type = ChangeState
value = 1000
triggerall = command != "DD_z"
triggerall = command = "z"
triggerall = fvar(25) >= 1
trigger1 = var(1) ;Use combo condition (above)
trigger2 = stateno = 9001
  
;---------------------------------------------------------------------------
[State 1001, LC~HK: Jet Stance Low Slash]
type = ChangeState
value = 1001
triggerall = Map(StanceSK) <= 1
triggerall = command = "Bb" 
triggerall = command != "QCF_b"
trigger1 = stateno = 1000 || stateno = 2000
trigger2 = stateno = [1009,1010]


[State 1002, LC~HP: Jet Stance Overhead]
type = ChangeState
value = 1002
triggerall = Map(StanceSP) <=1
triggerall = command = "By"
triggerall = command != "QCB_y"
trigger1 = stateno = 1000 || stateno = 2000
trigger2 = stateno = [1009,1010]


[State 1003, LC~LK: Jet Stance Slash]
type = ChangeState
value = 1003
triggerall = Map(StanceLK) <=1
triggerall = command = "Ba"
triggerall = command != "QCF_a"
trigger1 = stateno = 1000 || stateno = 2000
trigger2 = stateno = [1009,1010]

[State 1004, LC~LC: Jet Stance Launcher]
type = Changestate
value = 1004
triggerall = Map(Launcher) <=0
triggerall = command = "z"
trigger1 = stateno = 1000 || stateno = 2000
trigger2 = stateno = [1009,1010]

[state 40, Jet Stance Launcher Jump]
type = changestate
triggerall = ifelse(p2dist X> 0, command = "holdup", command = "holdup")
triggerall = stateno = 1004 && statetype != A
trigger1 = movehit
value = 40

[State 1005, LC~OH: Jet Stance Cancel]
type = ChangeState
value = 1005
triggerall = command = "Bc"
trigger1 = stateno = 1000
trigger2 = stateno = [1009,1010] || stateno = 2000

[State 203, LC~LP: Jet Stance RUSH]
type = ChangeState
value = 203
triggerall = Map(StanceLP) <=1
triggerall = command = "Bx"
triggerall = command != "QCB_x"
trigger1 = stateno = 1000 || stateno = 2000
trigger2 = stateno = [1009,1010]

;----------------------------------------------------------------------------
[State 1100, jLC: GO DOWN]
type = ChangeState
value = 1100
triggerall = command = "z"
triggerall = statetype = A
triggerall = fvar(25) >= 1
trigger1 = ctrl
trigger2 = movecontact && stateno = [600,640]
trigger3 = movecontact && stateno = 7662 
trigger4 = movecontact && stateno = 7663
trigger5 = movecontact && stateno = 1012

;---------------------------------------------------------------------------
[State 1023, 214PP: EX Jet Blast]
type = ChangeState
value = 1023
triggerall = fvar(25) > 0 
triggerall = command = "QCB_xy"
triggerall= statetype != A
triggerall = power >= 1000
triggerall = statetype = S
triggerall= stateno != 1024
triggerall= stateno != 1023
triggerall = stateno !=[300,302]
trigger1 = var(1) ;Use combo condition (above)
trigger2 = stateno = [1000,1999] && movecontact
trigger3 = movecontact && HitDefAttr != SCA,HA,HP,HT
;---------------------------------------------------------------------------
[State 1021, 214LP: L Jet Blast]
type = ChangeState
value = 1021
triggerall = fvar(25) > 0
triggerall = command = "QCB_x"
triggerall = statetype != A
trigger1 = var(1) ;Use combo condition (above)
trigger2 = ctrl
trigger3 = stateno = 1000 || stateno = [1009,1010] || stateno = 2000

;--------------------------------------------------------------------------
[State 1022, 214HP: H Jet Blast]
type = ChangeState
value = 1022
triggerall = fvar(25) > 0
triggerall = command = "QCB_y"
triggerall = statetype != A
trigger1 = var(1) ;Use combo condition (above)
trigger2 = ctrl
trigger3 = stateno = 1000 || stateno = [1009,1010] || stateno = 2000 
;---------------------------------------------------------------------------

[State 7666, 236KK: EX Wave Rush]
type = ChangeState
value = 2100
triggerall = fvar(25) > 0
triggerall = command = "QCF_ab"
triggerall= statetype != A
triggerall = power >= 1000
triggerall = var(34)<=0
trigger1 = var(1) ;Use combo condition (above)
trigger2 = stateno = [1000,1999] && movecontact
trigger3 = ctrl

;---------------------------------------------------------------------------
[State 1006, 236LK: L Wave Rush]
type = ChangeState
value = 1006
triggerall = fvar(25) > 0
triggerall = command = "QCF_a"
triggerall = statetype != A
trigger1 = var(1) ;Use combo condition (above)
trigger2 = ctrl
trigger3 = stateno = [1009,1010] || stateno = 2000
trigger4 = stateno = 9001

;---------------------------------------------------------------------------
[State 1007, 236HK: H Wave Rush]
type = ChangeState
value = 1007
triggerall = fvar(25) > 0
triggerall = command = "QCF_b"
triggerall = statetype != A
trigger1 = var(1) ;Use combo condition (above)
trigger2 = ctrl
trigger3 = stateno = [1009,1010] || stateno = 2000
trigger4 = stateno = 9001

;---------------------------------------------------------------------------
[State 1008, 236K ~ 6K: Wave Rush Ender]
type = ChangeState
value = 1008
triggerall = command = "holdfwd"
triggerall = command != "holddown"
triggerall = command = "a" || command = "b"
triggerall = movehit
trigger1 = stateno = 1006 || stateno = 1007
;---------------------------------------------------------------------------
[State 7664, j236KK: EX Airdash]
type = ChangeState
value = 7664
triggerall = Map(EXQCFK)<=0
triggerall= stateno != 7664
triggerall = command = "QCF_ab" 
triggerall = power >= 1000
triggerall = var(34)<=0
triggerall = statetype = A
trigger1 = ctrl
trigger2 = movecontact 

;-----------------------------------------------------------------------------
[State 7662, j236LK: L Airdash]
type = ChangeState
value = 7662
triggerall = fvar(25) > 0
triggerall = command = "QCF_a"
triggerall = !numexplod(10902)
triggerall = stateno != 7663
triggerall = statetype = A
trigger1 = ctrl
trigger2 = stateno = 630 && movecontact
trigger3 = stateno = 640 && movecontact
trigger4 = stateno = 610 && movecontact
;trigger5 = stateno = 1112 && movecontact

;---------------------------------------------------------------------------
[State 7663, j236HK: S Airdash]
type = ChangeState
value = 7663
triggerall = fvar(25) > 0
triggerall = command = "QCF_b"
triggerall = !numexplod(10902)
triggerall = stateno != 7662
triggerall = statetype = A
trigger1 = ctrl
trigger2 = stateno = 630 && movecontact
trigger3 = stateno = 640 && movecontact
trigger4 = stateno = 610 && movecontact
;trigger5 = stateno = 1112 && movecontact


;---------------------------------------------------------------------------
[State 1300, Reversal Art: Bye Bitch]
type = ChangeState
value = 1300
triggerall = fvar(25) >= 1
triggerall = command = "blocking"
trigger1 = ctrl
trigger1 = statetype != A
trigger2 = stateno = 1310 || stateno = 1330
;-----------------------------------------------------------------------------
[State 1300, Reversal  Art Macro: Nonsensical Laughter]
type = ChangeState
value = 1300
triggerall = fvar(25) >= 1
triggerall = TeamMode != Tag
triggerall = command = "w"
trigger1 = ctrl
trigger1 = statetype != A
trigger2 = stateno = 1310 || stateno = 1330
;---------------------------------------------------------------------------

;---------------------------------------------------------------------------


;===========================================================================
;grab
[State 800, Grab]
type = changestate
value = 800
triggerall = command = "ax"
trigger1 = statetype = S
trigger1 = ctrl
;---------------------------------------------------------------------------
;grab
[State 800a, Grab Macro]
type = changestate
value = 800
triggerall = TeamMode != Tag
triggerall = command = "d"
trigger1 = statetype = S
trigger1 = ctrl
;---------------------------------------------------------------------------
[State 9001, Run Fwd]
type = ChangeState
value = 9001
triggerall = command = "FF"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 1022 && movecontact
;---------------------------------------------------------------------------
[State 9000, Run Back]
type = ChangeState
value = 105
triggerall = command = "BB"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 1022 && movecontact

;===========================================================================
;---------------------------------------------------------------------------
[State 200, LP]
type = ChangeState
value = 200
triggerall = command = "x"
triggerall = command != "holddown"
triggerall = statetype = S
trigger1 = ctrl
trigger2 = stateno = 400 && movecontact 


[state 201, LP>LP]
type = changestate
triggerall =  command = "x"
triggerall = stateno = 200 && statetype != A
trigger1 = movecontact 
value = 201


[state 202, LP>LP>LP]
type = changestate
triggerall =  command = "x"
triggerall = stateno = 201 && statetype != A
trigger1 = movecontact 
value = 202


[state 231a, LP>LP>LK]
type = changestate
triggerall = command = "a"
triggerall = stateno = 201 && statetype != A
trigger1 = movecontact 
value = 231
;---------------------------------------------------------------------------
[State 210, HP]
type = ChangeState
value = 210
triggerall = command = "y"
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 230 && movecontact 
trigger3 = stateno = 231 && movecontact



[State 211a, HP>HP]
type = changestate
triggerall =  command = "y"
triggerall = stateno = 210 && statetype != A
trigger1 = movecontact 
value = 211
;---------------------------------------------------------------------------
[State 230, LK]
type = ChangeState
value = 230
triggerall = command = "a"
triggerall = command != "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger4 = stateno = 430 && movecontact 

[State 231b, LK>LK]
type = changestate
triggerall = command = "a"
triggerall = stateno = 230 && statetype != A
trigger1 = movecontact 
value = 231

[state 240a, LK>LK>HK]
type = changestate
triggerall = command = "b"
triggerall = command != "holddown"
triggerall = command != "holdback"
triggerall = stateno = 231 && statetype != A
trigger1 = movecontact 
value = 240
;---------------------------------------------------------------------------
[State 240, HK]
type = ChangeState
value = 240
triggerall = command = "b"
triggerall = command != "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact 
trigger3 = stateno = 210 && movecontact 
trigger4 = stateno = 230 && movecontact 

[state 232, 4HK String]
type = changestate
triggerall =  command = "holdback"
triggerall =  command = "b"
triggerall = stateno = 231 || stateno = 240
trigger1 = movecontact 
trigger2 = ctrl
value = 232

[state 250, HK>2HK String]
type = changestate
triggerall = command = "holddown"
triggerall = command =  "b"
triggerall = statetype != A
trigger1 = movecontact && stateno  = 240 || stateno = 231
value = 250
;---------------------------------------------------------------------------
[State 400, 2LP]
type = ChangeState
value = 400
triggerall = command = "x"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl

;---------------------------------------------------------------------------
[State 410, 2HP]
type = ChangeState
value = 410
triggerall = command = "y"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = stateno = 400 && movecontact 
trigger3 = stateno = 430 && movecontact 
;---------------------------------------------------------------------------
[State 430, 2LK]
type = ChangeState
value = 430
triggerall = command = "a"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = moveguarded && stateno = 430
trigger3 = stateno = 400 && movecontact 

;---------------------------------------------------------------------------
[State 440, 2HK]
type = ChangeState
value = 440
triggerall = command = "b"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = stateno = 400
trigger3 = stateno = 430 


[State 611, j2HP]
type = Changestate
value = 611
triggerall = command = "y"
triggerall = command = "holddown"
triggerall = stateno != 611
triggerall = statetype = A
trigger1 = ctrl
trigger2 = movecontact

;---------------------------------------------------------------------------
;Jump Light Punch
[State -1, Jump Light Punch]
type = ChangeState
value = 600
triggerall = command = "x"
trigger1 = statetype = A
trigger1 = ctrl

;---------------------------------------------------------------------------
;Jump Strong Punch
[State -1, Jump Strong Punch]
type = ChangeState
value = 610
triggerall = command = "y"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 || stateno = 630 ;jump_x or jump_a
trigger2 = movecontact

;---------------------------------------------------------------------------
;Jump Light Kick
[State -1, Jump Light Kick]
type = ChangeState
value = 630
triggerall = command = "a"
trigger1 = statetype = A
trigger1 = ctrl

;---------------------------------------------------------------------------
;Jump Strong Kick
[State -1, Jump Strong Kick]
type = ChangeState
value = 640
triggerall = command = "b"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 || stateno = 630 ;jump_x or jump_a
trigger2 = movecontact
