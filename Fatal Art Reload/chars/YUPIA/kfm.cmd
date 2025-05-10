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
buffer.time = 3
time = 22

[Command]
name = "TripleKFPalm"
command = ~D, DF, F, D, DF, F, ~x
buffer.time = 3
time = 22

[Command]
name = "TripleKFPalm"   ;Same name as above
command = ~D, DF, F, D, DF, F, y
buffer.time = 3
time = 20

[Command]
name = "TripleKFPalm"   ;Same name as above
command = ~D, DF, F, D, DF, F, ~y
buffer.time = 3
time = 20

[Command]
name = "LVL2"
command = ~D, F, D, F, a
time = 20
buffer.time = 3

[Command]
name = "LVL2"
command = ~D, F, D, F, b
time = 20
buffer.time = 3

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
name = "HCF_ab"
command = B, $D, F, a+b
buffer.time = 3
time = 18

[Command]
name = "HCF_ab"
command = B, $D, F, ~a+b
buffer.time = 3
time = 18

[Command]
name = "HCF_a"
command = B, $D, F, a
buffer.time = 3
time = 18

[Command]
name = "HCF_a"
command = B, $D, F, ~a
buffer.time = 3
time = 18

[Command]
name = "HCF_b"
command = B, $D, F, b
buffer.time = 3
time = 18

[Command]
name = "HCF_b"
command = B, $D, F, ~b
buffer.time = 3
time = 18

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
name = "QCF_c"
command = ~D, DF, F, c
buffer.time = 3

[Command]
name = "QCF_c"
command = ~D, DF, F, ~c
buffer.time = 3

[Command]
name = "QCF_z"
command = ~D, DF, F, z
buffer.time = 3

[Command]
name = "QCF_z"
command = ~D, DF, F, ~z
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
name = "QCF_b"
command = ~D, DF, F, b
buffer.time = 3

[Command]
name = "QCF_ab"
command = ~D, DF, F, a+b
buffer.time = 3

[Command]
name = "BDB_a"
command = ~F, D, DF, a
buffer.time = 3

[Command]
name = "BDB_b"
command = ~F, D, DF, ~b
buffer.time = 3

[Command]
name = "BDB_a"
command = ~F, D, DF, ~a
buffer.time = 3

[Command]
name = "BDB_b"
command = ~F, D, DF, b
buffer.time = 3

[Command]
name = "BDB_ab"
command = ~F, D, DF, a+b
buffer.time = 3

[Command]
name = "BDB_ab"
command = ~F, D, DF, ~a+b
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

[Command]
name = "xzc"
command = x+z+c
time = 18
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
name = "buffer_a"
command = a
time = 1
buffer.time = 6

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
name = "buffer_x"
command = x
time = 1
buffer.time = 6

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
name = "hold_w" 
command = /w
time = 1
buffer.time = 3

[Command]
name = "hold_w";Required (do not remove)
command = /y+b
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

