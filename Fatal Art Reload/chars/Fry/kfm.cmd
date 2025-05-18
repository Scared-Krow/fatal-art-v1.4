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
command = ~D, F, D, F, x
time = 20
buffer.time = 3

[Command]
name = "TripleKFPalm"   ;Same name as above
command = ~D, F, D, F, y
time = 20
buffer.time = 3

[Command]
name = "LVL2"
command = ~D, B, D, B, x;~F, D, DF, F, D, DF, x
time = 20
buffer.time = 3

[Command]
name = "LVL2"   ;Same name as above
command = ~D, B, D, B, y;~F, D, DF, F, D, DF, y
time = 20
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
time = 3
buffer.time = 3

[Command]
name = "blocking" ;Same name as above (buttons in opposite order)
command = b+y
time = 3
buffer.time = 3

[Command]
name = "upper_x"
command = ~F, D, $F, x
time = 15
buffer.time = 3

[Command]
name = "upper_y"
command = ~F, D, $F, y
time = 15
buffer.time = 3

[Command]
name = "upper_xy"
command = ~F, D, $F, x+y
time = 15
buffer.time = 3
[Command]
name = "upper_xy"
command = ~F, D, $F, y+x
time = 15
buffer.time = 3


[Command]
name = "QCF_x"
command = ~D, F, x
buffer.time = 3

[Command]
name = "QCF_y"
command = ~D, F, y
buffer.time = 3

[Command]
name = "QCF_xy"
command = ~D, F, x+y
buffer.time = 3

[Command]
name = "QCB_x"
command = ~D, B, x
buffer.time = 3

[Command]
name = "QCB_y"
command = ~D, B, y
buffer.time = 3

[Command]
name = "QCB_xy"
command = ~D, B, x+y
buffer.time = 3

[Command]
name = "QCF_a"
command = ~D, F, a
buffer.time = 3

[Command]
name = "QCF_b"
command = ~D, F, b
buffer.time = 3

[Command]
name = "QCF_ab"
command = ~D, F, a+b
buffer.time = 3

[Command]
name = "QCB_a"
command = ~D, B, a
buffer.time = 3

[Command]
name = "QCB_b"
command = ~D, B, b
buffer.time = 3

[Command]
name = "QCB_ab"
command = ~D, B, a+b
buffer.time = 3

[Command]
name = "strike"
command = /$B,y
time = 1
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

;-| Double Tap |-----------------------------------------------------------
[Command]
name = "FF"     ;Required (do not remove)
command = F, F
time = 15
buffer.time = 6

[Command]
name = "BB"     ;Required (do not remove)
command = B, B
time = 15
buffer.time = 6

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
buffer.time = 1

[Command]
name = "start"
command = s
time = 1
buffer.time = 3

[Command]
name = "hold_s"
command = /s
time = 1
buffer.time = 3

