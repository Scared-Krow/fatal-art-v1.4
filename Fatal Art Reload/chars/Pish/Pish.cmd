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
name = "TripleKFPalm"
command = ~D, F, D, F, a
buffer.time = 3
time = 20

[Command]
name = "TripleKFPalm"
command = ~D, F, D, F, ~a
buffer.time = 3
time = 20

[Command]
name = "TripleKFPalm"   ;Same name as above
command = ~D, F, D, F, b
buffer.time = 3
time = 20

[Command]
name = "TripleKFPalm"   ;Same name as above
command = ~D, F, D, F, ~b
buffer.time = 3
time = 20

[Command]
name = "SmashKFUpper"
command = ~D, B, D, B, x;~F, D, DF, F, D, DF, x
time = 20

[Command]
name = "SmashKFUpper"   ;Same name as above
command = ~D, B, D, B, y;~F, D, DF, F, D, DF, y
time = 20

[Command]
name = "SmashKFUpper"
command = ~D, B, D, B, ~x;~F, D, DF, F, D, DF, x
time = 20

[Command]
name = "SmashKFUpper"   ;Same name as above
command = ~D, B, D, B, ~y;~F, D, DF, F, D, DF, y
time = 20

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

;-| Special Motions |------------------------------------------------------
[Command]
name = "blocking"
command = y+b
time = 3

[Command]
name = "blocking" ;Same name as above (buttons in opposite order)
command = b+y
time = 3


[Command]
name = "upper_x"
command = ~F, D, DF, x
buffer.time = 3

[Command]
name = "upper_x"
command = ~F, D, DF, ~x
buffer.time = 3

[Command]
name = "upper_y"
command = ~F, D, DF, y
buffer.time = 3

[Command]
name = "upper_y"
command = ~F, D, DF, ~y
buffer.time = 3

[Command]
name = "upper_xy"
command = ~F, D, DF, x+y
buffer.time = 3

[Command]
name = "upper_xy"
command = ~F, D, DF, ~x+y
buffer.time = 3

[Command]
name = "c_bfxy"
command = ~25$B, $F, ~x+y
buffer.time = 3

[Command]
name = "c_bfxy"
command = ~25$B, $F, x+y
buffer.time = 3

[Command]
name = "c_bfab"
command = ~25$B, $F, ~a+b
buffer.time = 3

[Command]
name = "c_bfab"
command = ~25$B, $F, a+b
buffer.time = 3

[Command]
name = "QCF_x"
command = ~D, F, x

[Command]
name = "QCF_y"
command = ~D, F, y

[Command]
name = "QCF_xy"
command = ~D,F, x+y

[Command]
name = "QCB_x"
command = ~D, B, x
buffer.time = 1

[Command]
name = "QCB_x"
command = ~D, B, ~x
buffer.time = 1

[Command]
name = "QCB_y"
command = ~D, B, y
buffer.time = 1

[Command]
name = "QCB_y"
command = ~D, B, ~y
buffer.time = 1

[Command]
name = "QCB_xy"
command = ~D,B, x+y

[Command]
name = "DD_xy"
command = ~D, D, x+y
buffer.time = 3

[Command]
name = "DD_xy"
command = ~D, D, ~x+y
buffer.time = 3

[Command]
name = "QCF_a"
command = ~D, F, a
buffer.time = 3

[Command]
name = "QCF_a"
command = ~D, F, ~a
buffer.time = 3

[Command]
name = "QCF_b"
command = ~D, F, b
buffer.time = 3

[Command]
name = "QCF_b"
command = ~D, F, ~b
buffer.time = 3

[Command]
name = "QCF_ab"
command = ~D, F, a+b
buffer.time = 3

[Command]
name = "QCF_ab"
command = ~D, F, ~a+b
buffer.time = 3

[Command]
name = "QCB_ab"
command = D,B, a+b

[Command]
name = "QCB_a"
command = D,B, a

[Command]
name = "QCB_b"
command = D,B, b

;-| Double Tap |-----------------------------------------------------------
[Command]
name = "FF"     ;Required (do not remove)
command = F, F
time = 15

[Command]
name = "BB"     ;Required (do not remove)
command = B, B
time = 15


;-| 2/3 Button Combination |-----------------------------------------------
[Command]
name = "recovery";Required (do not remove)
command = x+y
time = 1

;-| Dir + Button |---------------------------------------------------------
[Command]
name = "down_a"
command = /$D,a
time = 1