;-| ƒ{ƒ^ƒ“‰Ÿ‚µ‚Á‚Ï‚È‚µÝ’è |-----------------------------------------------------------
[Command]
name = "hold_x"
command = /x
time = 1
buffer.time = 3

[Command]
name = "hold_punch"
command = /x
time = 1
buffer.time = 3

[Command]
name = "hold_punch"
command = /y
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
;S Taunt
[State -1, Taunt]
type = ChangeState
value = 198
triggerall = command = "xzc"
triggerall = statetype != A
trigger1 = ctrl

;---------------------------------------------------------------------------
;Taunt
[State -1, Tauntium]
type = ChangeState
value = 195
triggerall = command = "start"
triggerall = statetype != A
trigger1 = ctrl
;===========================================================================

;---------------------------------------------------------------------------
;UNSTABLE: OVERLOAD CANNON 
[State -1, Triple Kung Fu Palm]
type = ChangeState
value = 3000
triggerall = command = "TripleKFPalm"
triggerall = power >= 3000
triggerall = stateno !=810
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = statetype != A
trigger2 = hitdefattr = SC, NA, SA, HA
trigger2 = stateno != [3000,3050)
trigger2 = movecontact
trigger3 = stateno = 1310 || stateno = 1330 ;From blocking
trigger4 = stateno = 22011 && time > 42

;---------------------------------------------------------------------------
;DESOLATION
[State -1, Actin like you wont get command grabbed]
type = ChangeState
value = 3500
triggerall = command = "LVL2"
triggerall = power >= 2000
triggerall = stateno !=810
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = statetype != A
trigger2 = hitdefattr = SC, NA, SA, HA
trigger2 = stateno != [3000,3050)
trigger2 = movecontact
trigger3 = stateno = 1310 || stateno = 1330

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
[State -1, Combo condition Reset]
type = VarSet
trigger1 = 1
var(1) = 0

[State -1, Combo condition Check]
type = VarSet
triggerall = stateno != 1202 || stateno != 2000
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200,299]) || (stateno = [400,499])
trigger2 = stateno != 440 ;Except for sweep kick
trigger2 = movecontact
trigger3 = stateno = 1310 || stateno = 1330 ;From blocking
var(1) = 1

;---------------------------------------------------------------------------
;REVERSAL ART
[State -1, Literally die]
type = ChangeState
value = 1503
triggerall = Map(Proj) = 1
triggerall = command = "blocking"
triggerall = command = "holdback"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)

;REVERSAL ART
[State -1, The joke makes no sense]
type = ChangeState
value = 1503
triggerall = Map(Proj) = 1
triggerall = TeamMode != Tag
triggerall = command = "w"
triggerall = command = "holdback"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
;---------------------------------------------------------------------------
;REVERSAL ART
[State -1, Literally die]
type = ChangeState
value = 1500
triggerall = command = "blocking"
trigger1 = ctrl
trigger1 = statetype != A
trigger2 = var(1)

;REVERSAL ART
[State -1, The joke makes no sense]
type = ChangeState
value = 1500
triggerall = TeamMode != Tag
triggerall = command = "w"
trigger1 = ctrl
trigger1 = statetype != A
trigger2 = var(1)
;---------------------------------------------------------------------------
;LAUNCHER
[State -1, Light Kung Fu Palm]
type = ChangeState
value = 1401
triggerall = var(31)<=2
triggerall = command = "z"
trigger1 = var(1) ;Use combo condition (above)
trigger2 = stateno = 101 && time > 6
trigger3 = stateno = 102

[state -1, Enryu Haibi Follow]
type = changestate
triggerall = command = "holdup"
triggerall = stateno = 1401 && statetype != A
trigger1 = movehit
value = 41
;-----------------------------------------------------------------------------
;EX Plasma Cutter Combo Ver
[State -1, Strong Kung Fu Palm]
type = ChangeState
value = 2012
triggerall = var(36)<=0
triggerall = command = "BDB_ab"
triggerall = HitDefAttr != SCA,HA
triggerall = power >= 1000
triggerall = stateno != [2011,2012]
triggerall = stateno != 810
trigger1 = var(1) ;Use combo condition (above)
trigger2 = movecontact && statetype = S


[state -1, Enryu Haibi Follow]
type = changestate
triggerall = power >= 1000
triggerall = ifelse(p2dist X> 0, command = "QCB_xy", command = "QCB_xy")
triggerall = stateno = 2000 && statetype != A
trigger1 = movecontact 
value = 13133

[state -1, Enryu Haibi Follow]
type = changestate
triggerall = ifelse(p2dist X> 0, command = "BDB_a", command = "BDB_a")
triggerall = stateno = 13022 && statetype != A
trigger1 = movecontact 
value = 2000

