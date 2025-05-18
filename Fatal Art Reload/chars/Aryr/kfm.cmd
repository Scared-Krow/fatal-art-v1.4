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
command.buffer.time = 3


;-| Super Motions |--------------------------------------------------------
;The following two have the same name, but different motion.
;Either one will be detected by a "command = TripleKFPalm" trigger.
;Time is set to 20 (instead of default of 15) to make the move
;easier to do.
;
[Command]
name = "TripleKFPalm"
command = ~D, DF, F, D, DF, F, x
time = 25
buffer.time = 3

[Command]
name = "TripleKFPalm"
command = ~D, DF, F, D, DF, F, ~x
time = 25
buffer.time = 3

[Command]
name = "TripleKFPalm"   ;Same name as above
command = ~D, DF, F, D, DF, F, y
time = 25
buffer.time = 3

[Command]
name = "TripleKFPalm"   ;Same name as above
command = ~D, DF, F, D, DF, F, ~y
time = 25
buffer.time = 3

[Command]
name = "2xQCBx"
command = ~D, DB, B, D, DB, B, a;~F, D, DF, F, D, DF, x
time = 25
buffer.time = 3

[Command]
name = "2xQCBx"
command = ~D, DB, B, D, DB, B, b;~F, D, DF, F, D, DF, y
time = 25
buffer.time = 3

[Command]
name = "2xQCBx"
command = ~D, DB, B, D, DB, B, ~a;~F, D, DF, F, D, DF, x
time = 25
buffer.time = 3

[Command]
name = "2xQCBx"
command = ~D, DB, B, D, DB, B, ~b;~F, D, DF, F, D, DF, y
time = 25
buffer.time = 3

[Command]
name = "2xQCFK"
command = ~D, F, D, F, a;~F, D, DF, F, D, DF, x
time = 25
buffer.time = 3

[Command]
name = "2xQFCK"
command = ~D, F, D, F, ~a;~F, D, DF, F, D, DF, y
time = 25
buffer.time = 3

[Command]
name = "2xQCFK"
command = ~D, F, D, F, b;~F, D, DF, F, D, DF, x
time = 25
buffer.time = 3

[Command]
name = "2xQFCK"
command = ~D, F, D, F, ~b;~F, D, DF, F, D, DF, y
time = 25
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

;-| Special Motions |------------------------------------------------------
[Command]
name = "blocking"
command = y+b
time = 6
buffer.time = 3

[Command]
name = "blocking" ;Same name as above (buttons in opposite order)
command = b+y
time = 6
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
command = ~F, D, DF, x+y
buffer.time = 3

[Command]
name = "QCF_x"
command = ~D, DF, F, x
buffer.time = 3

[Command]
name = "QCF_x"
command = ~D, DF, F, ~x
buffer.time = 3

[Command]
name = "bQCF_x"
command = ~D, DF, F, ~x
buffer.time = 6

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
buffer.time = 3

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
name = "FF_ab"
command = F, F, a+b
buffer.time = 3

[Command]
name = "FF_a"
command = F, F, a
buffer.time = 3

[Command]
name = "FF_b"
command = F, F, b
buffer.time = 3

[Command]
name = "DD_x+y"
command = D, D, x+y
buffer.time = 3

[Command]
name = "B_y"
command = B, y
buffer.time = 3

;-| Double Tap |-----------------------------------------------------------
[Command]
name = "FF"     ;Required (do not remove)
command = F, F
time = 15
buffer.time = 3

[Command]
name = "BB"     ;Required (do not remove)
command = B, B
time = 10
buffer.time = 6

[Command]
name = "aFF"     ;Required (do not remove)
command = $F, ~F, F
time = 15
buffer.time = 6

[Command]
name = "aBB"     ;Required (do not remove)
command = $B, ~B, B
time = 10
buffer.time = 3

