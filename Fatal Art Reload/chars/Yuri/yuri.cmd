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
name = "QCFQCFK"
command = ~D, F, D, F, a;~F, D, DF, F, D, DF, x
time = 20
buffer.time = 3

[Command]
name = "QCFQCFK"   ;Same name as above
command = ~D, F, D, F, b;~F, D, DF, F, D, DF, y
time = 20
buffer.time = 3

[Command]
name = "QCFQCFK"
command = ~D, F, D, F, ~a;~F, D, DF, F, D, DF, x
time = 20
buffer.time = 3

[Command]
name = "QCFQCFK"   ;Same name as above
command = ~D, F, D, F, ~b;~F, D, DF, F, D, DF, y
time = 20
buffer.time = 3

[Command]
name = "SmashKFUpper"
command = ~D, B, D, B, x;~F, D, DF, F, D, DF, x
time = 20
buffer.time = 3

[Command]
name = "SmashKFUpper"   ;Same name as above
command = ~D, B, D, B, y;~F, D, DF, F, D, DF, y
time = 20
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
command = ~F, D, DF, x+y
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
name = "QCF_x"
command = ~D, F, x
buffer.time = 3

[Command]
name = "QCF_x"
command = ~D, F, ~x
buffer.time = 3

[Command]
name = "QCF_y"
command = ~D, F, y
buffer.time = 3

[Command]
name = "QCF_y"
command = ~D, F, ~y
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
name = "QCB_a"
command = ~D, DB, B, a
buffer.time = 3

[Command]
name = "QCB_a"
command = ~D, DB, B, ~a
buffer.time = 3

[Command]
name = "QCB_b"
command = ~D, DB, B, b
buffer.time = 3

[Command]
name = "QCB_b"
command = ~D, DB, B, ~b
buffer.time = 3

[Command]
name = "QCB_ab"
command = ~D, DB, B, a+b
buffer.time = 3

[Command]
name = "QCB_ab"
command = ~D, DB, B, ~a+b
buffer.time = 3

[Command]
name = "QCF_a"
command = ~D, DF, F, a
buffer.time = 3

[Command]
name = "QCF_b"
command = ~D, DF, F, b
buffer.time = 3

[Command]
name = "QCF_ab"
command = ~D, DF, F, a+b
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
name = "QCB_c"
command = ~D, DB, B, c
buffer.time = 3

[Command]
name = "QCB_c"
command = ~D, DB, B, ~c
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


[Command]
name = "bFF"     ;Required (do not remove)
command = F, F
time = 15
buffer.time = 12
;-| 2/3 Button Combination |-----------------------------------------------
[Command]
name = "recovery";Required (do not remove)
command = x+y
time = 1
buffer.time = 3

[Command]
name = "a+x";Required (do not remove)
command = a+x
time = 1
buffer.time = 3

[Command]
name = "backa+x";Required (do not remove)
command = /$B,a+x
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

;-| Dir |--------------------------------------------------------------
[Command]
name = "up" ;Required (do not remove)
command = U
time = 1
buffer.time = 3

[Command]
name = "down";Required (do not remove)
command = D
time = 1
buffer.time = 3