[state -1, Enryu Haibi Follow]
type = changestate
triggerall = ifelse(p2dist X> 0, command = "BDB_b", command = "BDB_b")
triggerall = stateno = 13022 && statetype != A
trigger1 = movecontact 
value = 2011
;-----------------------------------------------------------------------------
;Plasma Cutter Combo Ver
[State -1, Strong Kung Fu Palm]
type = ChangeState
value = 2000
triggerall = command = "BDB_a" 
trigger1 = var(1) ;Use combo condition (above)
trigger2 = stateno = 2222 && movehit 

;-----------------------------------------------------------------------------
;Plasma Cutter Combo Ver
[State -1, Strong Kung Fu Palm]
type = ChangeState
value = 2011
triggerall = command = "BDB_b"
trigger1 = var(1) ;Use combo condition (above)
trigger2 = stateno = 2222 && movehit 

;---------------------------------------------------------------------------
;OVERHEAD
[State -1, Light Kung Fu Palm]
type = ChangeState
value = 2211
triggerall = command = "c"
triggerall = var(33)<=3
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 240 && movecontact
trigger3 = stateno = 410 && movecontact
trigger4 = stateno = 225 && movecontact
trigger5 = stateno = 101 && time > 6
trigger6 = stateno = 102
;-----------------------------------------------------------------------------
;EX Plasma Cutter Combo Ver
[State -1, Strong Kung Fu Palm]
type = ChangeState
value = 13133
triggerall = command = "QCB_xy"
triggerall = power >= 1000
triggerall = stateno !=810
triggerall = stateno !=13133
triggerall = stateno !=1313
triggerall = !moveguarded
trigger1 = var(1) && movehit
trigger2 = stateno = 1005
trigger3 = stateno = 2222 && movehit


;L Plasma Cutter Combo Ver
;[State -1, Light Kung Fu Palm]
;type = ChangeState
;value = 13022
;triggerall = command = "QCB_x"
;trigger1 = var(1) && movehit
;trigger2 = stateno = 2222 && movehit

;H Plasma Cutter Combo Ver
;[State -1, Light Kung Fu Palm]
;type = ChangeState
;value = 13022
;triggerall = command = "QCB_y"
;trigger1 = var(1) && movehit
;trigger2 = stateno = 2222 && movehit