;-| 2/3 Button Combination |-----------------------------------------------
[Command]
name = "recovery";Required (do not remove)
command = x+y
time = 1
buffer.time = 3

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
time = 3
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
time = 5
buffer.time = 3

[Command]
name = "holddown";Required (do not remove)
command = /$D
time = 1
buffer.time = 3

[Command]
name = "holdw";Required (do not remove)
command = /w
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

;===========================================================================
;---------------------------------------------------------------------------
;Smash Kung Fu Upper (uses one super bar)
[State -1, Smash Kung Fu Upper]
type = ChangeState
value = 4000
triggerall = command = "TripleKFPalm"
triggerall = power >= 3000
triggerall= stateno != 810
triggerall = statetype != A
trigger1 = ctrl
trigger2 = movecontact


[State 3500, 214214K]
type = ChangeState
value = 3500
triggerall = command = "2xQCBx"
triggerall = power >= 2000
triggerall= stateno != 810
triggerall = statetype != A
trigger1 = ctrl
trigger2 = movecontact

[State 3500, 236236K]
type = ChangeState
value = 3200
triggerall = command = "2xQCFK"
triggerall = power >= 2000
triggerall= stateno != 810
triggerall = statetype = A
triggerall = movetype != H
trigger1 = ctrl
trigger2 = movecontact
trigger3 = stateno != [3050,3100)

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
;===========================================================================
;This is not a move, but it sets up var(1) to be 1 if conditions are right
;for a combo into a special move (used below).
;Since a lot of special moves rely on the same conditions, this reduces
;redundant logic.
[State Combo Condition Reset]
type = VarSet
trigger1 = 1
var(1) = 0

[State Combo Condition Check]
type = VarSet
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200,299]) || (stateno = [400,499])
trigger2 = stateno != 440 ;Except for sweep kick
trigger2 = movecontact
trigger3 = stateno = 1310 || stateno = 1330 ;From blocking
var(1) = 1
;---------------------------------------------------------------------------
;Taunt
[State -1, Taunt]
type = ChangeState
value = 195
triggerall = command = "start"
trigger1 = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
[State 3856, Launcher]
type = ChangeState
value = 3856
triggerall = command = "z"
triggerall = statetype != A
triggerall = var(31)<=1
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact 
trigger3 = stateno = 230 && movecontact 
trigger4 = stateno = 410 && movecontact 
trigger5 = stateno = 240 && movecontact 
trigger6 = stateno = 230 && movecontact 
trigger7 = stateno = 210 && movecontact
trigger8 = stateno = 411 && movecontact 
trigger9 = stateno = 430 && movecontact
;trigger10 = stateno = 440 && movecontact 
trigger10 = stateno = 101


[State 40, Jump Cancel]
type = changestate
triggerall= var(32)<=1
triggerall = command = "holdup"
triggerall = Statetype != A
trigger1 = stateno = 3856 
trigger1 = movehit
value = 40
;---------------------------------------------------------------------------
[State 3001, Overhead]
type = ChangeState
value = 3001
triggerall = command = "c"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 410 && movecontact 
trigger3 = stateno = 210 && movecontact 
trigger4 = stateno = 411 && movecontact 
trigger5 = stateno = 211 && movecontact
trigger6 = stateno = 240 && movecontact
trigger7 = stateno = 101 
;---------------------------------------------------------------------------
[State 46, Double Jump]
type = ChangeState
value = 46
triggerall = command = "holdup"
triggerall = var(30)<=0
trigger1 = stateno = 610 && movehit
trigger2 = stateno = 600 && movehit
trigger3 = stateno = 630 && movehit
trigger4 = stateno = 640 && movehit
;---------------------------------------------------------------------------
;Fast Kung Fu Palm (1/3 super bar)
[State 1004, 236PP: EX Sugoi Rush]
type = ChangeState
value = 1004
triggerall = command = "QCF_xy"
triggerall= statetype != A
triggerall = power >= 1000
triggerall= var(34)< 1
trigger1 = movecontact
trigger2 = ctrl
triggerall= stateno != 1004 && stateno != 1005
;---------------------------------------------------------------------------
[State 1000, 236LP: L Sugoi Rush]
type = ChangeState
value = 1000
triggerall = command = "QCF_x"
triggerall = statetype != A
trigger1 = var(1) ;Use combo condition (above) 
trigger2 = ctrl