;-| ‚Q`‚RŒÂ‚Ìƒ{ƒ^ƒ““¯Žž‰Ÿ‚µ‹Z |-----------------------------------------------
[Command]
name = "abc"
command = a+b+c
time = 1
buffer.time = 3

[Command]
name = "xy"
command = x+y
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

[Command]
name = "hold_y" ;Required (do not remove)
command = /y
time = 1
buffer.time = 3

[Command]
name = "hold_b";Required (do not remove)
command = /b
time = 1
buffer.time = 3

[Command]
name = "hold_y" ;Required (do not remove)
command = /w
time = 1
buffer.time = 3

[Command]
name = "hold_b";Required (do not remove)
command = /w
time = 1
buffer.time = 3

[Command]
name = "hold_z" ;Required (do not remove)
command = /z
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
value = 3000
triggerall = command = "TripleKFPalm"
triggerall = power >= 3000
triggerall = statetype != A
trigger1 = ctrl
trigger2 = hitdefattr = SC, NA, SA, HA
trigger2 = stateno != [3050,3100)
trigger2 = movecontact
trigger3 = stateno = 1310 || stateno = 1330 ;From blocking
trigger4 = stateno = 101
;---------------------------------------------------------------------------
;Smash Kung Fu Upper (uses one super bar)
[State -1, Smash Kung Fu Upper]
type = ChangeState
value = 3050
triggerall = command = "LVL2"
triggerall = power >= 2000
triggerall = statetype != A
trigger1 = ctrl
trigger2 = hitdefattr = SC, NA, SA, HA
trigger2 = stateno != [3050,3100)
trigger2 = movecontact
trigger3 = stateno = 1310 || stateno = 1330 ;From blocking
trigger4 = stateno = 101
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
trigger2 = (stateno = [200,299]) || (stateno = [400,499])
trigger2 = stateno != 440 ;Except for sweep kick
trigger2 = movecontact
trigger3 = stateno = 1310 || stateno = 1330 ;From blocking
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
;Step Dasg
[State 0]
type = ChangeState
triggerall = var(16) >= 1
triggerall = command = "FF" 
triggerall = numexplod(44060) <= 0
triggerall = statetype != A
trigger1 = stateno = [200,299] && movecontact
trigger2 = stateno = [400,499] && movecontact
value = 103
;---------------------------------------------------------------------------
;FRY CANCEL
[State -1, Light Kung Fu Zankou]
type = ChangeState
value = 10211
triggerall = HitDefAttr != S,ST,NT,HA,HP,HT
triggerall = command = "abc"
triggerall = var(15) >= 500 && var(16)<=0
triggerall = statetype !=A
trigger1 = var(1) && movecontact ;Use combo condition (above)
trigger2 = movecontact 
;---------------------------------------------------------------------------
;AIR FRY CANCEL
[State -1, Light Kung Fu Zankou]
type = ChangeState
value = 10212
triggerall = command = "abc"
triggerall = var(15) >= 500
triggerall = statetype = A
trigger1 = var(1) && movecontact ;Use combo condition (above)
trigger2 = movecontact 
;---------------------------------------------------------------------------
;The taunt is more important than any other goddamn changestate in this entire file
[State -1, 0]
type = ChangeState
value = 195
triggerall = command = "start"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = movecontact = 1
trigger3 = stateno = 440

;---------------------------------------------------------------------------
;Fry install
[State -1, 0]
type = ChangeState
value = 800
triggerall = command = "ax"
triggerall = statetype != A
triggerall = var(15) = 1000
trigger1 = ctrl
trigger2 = var(1)
trigger3 = movecontact = 1
trigger3 = stateno = 440
;---------------------------------------------------------------------------
;Fry install
[State -1, 0]
type = ChangeState
value = 800
triggerall = TeamMode != Tag
triggerall = command = "d"
triggerall = statetype != A
triggerall = var(15) = 1000
trigger1 = ctrl
trigger2 = var(1)
trigger3 = movecontact = 1
trigger3 = stateno = 440
;---------------------------------------------------------------------------
;Fast Kung Fu Upper (1/3 super bar)
[State -1, Fast Kung Fu Upper]
type = ChangeState
value = 5193
triggerall = command = "upper_xy"
triggerall= statetype != A
triggerall = map(exdp)=0
trigger1 = var(1) ;Use combo condition (above)
trigger2 = movecontact
trigger3 = stateno = 101
;---------------------------------------------------------------------------
;Light Kung Fu Upper
[State -1, Light Kung Fu Upper]
type = ChangeState
value = 5190
triggerall = command = "upper_x"
triggerall = command != "upper_xy"
trigger1 = var(1) ;Use combo condition (above)
triggerall= statetype != A
trigger2 = stateno = 101
;---------------------------------------------------------------------------
;Strong Kung Fu Upper
[State -1, Strong Kung Fu Upper]
type = ChangeState
value = 5196
triggerall = command = "upper_y"
trigger1 = var(1) ;Use combo condition (above) 
triggerall= statetype != A
trigger2 = stateno = 101
;---------------------------------------------------------------------------
;214 KK 
[State -1, EX Command Grab]
type = ChangeState
value = 1604
triggerall = power >= 1000
triggerall = command = "QCB_ab"
trigger1 = var(1) 
triggerall= statetype != A
trigger2 = stateno = 101
;---------------------------------------------------------------------------
;214 LK 
[State -1, L Command Grab]
type = ChangeState
value = 1600
triggerall = command = "QCB_a"
trigger1 = var(1) 
triggerall= statetype != A
trigger2 = stateno = 101
;---------------------------------------------------------------------------
;214 SK 
[State -1, S Command Grab]
type = ChangeState
value = 1602
triggerall = command = "QCB_b"
trigger1 = var(1) 
triggerall= statetype != A
trigger2 = stateno = 101
;---------------------------------------------------------------------------
;Fast Kung Fu Blow (1/3 super bar)
[State -1, Fast Kung Fu Blow]
type = ChangeState
value = 1220
triggerall = command = "QCB_xy"
triggerall= statetype != A
triggerall = var(36)<=0
triggerall = power >= 1000
trigger1 = var(1) ;Use combo condition (above)
trigger2 = movecontact
trigger3 = stateno = 101
;---------------------------------------------------------------------------
;Light Kung Fu Blow
[State -1, Light Kung Fu Blow]
type = ChangeState
value = 1200
triggerall = command = "QCB_x"
trigger1 = var(1) ;Use combo condition (above)
trigger1 = statetype != A
trigger2 = stateno = 101
trigger2 = stateno != 1210
;---------------------------------------------------------------------------
;Strong Kung Fu Blow
[State -1, Strong Kung Fu Blow]
type = ChangeState
value = 1210
triggerall = command = "QCB_y"
trigger1 = var(1) ;Use combo condition (above)
trigger1 = statetype != A
trigger2 = stateno = 101
trigger2 = stateno != 1200
;---------------------------------------------------------------------------
;S REVERSAL ART
[State -1, ArcSys is my favorite fighting game producer]
type = ChangeState
value = 1300
triggerall = NumHelper(2010) = 0
triggerall = var(15) >= 100
triggerall = command = "blocking"
trigger1 = ctrl
trigger1 = statetype = S
trigger2 = stateno = 1310 || stateno = 1330
;---------------------------------------------------------------------------
;S REVERSAL ART
[State -1, ArcSys is my favorite fighting game producer]
type = ChangeState
value = 1300
triggerall = NumHelper(2010) = 0
triggerall = var(15) >= 100
triggerall = TeamMode != Tag
triggerall = command = "w"
trigger1 = ctrl
trigger1 = statetype = S
trigger2 = stateno = 1310 || stateno = 1330
;---------------------------------------------------------------------------
;Far Kung Fu Zankou
[State -1, Far Kung Fu Zankou]
type = ChangeState
value = 1502
triggerall = command = "QCF_ab"
triggerall = power >= 1000
triggerall = map(exball)<=0
triggerall = statetype != A
trigger1 = var(1) ;Use combo condition (above)
trigger2 = movecontact
trigger3 = stateno = 101
;---------------------------------------------------------------------------
;FRYING PAN HADOUKEN
[State -1, Light Kung Fu Zankou]
type = ChangeState
value = 1400
triggerall = command = "QCF_a"
trigger1 = var(1) ;Use combo condition (above)
trigger1 = statetype != A
trigger2 = stateno = 101
;---------------------------------------------------------------------------
;Strong Kung Fu Zankou
[State -1, Strong Kung Fu Zankou]
type = ChangeState
value = 1500
triggerall = command = "QCF_b"
trigger1 = var(1) ;Use combo condition (above)
trigger1 = statetype != A
trigger2 = stateno = 101
;===========================================================================
;Hop
[State -1, Hop]
type = ChangeState
value = 9001
triggerall=map(hop)=0
triggerall = stateno != 221
triggerall = command = "z" 
triggerall = statetype != A
trigger1 = var(1)
trigger2 = ctrl
;trigger4 = stateno = 1011
;---------------------------------------------------------------------------
;Run Back
[State -1, Run Back]
type = ChangeState
value = 9000
trigger1 = command = "BB"
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
;Run Fwd
[State -1, Run Fwd]
type = ChangeState
value = 100
triggerall = stateno != 100
trigger1 = command = "FF"
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
trigger3 = stateno = 101
;---------------------------------------------------------------------------
;Overhead
[State -1, Overhead]
type = ChangeState
value = 221
triggerall = command = "c"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 410 && movecontact  
trigger3 = stateno = 210 && movecontact 
trigger4 = stateno = 240 && movecontact 
trigger5 = stateno = 220 && movecontact && prevstateno != 221
trigger6 = stateno = 230 && movecontact 
trigger7 = stateno = 200 && movecontact 
trigger8 = stateno = 101
;---------------------------------------------------------------------------
;Stand Strong Punch
[State -1, Stand Strong Punch]
type = ChangeState
value = 210
triggerall = command = "y"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 230 && movecontact
trigger3 = stateno = 200 && movecontact 
trigger4 = stateno = 101

[state -1, Enryu Haibi Follow]
type = changestate
triggerall = ifelse(p2dist X> 0, command = "y", command = "y")
triggerall = stateno = 210 && statetype != A
trigger1 = movecontact && animelemtime(9) < 0
value = 220
[state -1, Enryu Haibi Follow]
type = changestate
triggerall = ifelse(p2dist X> 0, command = "y", command = "y")
triggerall = stateno = 221 && statetype != A
trigger1 = movecontact && animelemtime(14) < 0
value = 220
[state -1, Enryu Haibi Follow]
type = changestate
triggerall = ifelse(p2dist X> 0, command = "QCB_y", command = "QCB_y")
triggerall = stateno = 220 && statetype != A
trigger1 = movecontact && animelemtime(14) < 0
value = 1210
[state -1, Enryu Haibi Follow]
type = changestate
triggerall = ifelse(p2dist X> 0, command = "QCB_x", command = "QCB_x")
triggerall = stateno = 220 && statetype != A
trigger1 = movecontact && animelemtime(14) < 0
value = 1200
[state -1, Enryu Haibi Follow]
type = changestate
triggerall = ifelse(p2dist X> 0, command = "QCB_y", command = "QCB_y")
triggerall = stateno = 420 && statetype != A
trigger1 = movecontact && animelemtime(14) < 0
value = 1210
[state -1, Enryu Haibi Follow]
type = changestate
triggerall = ifelse(p2dist X> 0, command = "QCB_x", command = "QCB_x")
triggerall = stateno = 420 && statetype != A
trigger1 = movecontact && animelemtime(14) < 0
value = 1200
;---------------------------------------------------------------------------
;Jumping Launcher
[State -1, Stand Light Punch]
type = ChangeState
value = 650
triggerall = stateno = 9001
triggerall = command = "c"
triggerall = var(32)<=0 
trigger1 = statetype = A 
trigger1 = ctrl

;---------------------------------------------------------------------------
;Stand Strong Punch
[State -1, Stand Strong Punch]
type = ChangeState
value = 220
triggerall = command = "strike"
trigger1 = statetype = S
trigger1 = ctrl
;---------------------------------------------------------------------------
;f.LK
[State -1, Stand Light Kick]
type = ChangeState
value = 241
triggerall = command = "a"
triggerall = command = "holdfwd"
triggerall = command != "holddown"
triggerall = stateno != 100
triggerall = statetype = S
trigger1 = ctrl
trigger2 = var(1)
;---------------------------------------------------------------------------
;Stand Light Kick
[State -1, Stand Light Kick]
type = ChangeState
value = 230
triggerall = command = "a"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 430 && movecontact
trigger3 = stateno = 200 && movecontact
trigger4 = stateno = 101

;---------------------------------------------------------------------------
;Standing Strong Kick
[State -1, Standing Strong Kick]
type = ChangeState
value = 240
triggerall = command = "b"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 230 && movecontact
trigger3 = stateno = 210 && movecontact 
trigger4 = stateno = 101
;---------------------------------------------------------------------------
;Crouching Light Punch
[State -1, Crouching Light Punch]
type = ChangeState
value = 400
triggerall = command = "x"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = stateno = 101
trigger3 = stateno = 400 && movecontact
;---------------------------------------------------------------------------
;Crouching Strong Punch
[State -1, Crouching Strong Punch]
type = ChangeState
value = 410
triggerall = command = "y"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl 
trigger2 = stateno = 400 && movecontact 
trigger3 = stateno = 430 && movecontact
trigger4 = stateno = 101
;---------------------------------------------------------------------------
;Crouching Light Kick
[State -1, Crouching Light Kick]
type = ChangeState
value = 430
triggerall = command = "a"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = stateno = 430 && movecontact
trigger3 = stateno = 400 && movecontact 
trigger4 = stateno = 101
;---------------------------------------------------------------------------
;Crouching Strong Kick
[State -1, Crouching Strong Kick]
type = ChangeState
value = 440
triggerall = command = "b"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = stateno = 430 && movecontact 
trigger3 = stateno = 101
;---------------------------------------------------------------------------
;Jump Light Punch
[State -1, Jump Light Punch]
type = ChangeState
value = 600
triggerall = command = "x"
trigger1 = statetype = A
trigger1 = ctrl
trigger3 = stateno = 1350 ;Air blocking

;---------------------------------------------------------------------------
;Jump Strong Punch
[State -1, Jump Strong Punch]
type = ChangeState
value = 610
triggerall = command = "y"
triggerall = var(31)<=3
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 || stateno = 630 ;jump_x or jump_a
trigger2 = movecontact
trigger3 = stateno = 1350 ;Air blocking

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
trigger3 = stateno = 1350 ;Air blocking
;---------------------------------------------------------------------------
;Jump Dust
[State -1, Jump Overhead]
type = ChangeState
value = 651
triggerall = cond(var(16)>=1,var(15)>=75,var(15)>=0)
triggerall = command = "c"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 || stateno = 630
trigger2 = movecontact
trigger3 = stateno = 1350 ;Air blocking