;-------------------------------------------------------------------------
;Strong Kung Fu Palm
[State -1, Strong Kung Fu Palm]
type = ChangeState
value = 1311
triggerall = command = "QCB_xy"
triggerall = power >= 1000
triggerall = stateno !=810
trigger1 = var(1)
trigger2 = moveguarded 
trigger3 = stateno = 102
;---------------------------------------------------------------------------
;Light Kung Fu Palm
[State -1, Light Kung Fu Palm]
type = ChangeState
value = 1300
triggerall = command = "QCB_x"
trigger1 = var(1) 
trigger2 = stateno = 2222 && movehit
trigger3 = stateno = 102
;---------------------------------------------------------------------------
;Light Kung Fu Palm
[State -1, Light Kung Fu Palm]
type = ChangeState
value = 1303
triggerall = command = "QCB_y"
trigger1 = var(1) 
trigger2 = stateno = 2222 && movehit
trigger3 = stateno = 102
;---------------------------------------------------------------------------
;Strong Kung Fu Palm
;[State -1, Strong Kung Fu Palm]
;type = ChangeState
;value = 7664
;triggerall = command = "QCF_ab" 
;triggerall = power >= 1000
;trigger1 = statetype = A
;trigger2 = (stateno = 600) && time > 3
;trigger3 = (stateno = 630) && time > 3
;trigger4 = (stateno = 640) && time > 3
;---------------------------------------------------------------------------
;Back 2
[State -1, Stand Strong Punch]
type = ChangeState
value = 1400
triggerall = command != "holddown"
triggerall = command = "holdback"
triggerall = command = "y"
trigger1 = var(1) ;Use combo condition (above)
trigger2 = stateno = 101 && time > 6
trigger3 = stateno = 102
;---------------------------------------------------------------------------
;EX Command Grab
[State -1]
type = ChangeState
value = 900
triggerall = movetype != H
triggerall = command = "HCF_ab"
triggerall = power >= 1000
triggerall = HitDefAttr != SCA,HA
triggerall = var(34)<=0
triggerall = stateno != 1203
triggerall = stateno != 2011
triggerall = stateno != 22011
triggerall = stateno !=[800,810]
triggerall = stateno != [900,901]
triggerall = statetype != A
trigger1 = ctrl
trigger2 = movecontact
;---------------------------------------------------------------------------
;L Command Grab
[State -1, Light Kung Fu Upper]
type = ChangeState
value = 1200
triggerall = statetype != A
triggerall = command = "HCF_a"
trigger1 = ctrl
trigger2 = var(1) ;Use combo condition (above)
trigger3 = stateno = 1005
trigger4 = stateno = 2222 && movecontact
trigger5 = stateno = 102
;---------------------------------------------------------------------------
;Strong Kung Fu Upper
[State -1, Strong Kung Fu Upper]
type = ChangeState
value = 1202
triggerall = statetype != A
triggerall = command = "HCF_b"
trigger1 = ctrl
trigger2 = var(1) ;Use combo condition (above)
trigger3 = stateno = 1005
trigger4 = stateno = 2222 && movecontact
trigger5 = stateno = 102
;---------------------------------------------------------------------------
;QCF LP
[State -1, Light Kung Fu Blow]
type = ChangeState
value = 1000
triggerall = command = "QCF_x"
trigger1 = var(1) ;Use combo condition (above)
trigger2 = stateno = 2222 && movecontact
;---------------------------------------------------------------------------
;QCF SP
[State -1, Strong Kung Fu Blow]
type = ChangeState
value = 1005
triggerall = command = "QCF_y"
trigger1 = var(1) ;Use combo condition (above)
trigger2 = stateno = 2222 && movecontact
;---------------------------------------------------------------------------
;Far Kung Fu Zankou
;[State -1, Far Kung Fu Zankou]
;type = ChangeState
;value = 1420
;triggerall = command = "QCF_ab"
;triggerall = power >= 330
;trigger1 = var(1) ;Use combo condition (above)

;---------------------------------------------------------------------------
;Light Kung Fu Zankou
;[State -1, Light Kung Fu Zankou]
;type = ChangeState
;value = 1006
;triggerall = command = "QCF_a"
;trigger1 = var(1) ;Use combo condition (above)

;---------------------------------------------------------------------------
;Strong Kung Fu Zankou
;[State -1, Strong Kung Fu Zankou]
;type = ChangeState
;value = 1007
;triggerall = command = "QCF_b"
;trigger1 = var(1) ;Use combo condition (above)

;---------------------------------------------------------------------------
;Light Kung Fu Zankou
[State -1, Light Kung Fu Zankou]
type = ChangeState
value = 7662
triggerall = command = "QCF_a"
triggerall = var(2) = 0
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = (stateno = 600) && time > 3
trigger3 = (stateno = 630) && time > 3
trigger4 = (stateno = 640) && time > 3

;---------------------------------------------------------------------------
;Light Kung Fu Zankou
[State -1, Light Kung Fu Zankou]
type = ChangeState
value = 7663
triggerall = command = "QCF_b"
triggerall = var(2) = 0
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = (stateno = 600) && time > 3
trigger3 = (stateno = 630) && time > 3
trigger4 = (stateno = 640) && time > 3
;===========================================================================
;---------------------------------------------------------------------------
;Run Fwd
[State -1, Run Fwd]
type = ChangeState
value = 100
trigger1 = command = "FF"
trigger1 = statetype = S
trigger1 = ctrl