[state 1002a, 236LP H Followup]
type = changestate
triggerall = command = "holdfwd"
triggerall = command = "y"
triggerall = command != "xy"
triggerall = stateno = 1000
trigger1 = movehit
value = 1002

[State 1004a, 236LP EX Followup]
type = changestate
triggerall = power >= 1000
triggerall = command = "xy"
triggerall = stateno = 1000 && var(34) < 1
trigger1 = movecontact
value = 1004

;---------------------------------------------------------------------------
;Strong Kung Fu Palm
[State 1002, 236HP: S Sugoi Rush]
type = ChangeState
value = 1002
triggerall = command = "QCF_y"
triggerall = statetype != A
trigger1 = var(1) ;Use combo condition (above)
trigger2 = ctrl
;---------------------------------------------------------------------------
;Fast Kung Fu Blow (1/3 super bar)
[State 7660, 214PP: EX Bomb Throw]
type = ChangeState
value = 7660
triggerall = command = "QCB_xy"
triggerall = Map(EXBOMB) <= 0
triggerall = power >= 1000
triggerall= stateno != 7660
triggerall = stateno != 1000
triggerall = statetype != A
trigger1 = var(1) ;Use combo condition (above)
trigger2 = movecontact
trigger3 = stateno = 440 && movecontact 

[State 7665, 214PP6: EX Bomb Throw Alternate]
type = changestate
triggerall = command = "holdfwd"
trigger1 = stateno = 7660 && statetype != A
trigger1 = time > 0
trigger1 = time < 9
value = 7665

;---------------------------------------------------------------------------
[State 7655, 214LP: Combo Bomb Throw]
type = ChangeState
value = 7655
triggerall = !numexplod(107655)
triggerall = Numhelper(7656) = 0
triggerall = command = "QCB_x"
triggerall = statetype != A
trigger1 = var(1) ;Use combo condition (above)
trigger2 = ctrl
trigger3 = stateno = 440 && movecontact 


;---------------------------------------------------------------------------
[State 7658, 214HP: Setplay Bomb Throw]
type = ChangeState
value = 7658
triggerall = !numexplod(107658)
triggerall = Numhelper(7659) = 0
triggerall = command = "QCB_y"
triggerall = statetype != A
trigger1 = var(1) ;Use combo condition (above)
trigger2 = ctrl
trigger3 = stateno = 440 && movecontact 

[State 1000a, 214P>236LP: L Sugoi Rush]
type = ChangeState
value = 1000
triggerall = command = "bQCF_x"
trigger1 = stateno = 7655 && Time > 22
trigger2 = stateno = 7658 && Time > 24
;---------------------------------------------------------------------------
[State 1014, 236KK: EX Kicks]
type = ChangeState
value = 1015
triggerall = stateno != 3200 
triggerall = command = "QCF_ab"
triggerall= statetype = A
triggerall = power >= 1000
triggerall= stateno != 1015
triggerall= Map(EXQCFK)=0
trigger1 = ctrl
trigger2 = var(1)
trigger3 = movecontact
;---------------------------------------------------------------------------
[State 1014, 236KK: EX Kicks]
type = ChangeState
value = 1014
triggerall = command = "QCF_ab"
triggerall = power >= 1000
triggerall= statetype != A
triggerall= stateno != 1014
triggerall= Map(EXQCFK)=0
trigger1 = ctrl
trigger2 = var(1)
trigger3 = movecontact
;---------------------------------------------------------------------------
[State 1010, 236LK: Ground L Kicks]
type = ChangeState
value = 1010
triggerall = command = "QCF_a"
triggerall = var(33)<=0
triggerall = statetype != A
trigger1 = var(1) ;Use combo condition (above)
trigger2 = ctrl