[Command]
name = "down_b"
command = /$D,b
time = 1


[Command]
name = "hold_a"
command = /a
buffer.time = 3

[Command]
name = "hold_b"
command = /b
buffer.time = 3

[Command]
name = "hold_c"
command = /c
time = 1
buffer.time =3 

[Command]
name = "hold_x"
command = /x
buffer.time = 3

[Command]
name = "hold_y"
command = /y
buffer.time = 3

[Command]
name = "hold_z"
command = /z
time = 1
buffer.time =3 

[Command]
name = "hold_pp"
command = x+y
time = 8
buffer.time =12

[Command]
name = "hold_kk"
command = a+b
time = 8
buffer.time =12


;-| Single Button |---------------------------------------------------------
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
name = "start"
command = s
time = 1
;-| ‚Q`‚RŒÂ‚Ìƒ{ƒ^ƒ““¯Žž‰Ÿ‚µ‹Z |-----------------------------------------------
[Command]
name = "xy"
command = x+y
time = 1

[Command]
name = "yz"
command = y+z
time = 1

[Command]
name = "xz"
command = x+z
time = 1

[Command]
name = "ab"
command = a+b
time = 1

[Command]
name = "bc"
command = b+c
time = 1

[Command]
name = "ac"
command = a+c
time = 1

[Command]
name = "ax"
command = a+x
time = 1

[Command]
name = "by"
command = b+y
time = 1

[Command]
name = "cz"
command = c+z
time = 1
;-| Hold Dir |--------------------------------------------------------------
[Command]
name = "holdfwd";Required (do not remove)
command = /$F
time = 1

[Command]
name = "holdback";Required (do not remove)
command = /$B
time = 1

[Command]
name = "holdup" ;Required (do not remove)
command = /$U
time = 1

[Command]
name = "holddown";Required (do not remove)
command = /$D
time = 1

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
triggerall = command = "TripleKFPalm"
triggerall = stateno != [800,810]
triggerall = power >= 3000
triggerall = statetype != A
trigger1 = ctrl
trigger2 = movecontact

;Smash Kung Fu Upper (uses one super bar)
[State -1, Smash Kung Fu Upper]
type = ChangeState
value = 4000
triggerall = command = "SmashKFUpper"
triggerall = stateno != [800,810]
triggerall = power >= 2000
triggerall = statetype != A
trigger1 = ctrl
trigger2 = movecontact


;---------------------------------------------------------------------------
;Triple Kung Fu Palm (uses one super bar)
;[State -1, Triple Kung Fu Palm]
;type = ChangeState
;value = 3000
;triggerall = command = "TripleKFPalm"
;triggerall = power >= 1000
;trigger1 = statetype = S
;trigger1 = ctrl
;trigger2 = statetype != A
;trigger2 = hitdefattr = SC, NA, SA, HA
;trigger2 = stateno != [3000,3050)
;trigger2 = movecontact
;trigger3 = stateno = 1310 || stateno = 1330 ;From blocking


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
triggerall = stateno != [800,810]
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200,299]) || (stateno = [400,499]) || stateno = 6011
trigger2 = stateno != 440 ;Except for sweep kick
trigger2 = movecontact
trigger3 = stateno = 710 || stateno = 700
trigger3 = movecontact
var(1) = 1

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
;grab
[State -1, grab]
type = changestate
value = 800
triggerall = command = "ax"
trigger1 = statetype = S
trigger1 = ctrl
;---------------------------------------------------------------------------
;grab
[State -1, grab]
type = changestate
value = 800
triggerall = TeamMode != Tag
triggerall = command = "d"
trigger1 = statetype = S
trigger1 = ctrl
;---------------------------------------------------------------------------
;Overhead
[State -1, Overhead]
type = ChangeState
value = 710
triggerall = command = "c"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = [200,260] && movecontact
;---------------------------------------------------------------------------
;Launcher
[State -1, Light Kung Fu Blow]
type = ChangeState
value = 700
triggerall = command = "z"
triggerall= map(launcher)=0
triggerall = statetype != A
trigger1 = ctrl 
trigger2 = stateno = [200,260] && movecontact
trigger3 = stateno = [400,430] && movecontact
;---------------------------------------------------------------------------
;EX Flippy Dippy
[State -1, Fast Kung Fu Knee]
type = ChangeState
value = 1220
triggerall = Map(EXQCBP) <= 0
triggerall = command = "QCB_xy"
triggerall = stateno != [800,810]
triggerall = power >= 1000
triggerall= statetype = A
trigger1 = ctrl
trigger2 = var(1) ;Use combo condition (above)
trigger3 = movecontact
;---------------------------------------------------------------------------
;Light Flippy Dippy
[State -1, Light Kung Fu Knee]
type = ChangeState
value = 1200
triggerall = command = "QCB_x"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = [600,640] && movecontact
;---------------------------------------------------------------------------
;Strong Flippy Dippy
[State -1, Light Kung Fu Knee]
type = ChangeState
value = 1210
triggerall = command = "QCB_y"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = [600,640] && movecontact
;---------------------------------------------------------------------------
;EX Phantom Flip
[State -1, Akuma anyone?]
type = ChangeState
value = 1170
triggerall = power >= 1000
triggerall = Map(EXQCBP) <= 0
triggerall = stateno != [800,810]
triggerall = command = "QCB_ab"
triggerall = stateno != 700
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = movecontact
;---------------------------------------------------------------------------
;EX Flip Followup
[State -1, Light Kung Fu Blow]
type = ChangeState
value = 1155
triggerall = command = "hold_z"
triggerall = stateno = 1170 
trigger1 = statetype = A
;trigger2 = ctrl
;---------------------------------------------------------------------------
;Light Phantom Flip
[State -1, Akuma anyone?]
type = ChangeState
value = 1150
triggerall = command = "QCB_a"
triggerall = stateno != 700
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)
;---------------------------------------------------------------------------
;Strong Phantom Flip
[State -1, Akuma anyone?]
type = ChangeState
value = 1160
triggerall = command = "QCB_b"
triggerall = stateno != 700
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)
;---------------------------------------------------------------------------
;EX QCF P
[State -1, Fast Kung Fu Knee]
type = ChangeState
value = 1020
triggerall = Map(EXQCFK) <= 0
triggerall = command = "QCF_xy"
triggerall = stateno != [800,810]
triggerall = power >= 1000
triggerall= statetype != A
trigger1 = var(1) ;Use combo condition (above)
trigger2 = movecontact
triggerall= stateno != 2003
;---------------------------------------------------------------------------
;QCF LP
[State -1, Light Kung Fu Knee]
type = ChangeState
value = 1000
triggerall = command = "QCF_x"
triggerall= statetype != A
trigger1 = ctrl
trigger2 = var(1) ;Use combo condition (above)
;---------------------------------------------------------------------------
;QCF SP
[State -1, Strong Kung Fu Knee]
type = ChangeState
value = 1010
triggerall = command = "QCF_y"
triggerall= statetype != A
trigger1 = ctrl
trigger2 = var(1)
;---------------------------------------------------------------------------
;EX Counter 
[State -1, EX Counter]
type = ChangeState
value = 1120
triggerall = command = "QCB_xy"
triggerall = power >= 1000
triggerall= statetype != A
trigger1 = ctrl 
trigger2 = var(1)
;---------------------------------------------------------------------------
;L Counter 
[State -1, Light Kung Fu Knee]
type = ChangeState
value = 1100
triggerall = command = "QCB_x"
triggerall= statetype != A
trigger1 = ctrl ;Use combo condition (above)
trigger2 = var(1)
;---------------------------------------------------------------------------
;S Counter
[State -1, Strong Kung Fu Knee]
type = ChangeState
value = 1110
triggerall = command = "QCB_y"
triggerall= statetype != A
trigger1 = ctrl
trigger2 = var(1)
;---------------------------------------------------------------------------
;Command Run
[State -1, Strong Kung Fu Knee]
type = ChangeState
value = 1250
triggerall = command = "QCF_a" || command = "QCF_b"
triggerall= statetype != A
trigger1 = ctrl
trigger2 = var(1)
;---------------------------------------------------------------------------
;REVERAL ART
[State -1, Hee HooHoo I drive you Cuckoo]
type = ChangeState
value = 1300
triggerall = command = "blocking"
triggerall = command != "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)
;---------------------------------------------------------------------------
;REVERSAL ART
[State -1, The joke makes no sense]
type = ChangeState
value = 1300
triggerall = TeamMode != Tag
triggerall = command = "w"
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
;---------------------------------------------------------------------------
;High Kung Fu Blocking (Low)
;[State -1, High Kung Fu Blocking Low]
;type = ChangeState
;value = 1320
;triggerall = command = "blocking"
;triggerall = command = "holddown"
;trigger1 = ctrl
;trigger1 = statetype != A
;trigger2 = stateno = 1310 || stateno = 1330
;trigger2 = time > 0

;---------------------------------------------------------------------------
;Light Kung Fu Zankou
;[State -1, Light Kung Fu Zankou]
;type = ChangeState
;value = 1400
;triggerall = command = "QCF_a"
;trigger1 = var(1) ;Use combo condition (above)

;---------------------------------------------------------------------------
;Strong Kung Fu Zankou
;[State -1, Strong Kung Fu Zankou]
;type = ChangeState
;value = 1410
;triggerall = command = "QCF_b"
;trigger1 = var(1) ;Use combo condition (above)

;===========================================================================
;---------------------------------------------------------------------------
;Run Fwd
[State -1, Run Fwd]
type = ChangeState
value = 100
triggerall = command = "FF"
trigger1 = statetype = S
trigger1 = ctrl
;---------------------------------------------------------------------------
;Run Back
[State -1, Run Back]
type = ChangeState
value = 105
triggerall = command = "BB"
trigger1 = statetype = S
trigger1 = ctrl

;===========================================================================
;---------------------------------------------------------------------------
;Stand Light Punch
[State -1, Stand Light Punch]
type = ChangeState
value = 200
triggerall = command = "x"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 200 || stateno = 400) && movecontact
;---------------------------------------------------------------------------
;Stand Strong Punch
[State -1, Stand Strong Punch]
type = ChangeState
value = 210
triggerall = command = "y"
triggerall = command != "holddown"
triggerall = command != "holdfwd"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 230 && movecontact
;---------------------------------------------------------------------------
;f.SP
[State -1, Stand Strong Punch]
type = ChangeState
value = 250
triggerall = command = "y"
triggerall = command != "holddown"
triggerall = command = "holdfwd"
triggerall = statetype != A
triggerall = stateno != 250
triggerall = stateno != 100
trigger1 = stateno = [200,430] && movecontact
trigger2 = ctrl
;---------------------------------------------------------------------------
;Stand Light Kick
[State -1, Stand Light Kick]
type = ChangeState
value = 230
triggerall = command = "a"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact 
trigger3 = stateno = 430 && movecontact 
;---------------------------------------------------------------------------
;Standing Strong Kick
[State -1, Standing Strong Kick]
type = ChangeState
value = 240
triggerall = command = "b"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 230 && movecontact
;---------------------------------------------------------------------------
;Crouching Light Punch
[State -1, Crouching Light Punch]
type = ChangeState
value = 400
triggerall = command = "x"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = stateno = 400 && movecontact
;---------------------------------------------------------------------------
;Crouching Strong Punch
[State -1, Crouching Strong Punch]
type = ChangeState
value = 410
triggerall = command = "y"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 430)
trigger2 = movecontact
;---------------------------------------------------------------------------
;Crouching Light Kick
[State -1, Crouching Light Kick]
type = ChangeState
value = 430
triggerall = command = "a"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 430)
trigger2 = movecontact
;---------------------------------------------------------------------------
;Crouching Strong Kick
[State -1, Crouching Strong Kick]
type = ChangeState
value = 440
triggerall = command = "b"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 430)
trigger2 = movecontact

;---------------------------------------------------------------------------
;Jump Light Punch
[State -1, Jump Light Punch]
type = ChangeState
value = 600
triggerall = command = "x"
triggerall = statetype = A
trigger1 = ctrl
;trigger2 = stateno = 600 && movecontact
;---------------------------------------------------------------------------
;Jump Strong Punch
[State -1, Jump Strong Punch]
type = ChangeState
value = 610
triggerall = command = "y" && command != "holddown"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 || stateno = 630 ;jump_x or jump_a
trigger2 = movecontact
;---------------------------------------------------------------------------
;Jump d Strong Punch
[State -1, Jump Strong Punch]
type = ChangeState
value = 620
triggerall = command = "y" && command = "holddown"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = [600,620) || stateno = (620,640]
trigger2 = movecontact
;---------------------------------------------------------------------------
;Jump Light Kick
[State -1, Jump Light Kick]
type = ChangeState
value = 630
triggerall = command = "a"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 1350 ;Air blocking

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
trigger3 = stateno = 1350 ;Air blocking