;--------------------------------
;FADC
[State -1, FADC]
type = ChangeState
value = 101
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
;f.SP
[State -1, Stand Strong Punch]
type = ChangeState
value = 219
triggerall = command = "y"
triggerall = command = "holdfwd"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact 
trigger3 = stateno = 230 && movecontact 
trigger4 = stateno = 233 && movecontact 
trigger5 = stateno = 101 && time > 6


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
trigger2 = stateno = 101 && time > 6
trigger3 = stateno = 102
;---------------------------------------------------------------------------
;Stand Strong Punch
[State -1, Stand Strong Punch]
type = ChangeState
value = 210
triggerall = command = "y"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact
trigger3 = (stateno = 230) && movecontact
trigger4 = stateno = 101 && time > 12
trigger5 = stateno = 102
;---------------------------------------------------------------------------
;Stand Light Kick
[State -1, Stand Light Kick]
type = ChangeState
value = 230
triggerall = command = "a"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact
trigger3 = stateno = 101 && time > 12
trigger4 = stateno = 430 && movecontact
trigger5 = stateno = 102
;---------------------------------------------------------------------------
;Standing Strong Kick
[State -1, Standing Strong Kick]
type = ChangeState
value = 240
triggerall = command = "b"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact
trigger3 = (stateno = 230) && movecontact
trigger4 = stateno = 101 && time > 12
trigger5 = stateno = 102
[state -1, Enryu Haibi Follow]
type = changestate
triggerall = ifelse(p2dist X> 0, command != "holdback", command != "holdback")
triggerall = ifelse(p2dist X> 0, command = "y", command = "y")
triggerall = stateno = 240 && statetype != A
trigger1 = time > 14
trigger2 = movecontact
value = 2411

[state -1, Enryu Haibi Follow]
type = changestate
triggerall = ifelse(p2dist X> 0, command = "a", command = "a")
triggerall = stateno = 219 && statetype != A
trigger1 = movecontact 
value = 224

[state -1, Enryu Haibi Follow]
type = changestate
triggerall = ifelse(p2dist X> 0, command = "a", command = "a")
triggerall = stateno = 219 && statetype != A
trigger1 = time > 23
value = 224

[state -1, Enryu Haibi Follow]
type = changestate
triggerall = ifelse(p2dist X> 0, command = "x", command = "x")
triggerall = stateno = 200 && statetype != A
trigger1 = movecontact 
value = 201

[state -1, Enryu Haibi Follow]
type = changestate
triggerall = ifelse(p2dist X> 0, command = "x", command = "x")
triggerall = stateno = 200 && statetype != A
trigger1 = time > 16 
value = 201

[state -1, Enryu Haibi Follow]
type = changestate
triggerall = ifelse(p2dist X> 0, command = "x", command = "x")
triggerall = stateno = 231 && statetype != A
trigger1 = movecontact 
value = 201

[state -1, Enryu Haibi Follow]
type = changestate
triggerall = ifelse(p2dist X> 0, command = "x", command = "x")
triggerall = stateno = 210 && statetype != A
trigger1 = movecontact
value = 201

[state -1, Enryu Haibi Follow]
type = changestate
triggerall = ifelse(p2dist X> 0, command = "a", command = "a")
triggerall = stateno = 201 && statetype != A
trigger1 = movecontact 
value = 202

[state -1, Enryu Haibi Follow]
type = changestate
triggerall = ifelse(p2dist X> 0, command = "a", command = "a")
triggerall = stateno = 201 && statetype != A
trigger1 = time > 18 
value = 202

[state -1, Enryu Haibi Follow]
type = changestate
triggerall = ifelse(p2dist X> 0, command = "a", command = "a")
triggerall = stateno = 230 && statetype != A
trigger1 = movecontact 
value = 233