[State 1010, 236LK: Air L Kicks]
type = ChangeState
value = 1011
triggerall = command = "QCF_a"
triggerall = var(33)<=0
triggerall = statetype = A
trigger1 = var(1) ;Use combo condition (above)
trigger2 = ctrl
trigger3 = movecontact && stateno = [600,640]
;---------------------------------------------------------------------------
[State 1012, 236HK: Ground H Kicks]
type = ChangeState
value = 1012
triggerall = command = "QCF_b"
triggerall = var(37)<=0
triggerall = statetype != A
trigger1 = var(1) ;Use combo condition (above)
trigger2 = ctrl

[State 1012, 236HK: Air H Kicks]
type = ChangeState
value = 1013
triggerall = command = "QCF_b"
triggerall = var(37)<=0
triggerall = statetype = A
trigger1 = var(1) ;Use combo condition (above)
trigger2 = ctrl
trigger3 = movecontact && stateno = [600,640]
;---------------------------------------------------------------------------
[State 1220, j236PP: EX Crush Kicks]
type = ChangeState
value = 1220
triggerall = power >= 1000
triggerall= statetype = A
triggerall = command = "QCF_xy"
triggerall = Map(jEXQCFP)<= 0
trigger1 = ctrl
trigger2 = movecontact && stateno = [600,640]
trigger3 = movecontact && stateno = [1200,1211]
;---------------------------------------------------------------------------
[State 1200, j236LP: L Crush Kicks]
type = ChangeState
value = 1200
triggerall = statetype = A
triggerall = statetype != S && statetype != C
triggerall = command = "QCF_x"
trigger1 = ctrl
trigger2 = movecontact && stateno = [600,640]
;---------------------------------------------------------------------------
[State 1210, j236HP: H Crush Kicks]
type = ChangeState
value = 1210
triggerall = statetype = A
triggerall = statetype != S && statetype != C
triggerall = command = "QCF_y"
trigger1 = ctrl
trigger2 = movecontact && stateno = [600,640]

;---------------------------------------------------------------------------
;REVERSAL ART
[State -1, Hehe Grandblue]
type = ChangeState
value = 1300
triggerall = command = "blocking"
trigger1 = ctrl
triggerall = statetype != A
;---------------------------------------------------------------------------
;REVERSAL ART
[State -1, W]
type = ChangeState
value = 1300
triggerall = TeamMode != Tag
triggerall = command = "w"
trigger1 = ctrl
triggerall = statetype != A
;===========================================================================
;---------------------------------------------------------------------------
[State 215, 4HP]
type = ChangeState
value = 215
triggerall = command = "holdback"
triggerall = command = "y" 
triggerall = stateno != 215 && stateno != 220
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = [200,240] && movecontact

[State 220, 6HP]
type = ChangeState
value = 220
triggerall = command = "holdfwd"
triggerall = command = "y"
triggerall = statetype = S
triggerall = stateno != 215 && stateno != 220 
trigger1 = ctrl
trigger2 = stateno = [200,240] && movecontact
;---------------------------------------------------------------------------
;grab
[State 800, grab]
type = changestate
value = 800
triggerall = command = "ax"
trigger1 = statetype = S
trigger1 = ctrl
;---------------------------------------------------------------------------
;grab
[State 800, grab]
type = changestate
value = 800
triggerall = TeamMode != Tag
triggerall = command = "d" || command = "w"
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
[State 102, Run Fwd]
type = ChangeState
value = 102
trigger1 = command = "FF"
trigger1 = statetype = S
trigger1 = var(1) ;Use combo condition (above)
trigger1 = ctrl
 