;-| ƒ{ƒ^ƒ“‰Ÿ‚µ‚Á‚Ï‚È‚µÝ’è |-----------------------------------------------------------
[Command]
name = "hold_x"
command = /x
time = 1
buffer.time = 3

[Command]
name = "DIVEKICK"
command = /$D, a
buffer.time = 3

[Command]
name = "hold_y"
command = /y
time = 1
buffer.time = 3

[Command]
name = "hold_z"
command = /z
time = 1
buffer.time = 3

[Command]
name = "hold_a"
command = /a
time = 1
buffer.time = 3

[Command]
name = "hold_b"
command = /b
time = 1
buffer.time = 3

[Command]
name = "hold_c"
command = /c
time = 1
buffer.time = 3

[Command]
name = "hold_s"
command = /s
time = 1
buffer.time = 3

[Command]
name = "backgrab"
command = /$B,z
time = 30
buffer.time = 3

[Command]
name = "throwtech"
command = x+a
time = 60
buffer.time = 60
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
value = 3049
triggerall = command = "SmashKFUpper"
triggerall = power >= 3000
triggerall = stateno != [800,810]
triggerall = statetype != A
triggerall = stateno != [300,302]
trigger1 = ctrl
trigger2 = movecontact
trigger3 = stateno = 101

[State -1, Smash Kung Fu Upper]
type = ChangeState
value = 3010
triggerall = command = "QCFQCFK"
triggerall = power >= 2000
triggerall = statetype != A
triggerall = stateno != [800,810]
triggerall = stateno != [300,302]
trigger1 = ctrl
trigger2 = movecontact
trigger3 = stateno = 101

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
triggerall = stateno = [140,151]
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
;Triple Kung Fu Palm (uses one super bar)
;[State -1, Triple Kung Fu Palm]
;type = ChangeState
;value = 3000
;triggerall = command = "TripleKFPalm"
;triggerall = power >= 2000
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
trigger2 = (stateno = [200,299]) || (stateno = [400,499]) || stateno = 1312 || stateno = 1314
trigger2 = stateno != 440 ;Except for sweep kick
trigger2 = movecontact
trigger3 = stateno = 1310 || stateno = 1330 ;From blocking
var(1) = 1

;---------------------------------------------------------------------------
;Light Kung Fu Palm
;[State -1, Light Kung Fu Palm]
;type = ChangeState
;value = 4000
;triggerall = command = "a+x"
;triggerall = statetype != A
;trigger1 = var(1) ;Use combo condition (above)
;trigger1 = ctrl
;---------------------------------------------------------------------------
;Light Kung Fu Palm
;[State -1, Light Kung Fu Palm]
;type = ChangeState
;value = 4002
;triggerall = command = "a+x"
;triggerall = statetype != A
;triggerall = ctrl
;triggerall = stateno != 100
;triggerall = command = "holdback"
;trigger1 = p2bodydist X < 5
;trigger1 = (p2statetype = S) || (p2statetype = C)
;trigger1 = p2movetype != H
;---------------------------------------------------------------------------
;Kung Fu Throw
;[State -1, Kung Fu Throw]
;type = ChangeState
;value = 800
;triggerall = command = "x" && command = "a"
;triggerall = statetype !=A
;triggerall = stateno != 100
;trigger1 = ctrl
;---------------------------------------------------------------------------
;Taunt
[State -1, Taunt]
type = ChangeState
value = 195
triggerall = command = "start"
trigger1 = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
;Reload
[State -1, Reload]
type = ChangeState
value = 3000
triggerall = Map(Bullets) < 6
triggerall = command = "QCB_c"
triggerall = statetype != A
trigger1 = var(1)
trigger2 = ctrl
trigger3 = stateno = 1308 && movecontact
trigger4 = stateno = 2308 && movecontact
trigger5 = stateno = 1200 && movecontact
trigger6 = stateno = 1010 && movecontact
;---------------------------------------------------------------------------
;Light Kung Fu Knee
[State -1, Light Kung Fu Knee]
type = ChangeState
value = 541
triggerall = command = "c"
triggerall = command != "QCB_c"
triggerall = statetype != A
triggerall = var(32)<=2
trigger1 = ctrl
trigger2 = stateno = 240 && movecontact
trigger3 = stateno = 210 && movecontact
trigger4 = stateno = 211 && movecontact
trigger5 = stateno = 241 && movecontact
trigger6 = stateno = 101
;---------------------------------------------------------------------------
;LAUNCHER
[State -1, Light Kung Fu Knee]
type = ChangeState
value = 542
triggerall = command = "z"
triggerall = var(58)<=1
trigger1 = var(1) ;Use combo condition (above)
trigger2 = stateno = 101
;---------------------------------------------------------------------------
;EX LOW SHOTGUN
[State -1, Fast Kung Fu Palm]
type = ChangeState
value = 1020
triggerall = command = "QCF_ab"
triggerall = stateno != [800,810]
triggerall = stateno != 1220 && stateno != 1120
triggerall = power >= 1000
triggerall= statetype != A
triggerall = var(34)<=0
trigger1 = var(1) ;Use combo condition (above)
trigger2 = movecontact
trigger3 = stateno = 101
;---------------------------------------------------------------------------
;LOW SHOTGUN
[State -1, Light Kung Fu Palm]
type = ChangeState
value = 1000
triggerall = command = "QCF_a"
triggerall = statetype != A
trigger1 = var(1) ;Use combo condition (above)
trigger2 = stateno = 101

;---------------------------------------------------------------------------
;LOW SHOTGUN STRONG
[State -1, Strong Kung Fu Palm]
type = ChangeState
value = 1010
triggerall = command = "QCF_b"
triggerall = statetype != A
trigger1 = var(1) ;Use combo condition (above)
trigger2 = stateno = 101

;---------------------------------------------------------------------------
;EX GUNSHOT
[State -1, Fast Kung Fu Upper]
type = ChangeState
value = 1120
triggerall = command = "QCB_xy"
triggerall = stateno != [800,810]
triggerall = stateno != 1220
triggerall = power >= 1000
triggerall= statetype != A
triggerall = var(35)<=0
trigger1 = var(1) ;Use combo condition (above)
trigger2 = movecontact
trigger3 = stateno = 101
;---------------------------------------------------------------------------
;Forward SP
[State -1, f.SP]
type = ChangeState
value = 1312
triggerall = numexplod(9001) <= 1
triggerall = command = "QCF_x"
triggerall = Map(Bullets) > 0
triggerall = statetype != A
triggerall = stateno != 1312
trigger1 = var(1)
trigger2 = ctrl 
trigger3 = stateno = 101
trigger4 = stateno = [1306,1308] && movecontact
trigger5 = stateno = [1000,1010] && movecontact
trigger6 = stateno = [1200,1211] && movecontact
;---------------------------------------------------------------------------
;Back SP
[State -1, f.SP]
type = ChangeState
value = 1314
triggerall = numexplod(9000) <= 1
triggerall = command = "QCF_y"
triggerall = Map(Bullets) > 0
triggerall = statetype != A
triggerall = stateno != 1314
trigger1 = var(1)
trigger2 = ctrl 
trigger3 = stateno = 101
trigger4 = stateno = [1306,1308] && movecontact
trigger5 = stateno = [1000,1010] && movecontact
trigger6 = stateno = [1200,1211] && movecontact
trigger7 = stateno = 1312 && helper(1330), movecontact
;---------------------------------------------------------------------------
;Heavy gunshot
[State -1, Light Kung Fu Palm]
type = ChangeState
value = 2306
triggerall = command = "QCB_y"
triggerall= statetype != A
triggerall = Map(Bullets) > 0
triggerall = stateno != [800,810]
triggerall = stateno != [2306,2308]
trigger1 = var(1)
trigger2 = ctrl 
trigger3 = stateno = 101
trigger4 = stateno = [1306,1308] && movecontact
trigger5 = stateno = [1000,1010] && movecontact
trigger6 = stateno = [1200,1211] && movecontact
trigger7 = stateno = 1312 && helper(1330), movecontact
;---------------------------------------------------------------------------
;Light gunshot
[State -1, Light Kung Fu Palm]
type = ChangeState
value = 1306
triggerall = command = "QCB_x"
triggerall= statetype != A
triggerall = Map(Bullets) > 0
triggerall = stateno != [800,810]
triggerall = stateno != [2306,2308]
triggerall = stateno != [1306,1308]
trigger1 = var(1)
trigger2 = ctrl
trigger3 = stateno = 101
trigger4 = stateno = [1000,1010] && movecontact
trigger5 = stateno = [1200,1211] && movecontact
trigger6 = stateno = 1312 && helper(1330), movecontact
;---------------------------------------------------------------------------
;Light Kung Fu Upper
;[State -1, Light Kung Fu Upper]
;type = ChangeState
;value = 1100
;triggerall = command = "QCB_x"
;triggerall = var(31)<=0
;trigger1 = statetype != A
;trigger1 = var(1) ;Use combo condition (above)
;trigger2 = stateno = 542 && movehit

;---------------------------------------------------------------------------
;EX Minigun
[State -1, Fast Kung Fu Blow]
type = ChangeState
value = 1220
triggerall = command = "QCB_ab"
triggerall = stateno != [800,810]
triggerall = power >= 1000
triggerall= statetype != A
triggerall = stateno != 1020 && stateno != 1120 && stateno != 1220
triggerall = var(36)<=0
trigger1 = var(1) ;Use combo condition (above)
trigger2 = movecontact
trigger3 = stateno = 101

[state -1, Enryu Haibi Follow]
type = changestate
triggerall = command = "QCB_ab"
triggerall = stateno = 1210 && statetype != A
trigger1 = movecontact 
value = 1220
;---------------------------------------------------------------------------
;Light Kung Fu Blow
[State -1, Light Kung Fu Blow]
type = ChangeState
value = 1200
triggerall = command = "QCB_a"
trigger1 = statetype != A
trigger1 = var(1) ;Use combo condition (above)
trigger2 = stateno = 101

[state -1, Enryu Haibi Follow]
type = changestate
triggerall = ifelse(p2dist X> 0, command = "QCB_a", command = "QCB_a")
triggerall = stateno = 1210 && statetype != A
trigger1 = movecontact 
value = 1200

[state -1, Enryu Haibi Follow]
type = changestate
triggerall = ifelse(p2dist X> 0, command = "QCB_a", command = "QCB_a")
triggerall = stateno = 1100 && statetype != A
trigger1 = movecontact 
value = 1200
;---------------------------------------------------------------------------
;Strong Kung Fu Blow
[State -1, Strong Kung Fu Blow]
type = ChangeState
value = 1210
triggerall = command = "QCB_b"
trigger1 = var(1) ;Use combo condition (above)
trigger1 = statetype != A
trigger2 = stateno = 101
;---------------------------------------------------------------------------
;REVERSAL ART
[State -1, ROLLIN ROLLlin ROLiNG]
type = ChangeState
value = 1300
triggerall = command = "blocking"
trigger1 = ctrl
triggerall = statetype != A
trigger2 = stateno = 1310 || stateno = 1330
;REVERSAL ART
[State -1, The joke makes no sense]
type = ChangeState
value = 1300
triggerall = TeamMode != Tag
triggerall = command = "w"
trigger1 = ctrl
trigger1 = statetype != A
trigger2 = stateno = 1310 || stateno = 1330
;===========================================================================
;---------------------------------------------------------------------------
;Run Fwd
[State -1, Run Fwd]
type = ChangeState
value = 100
trigger1 = command = "FF"
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
;Run Back
[State -1, Run Back]
type = ChangeState
value = 105
trigger1 = command = "BB"
trigger1 = statetype = S
trigger1 = ctrl

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
triggerall = command = "d" || command = "w"
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
triggerall = command != "QCB_x"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 400 && movecontact
trigger3 = stateno = 101

;---------------------------------------------------------------------------
;Stand Light Punch
[State -1, Stand Light Punch]
type = ChangeState
value = 202
triggerall = stateno = 200 && movecontact
triggerall = command = "x" 
triggerall = command != "holddown"
trigger1 = statetype = S

;---------------------------------------------------------------------------
;Stand Light Punch
[State -1, Stand Light Punch]
type = ChangeState
value = 201
triggerall = stateno = 202 && movecontact
triggerall = command = "x" 
triggerall = command != "holddown"
trigger1 = statetype = S
;Stand Light Punch
[State -1, Stand Light Punch]
type = ChangeState
value = 242
triggerall = stateno = 202 && movecontact
triggerall = command = "a" 
triggerall = command != "holddown"
trigger1 = statetype = S
[State -1, Stand Light Punch]
type = ChangeState
value = 242
triggerall = stateno = 201 && movecontact
triggerall = command = "a" 
triggerall = command != "holddown"
trigger1 = statetype = S

;---------------------------------------------------------------------------
;Stand Light Punch
[State -1, Stand Light Punch]
type = ChangeState
value = 211
triggerall = stateno = 210 && movecontact
triggerall = command = "y" 
triggerall = command != "holddown"
trigger1 = statetype = S

;---------------------------------------------------------------------------
;Stand Strong Punch
[State -1, Stand Strong Punch]
type = ChangeState
value = 210
triggerall = command = "y"
triggerall = command != "holddown"
triggerall = command != "QCB_y"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 242 && movecontact
trigger3 = stateno = 101
;--------------------------------------------------------------------------
;Stand Light Kick
[State -1, Stand Light Kick]
type = ChangeState
value = 230
triggerall = command = "a"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact  && time > 7 
trigger3 = stateno = 430 && movecontact && time > 4
trigger4 = stateno = 101
;---------------------------------------------------------------------------
;Stand Light Punch
[State -1, Stand Light Punch]
type = ChangeState
value = 231
triggerall = stateno = 230 && movecontact
triggerall = command = "a" 
triggerall = command != "holddown"
trigger1 = statetype = S

;---------------------------------------------------------------------------
;Standing Strong Kick
[State -1, Standing Strong Kick]
type = ChangeState
value = 240
triggerall = command = "b"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact && time > 5
trigger3 = (stateno = 230) && movecontact && time > 6
trigger4 = (stateno = 231) && movecontact 
trigger5 = stateno = 101
;---------------------------------------------------------------------------
;Stand Light Punch
[State -1, Stand Light Punch]
type = ChangeState
value = 241
triggerall = stateno = 240 && movecontact
triggerall = command = "b" 
triggerall = command != "holddown"
trigger1 = statetype = S


;---------------------------------------------------------------------------

;---------------------------------------------------------------------------
;Crouching Light Punch
[State -1, Crouching Light Punch]
type = ChangeState
value = 400
triggerall = command = "x"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = movecontact && stateno = 400
trigger3 = stateno = 101
;---------------------------------------------------------------------------
;Crouching Strong Punch
[State -1, Crouching Strong Punch]
type = ChangeState
value = 410
triggerall = command = "y"
triggerall = command = "holddown"
triggerall = var(21) > 0
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 430)
trigger2 = (movecontact && time > 3) || (movecontact && time > 4)
trigger3 = stateno = 101
;---------------------------------------------------------------------------
;Crouching Light Kick
[State -1, Crouching Light Kick]
type = ChangeState
value = 430
triggerall = command = "a"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = (stateno = 400)
trigger2 = (movecontact && time > 3)
trigger3 = stateno = 101
trigger4 = movecontact && stateno = 430
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
trigger2 = (movecontact) || (movecontact)
trigger3 = stateno = 101
;---------------------------------------------------------------------------
;Jump Light Punch
[State -1, Jump Light Punch]
type = ChangeState
value = 600
triggerall = command = "x"
triggerall = statetype = A
trigger1 = ctrl 
trigger3 = stateno = 1350 ;Air blocking
triggerall = stateno != 105
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
trigger3 = stateno = 1350 ;Air blocking
triggerall = stateno != 105
;---------------------------------------------------------------------------
;Jump Light Kick
[State -1, Jump Light Kick]
type = ChangeState
value = 630
triggerall = command = "a"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 1350 ;Air blocking
triggerall = stateno != 105
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
triggerall = stateno != 105