[state -1, Enryu Haibi Follow]
type = changestate
triggerall = ifelse(p2dist X> 0, command = "b", command = "b")
triggerall = stateno = 233 && statetype != A
trigger1 = movecontact 
value = 240
[state -1, Enryu Haibi Follow]
type = changestate
triggerall = ifelse(p2dist X> 0, command = "b", command = "b")
triggerall = stateno = 210 && statetype != A
trigger1 = movecontact 
value = 225
[state -1, Enryu Haibi Follow]
type = changestate
triggerall = ifelse(p2dist X> 0, command = "b", command = "b")
triggerall = stateno = 219 && statetype != A
trigger1 = movecontact 
value = 225
[state -1, Enryu Haibi Follow]
type = changestate
triggerall = ifelse(p2dist X> 0, command = "holdfwd", command = "holdfwd")
triggerall = ifelse(p2dist X> 0, command = "b", command = "b")
triggerall = stateno = 202 && statetype != A
trigger1 = movecontact 
value = 2033
[state -1, Enryu Haibi Follow]
type = changestate
triggerall = ifelse(p2dist X> 0, command = "x", command = "x")
triggerall = stateno = 230 && statetype != A
trigger1 = movecontact 
value = 231
[state -1, Enryu Haibi Follow]
type = changestate
triggerall = ifelse(p2dist X> 0, command = "y", command = "y")
triggerall = stateno = 231 && statetype != A
trigger1 = movecontact 
value = 210
[state -1, Enryu Haibi Follow]
type = changestate
triggerall =  command = "y"
triggerall = stateno = 210 && statetype != A
trigger1 = movehit 
value = 2122
[state -1, Enryu Haibi Follow]
type = changestate
triggerall = command = "y"
triggerall = stateno = 2122 && statetype != A
trigger1 = movecontact 
value = 212
[state -1, Enryu Haibi Follow]
type = changestate
triggerall = command = "y"
triggerall = stateno = 21222 && statetype != A
trigger1 = movecontact 
value = 2133
[state -1, Enryu Haibi Follow]
type = changestate
triggerall = ifelse(p2dist X> 0, command = "y", command = "y")
triggerall = stateno = 2133 && statetype != A
trigger1 = movecontact 
value = 2144
[state -1, Enryu Haibi Follow]
type = changestate
triggerall = var(35)<=0
triggerall = ifelse(p2dist X> 0, command = "y", command = "y")
triggerall = ifelse(p2dist X> 0, command = "holddown", command = "holddown")
triggerall = stateno = 225 && statetype != A
trigger1 = movecontact 
value = 227
[state -1, Enryu Haibi Follow]
type = changestate
triggerall = ifelse(p2dist X> 0, command = "y", command = "y")
triggerall = stateno = 2144 && statetype != A
trigger1 = movecontact 
value = 2155
[state -1, Enryu Haibi Follow]
type = changestate
triggerall = ifelse(p2dist X> 0, command = "y", command = "y")
triggerall = stateno = 2155 && statetype != A
trigger1 = movecontact 
value = 2166
[state -1, Enryu Haibi Follow]
type = changestate
triggerall = ifelse(p2dist X> 0, command = "y", command = "y")
triggerall = stateno = 2166 && statetype != A
trigger1 = movecontact 
value = 2177
[state -1, Enryu Haibi Follow]
type = changestate
triggerall = ifelse(p2dist X> 0, command = "y", command = "y")
triggerall = stateno = 2177 && statetype != A
trigger1 = movecontact 
value = 2188
;---------------------------------------------------------------------------
;Crouching Light Punch
[State -1, Crouching Light Punch]
type = ChangeState
value = 400
triggerall = command = "x"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = stateno = 101 && time > 6
trigger3 = stateno = 102
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
trigger2 = (movecontact) || (movecontact)
trigger3 = stateno = 101 && time > 12
trigger4 = stateno = 102
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
trigger2 = (movecontact) || (movecontact)
trigger3 = stateno = 101 && time > 12
trigger4 = stateno = 102
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
trigger3 = stateno = 101 && time > 12
trigger4 = stateno = 102
;---------------------------------------------------------------------------
;Jump Light Punch
[State -1, Jump Light Punch]
type = ChangeState
value = 600
triggerall = command = "buffer_x"
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
trigger2 = stateno = 600 || stateno = 630
trigger2 = movecontact
trigger3 = stateno = 1350 ;Air blocking

;---------------------------------------------------------------------------
;Jump Light Kick
[State -1, Jump Light Kick]
type = ChangeState
value = 630
triggerall = command = "buffer_a"
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