;---------------------------------------------------------------------------
[State 7662, Airdash]
type = ChangeState
value = 7662
triggerall = command = "aFF"
triggerall = var(2) = 0
trigger1 = statetype = A
trigger1 = ctrl
triggerall = stateno != 7663
triggerall = stateno != 105


;---------------------------------------------------------------------------
[State 105, Backdash]
type = ChangeState
value = 105
trigger1 = command = "BB"
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
[State 7663, Air Backdash]
type = ChangeState
value = 7663
triggerall = command = "aBB"
triggerall = var(3) = 0
trigger1 = statetype = A
trigger1 = ctrl
triggerall = stateno != 7662
triggerall = stateno != 105
;===========================================================================
;---------------------------------------------------------------------------
[State 200, LP]
type = ChangeState
value = 200
triggerall = command = "x"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact
trigger3 = stateno = 101
;---------------------------------------------------------------------------
[State 210, HP]
type = ChangeState
value = 210
triggerall = command = "y"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact
trigger3 = (stateno = 230) && movecontact 
trigger4 = stateno = 101

[State 220a, 5HP>HP String]
type = changestate
triggerall = command != "holddown"
triggerall = command = "y"
triggerall = stateno = 210 && statetype != A
trigger1 = movecontact 
value = 220

;[State 40c, 5HP>HP String Jump Cancel]
;type = changestate 
;triggerall = command = "holdup"
;trigger1 = stateno = 220
;value = 40

;---------------------------------------------------------------------------
[State 230, LK]
type = ChangeState
value = 230
triggerall = command = "a"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact
trigger3 = stateno = 430 && movecontact
trigger4 = stateno = 101

;---------------------------------------------------------------------------
[State 240, HK]
type = ChangeState
value = 240
triggerall = command = "b"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact 
trigger3 = (stateno = 230) && movecontact 
trigger4 = stateno = 101

;---------------------------------------------------------------------------
[State 400, 2LP]
type = ChangeState
value = 400
triggerall = command = "x"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = (stateno = 400) && movecontact

;---------------------------------------------------------------------------
[State 410, 2HP]
type = ChangeState
value = 410
triggerall = command = "y"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 430) || (stateno = 210) 
trigger2 = movecontact

[State 215a, 2HP>HP String]
type = changestate
triggerall = command = "y"
triggerall = stateno = 410
trigger1 = movecontact 
value = 215

;---------------------------------------------------------------------------
[State 430, 2LK]
type = ChangeState
value = 430
triggerall = command = "a"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = (stateno = 430) && movecontact
trigger2 = stateno = 400 && movecontact

;---------------------------------------------------------------------------
[State 441, 2HK]
type = ChangeState
value = 441
triggerall = command = "b"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 430) || (stateno = 240)
trigger2 = movecontact

;---------------------------------------------------------------------------
[State 600, jLP]
type = ChangeState
value = 600
triggerall = command = "x"
triggerall = statetype = A
trigger1 = ctrl
;---------------------------------------------------------------------------
[State 610, jHP]
type = ChangeState
value = 610
triggerall = command = "y"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = (stateno = 600) && movecontact 
trigger3 = (stateno = 630) && movecontact 
triggerall = stateno != 105


[state 45, Double Jump Cancel]
type = changestate
triggerall= var(59)<=0
triggerall = ifelse(p2dist X> 0, command = "holdup", command = "holdup")
triggerall = stateno = 610 && statetype != A
trigger1 = movecontact
value = 45

;---------------------------------------------------------------------------
[State 630, jLK]
type = ChangeState
value = 630
triggerall = command = "a"
triggerall = command != "QCF_a"
triggerall = statetype = A
trigger1 = ctrl
;---------------------------------------------------------------------------
[State 640, jSK]
type = ChangeState
value = 640
triggerall = command = "b"
triggerall = command != "QCF_b"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 || stateno = 630 ;jump_x or jump_a
trigger2 = movecontact
trigger3 = stateno = 1350 ;Air blocking
triggerall = stateno != 105
