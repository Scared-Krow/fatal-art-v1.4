
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
buffer.time = 3
time = 20

[Command]
name = "TripleKFPalm"
command = ~D, F, D, F, ~x
buffer.time = 3
time = 20

[Command]
name = "TripleKFPalm"   ;Same name as above
command = ~D, F, D, F, y
buffer.time = 3
time = 20

[Command]
name = "TripleKFPalm"   ;Same name as above
command = ~D, F, D, F, ~y
buffer.time = 3
time = 20

[Command]
name = "Swinging"
command = ~$F, $D, $B, $F, a
buffer.time = 3
time = 20

[Command]
name = "Swinging"
command = ~$F, $D, $B, $F, b
buffer.time = 3
time = 20


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
command = ~F, DF, x
buffer.time = 3

[Command]
name = "upper_y"
command = ~F, DF, y
buffer.time = 3

[Command]
name = "upper_xy"
command = ~F, DF, x+y
buffer.time = 3

[Command]
name = "QCF_x"
command = ~D,  F, x
buffer.time = 3

[Command]
name = "QCF_x"
command = ~D, F, ~x
buffer.time = 3

[Command]
name = "QCF_y"
command = ~D,  F, y
buffer.time = 3

[Command]
name = "QCF_y"
command = ~D, F, ~y
buffer.time = 3

[Command]
name = "QCF_xy"
command = ~D,  F, x+y
buffer.time = 3

[Command]
name = "QCF_xy"
command = ~D, F, ~x+y
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

[Command]
name = "QCF_b"
command = ~D, DF, F, b

[Command]
name = "QCF_ab"
command = ~D, DF, F, a+b

[Command]
name = "FF_ab"
command = D, DB, B, a+b
buffer.time = 3

[Command]
name = "FF_ab"
command = D, DB, B, ~a+b
buffer.time = 3

[Command]
name = "FF_a"
command = D, DB, B, a
buffer.time = 3

[Command]
name = "FF_a"
command = D, DB, B, ~a
buffer.time = 3

[Command]
name = "FF_b"
command = D, DB, B, b
buffer.time = 3

[Command]
name = "FF_b"
command = D, DB, B, ~b
buffer.time = 3

[Command]
name = "c_bfab"
command = ~20$B, $F, a+b
buffer.time = 3

[Command]
name = "c_bfa"
command = ~20$B, $F, a
buffer.time = 3

[Command]
name = "c_bfb"
command = ~20$B, $F, b
buffer.time = 3

[Command]
name = "c_bfab"
command = ~20$B, $F, ~a+b
buffer.time = 3

[Command]
name = "c_bfa"
command = ~20$B, $F, ~a
buffer.time = 3

[Command]
name = "c_bfb"
command = ~20$B, $F, ~b
buffer.time = 3


[Command]
name = "c_bfxy"
command = ~20$B, $F, x+y
buffer.time = 3

[Command]
name = "c_bfx"
command = ~20$B, $F, x
buffer.time = 3

[Command]
name = "c_bfy"
command = ~20$B, $F, y
buffer.time = 3

[Command]
name = "c_bfxy"
command = ~20$B, $F, ~x+y
buffer.time = 3

[Command]
name = "c_bfx"
command = ~20$B, $F, ~x
buffer.time = 3

[Command]
name = "c_bfy"
command = ~20$B, $F, ~y
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
time = 2
buffer.time = 3

[Command]
name = "holdback";Required (do not remove)
command = /$B
time = 2
buffer.time = 3

[Command]
name = "holdup" ;Required (do not remove)
command = /$U
time = 2
buffer.time = 3

[Command]
name = "holddown";Required (do not remove)
command = /$D
time = 2
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
value = 7000
triggerall = command = "TripleKFPalm"
triggerall = power >= 3000
triggerall = stateno != 810
triggerall = statetype != A
triggerall = stateno != [300,302]
trigger1 = ctrl
trigger2 = hitdefattr = SC, NA, SA, HA
trigger2 = stateno != [3050,3100)
trigger2 = movecontact
trigger3 = stateno = 1310 || stateno = 1330 ;From blocking
;---------------------------------------------------------------------------
;SWINGY SWINGY
[State -1, Smash Kung Fu Upper]
type = ChangeState
value = 3000
triggerall = command = "Swinging"
triggerall = power >= 2000
triggerall = stateno != 810
triggerall = statetype != A
triggerall = stateno != [300,302]
trigger1 = ctrl
trigger2 = hitdefattr = SC, NA, SA, HA
trigger2 = stateno != [3050,3100)
trigger2 = movecontact
trigger3 = stateno = 1310 || stateno = 1330 ;From blocking
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
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200,299]) || (stateno = [400,499])
trigger2 = stateno != 440 ;Except for sweep kick
trigger2 = movecontact
trigger3 = stateno = 1310 || stateno = 1330 ;From blocking
var(1) = 1

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
;----------------------------------------------------------------------------
;EX BARRAGE
[State -1, Fast Kung Fu Palm]
type = ChangeState
value = 1004
triggerall = command = "QCB_xy"
triggerall = power >= 1000
triggerall = stateno != 810
triggerall= statetype != A
triggerall = var(32)<=0
trigger1 = var(1) ;Use combo condition (above)
trigger2 = movecontact 
triggerall= stateno != 1004
;---------------------------------------------------------------------------
;L BARRAGE
[State -1, Light Kung Fu Palm]
type = ChangeState
value = 1000
triggerall = command = "QCB_x"
triggerall = statetype != A
trigger1 = ctrl 
trigger2 = var(1) ;Use combo condition (above)

;---------------------------------------------------------------------------
;S BARRAGE
[State -1, Strong Kung Fu Palm]
type = ChangeState
value = 1002
triggerall = command = "QCB_y"
triggerall = statetype != A
trigger1 = ctrl 
trigger2 = var(1) ;Use combo condition (above)


;Fast Kung Fu Knee (1/3 super bar)
[State -1, Fast Kung Fu Knee]
type = ChangeState
value = 1404
triggerall = command = "c_bfab"
triggerall = power >= 1000
triggerall = stateno != 810
triggerall = statetype != A
triggerall = var(34)<=0 
trigger1 = var(1) ;Use combo condition (above)
trigger2 = movecontact
triggerall= stateno != 1404
;---------------------------------------------------------------------------
;Light Kung Fu Knee
[State -1, Light Kung Fu Knee]
type = ChangeState
value = 1400
triggerall = command = "c_bfa"
triggerall = statetype != A
trigger1 = ctrl 
trigger2 = var(1) ;Use combo condition (above)
;---------------------------------------------------------------------------
;Strong Kung Fu Knee
[State -1, Strong Kung Fu Knee]
type = ChangeState
value = 1402
triggerall = command = "c_bfb"
triggerall = statetype != A
trigger1 = ctrl 
trigger2 = var(1) ;Use combo condition (above)
;---------------------------------------------------------------------------
;Launcher
[State -1, Launcher]
type = changestate
value = 1030
triggerall = numexplod(44050) <= 1
triggerall = command = "z"
trigger1 = statetype = S
trigger1 =  var(1) ;Use combo condition (above)

;---------------------------------------------------------------------------
[State -1, Overhead]
type = changestate
value = 1035
triggerall = command = "c"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = [200,299] && movecontact

[state -1, Enryu Haibi Follow]
type = changestate
triggerall = ifelse(p2dist X> 0, command = "QCF_xy", command = "QCF_xy")
triggerall = stateno = 1034 && statetype != A
trigger1 = movehit 
value = 1004

[state -1, Enryu Haibi Follow]
type = changestate
triggerall = ifelse(p2dist X> 0, command = "QCF_x", command = "QCF_x")
triggerall = stateno = 1034 && statetype != A
trigger1 = movehit 
value = 1000

[state -1, Enryu Haibi Follow]
type = changestate
triggerall = ifelse(p2dist X> 0, command = "QCF_y", command = "QCF_y")
triggerall = stateno = 1034 && statetype != A
trigger1 = movehit 
value = 1002

[state -1, Enryu Haibi Follow]
type = changestate
triggerall = ifelse(p2dist X> 0, command = "FF_ab", command = "FF_ab")
triggerall = stateno = 1034 && statetype != A
trigger1 = movehit 
value = 1404

[state -1, Enryu Haibi Follow]
type = changestate
triggerall = ifelse(p2dist X> 0, command = "FF_a", command = "FF_a")
triggerall = stateno = 1034 && statetype != A
trigger1 = movehit 
value = 1400

[state -1, Enryu Haibi Follow]
type = changestate
triggerall = ifelse(p2dist X> 0, command = "FF_b", command = "FF_b")
triggerall = stateno = 1034 && statetype != A
trigger1 = movehit 
value = 1402
;---------------------------------------------------------------------------
;EX SLAM
[State -1, Fast Kung Fu Palm]
type = ChangeState
value = 670
triggerall = statetype != S && statetype != C
triggerall = command = "QCF_xy"
triggerall = power >= 1000
triggerall = stateno != 810
triggerall = var(31)<=0
trigger1 = statetype = A
trigger1 = ctrl
trigger2= movecontact && statetype = A
triggerall= stateno != 670
;---------------------------------------------------------------------------
;L SLAM
[State -1, Light Kung Fu Palm]
type = ChangeState
value = 666
triggerall = statetype != S && statetype != C
triggerall = command = "QCF_x"
trigger1 = statetype = A
trigger1 = var(1)
trigger2 = ctrl
trigger3 = stateno = 1350 ;Air blocking
trigger4 = movecontact && statetype = A
;---------------------------------------------------------------------------
;S SLAM
[State -1, Strong Kung Fu Palm]
type = ChangeState
value = 668
triggerall = statetype != S && statetype != C
triggerall = command = "QCF_y"
trigger1 = statetype = A
trigger1 = var(1)
trigger2 = ctrl
trigger3 = stateno = 1350 ;Air blocking
trigger4 = movecontact && statetype = A
;---------------------------------------------------------------------------
;Fast Kung Fu Blow (1/3 super bar)
[State -1, Fast Kung Fu Blow]
type = ChangeState
value = 1080
triggerall = command = "c_bfxy"
triggerall = power >= 1000
triggerall = stateno != 810
triggerall= statetype != A
triggerall = var(33)<=0
trigger1 = var(1) ;Use combo condition (above)
trigger2 = movecontact
triggerall= stateno != 1080
;---------------------------------------------------------------------------
;L. YOYO THROW
[State -1, Light Kung Fu Blow]
type = ChangeState
value = 1010
triggerall = command = "c_bfx"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1) ;Use combo condition (above)
trigger3 = stateno = 1034 && movehit
trigger4 = stateno = [1400,1403] && movecontact
;---------------------------------------------------------------------------
;Strong Kung Fu Blow
[State -1, Strong Kung Fu Blow]
type = ChangeState
value = 1020
triggerall = command = "c_bfy"
triggerall = statetype != A
triggerall= var(30)<=0
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = [1400,1403] && movecontact
;---------------------------------------------------------------------------
;REVERSAL ART
[State -1, wow yoyo got hops]
type = ChangeState
value = 1300
triggerall = numexplod(44020) <= 0 
triggerall = command = "blocking"
trigger1 = (stateno = [200,299]) && movehit
trigger2 = (stateno = [400,499]) && movehit
trigger3 = ctrl
triggerall = statetype != A

;REVERSAL ART
[State -1, The joke makes no sense]
type = ChangeState
value = 1300
triggerall = numexplod(44020) <= 0 
triggerall = TeamMode != Tag
triggerall = command = "w"
trigger1 = (stateno = [200,299]) && movehit
trigger2 = (stateno = [400,499]) && movehit
trigger3 = ctrl
triggerall = statetype != A

;WALL JUMP
[State -1, Wall Jump]
type = ChangeState
value = 1310     
triggerall = Map(Jump) <= 0
triggerall = Pos Y < -10      
triggerall = command = "w" || command = "blocking"  
triggerall = backedgebodydist < 10 || frontedgebodydist < 10
triggerall = statetype = A         
trigger1 = ctrl

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
trigger2 = stateno = 430 && movecontact && time > 9
;---------------------------------------------------------------------------
;Stand Light Punch
[State -1, Stand Light Punch]
type = ChangeState
value = 201
triggerall = statetype = S
triggerall = stateno = 200 
triggerall = command = "x" 
triggerall = command != "holddown"
trigger1 = time > 13
trigger2 = movecontact


[state -1, Enryu Haibi Follow]
type = changestate
triggerall = ifelse(p2dist X> 0, command = "x", command = "x")
triggerall = stateno = 201 && statetype != A
trigger1 = movecontact
trigger2 = time > 15
value = 214



;--------------------------------------------------------------------------- Back 3+4
;Stand Light Punch
[State -1, Stand Light Punch]
type = ChangeState
value = 231
triggerall = command = "a" 
triggerall = statetype != A && command = "holdback" && command != "holddown"
trigger1 = ctrl

[state -1, Enryu Haibi Follow]
type = changestate
triggerall = ifelse(p2dist X> 0, command = "b", command = "b")
triggerall = stateno = 231 && statetype != A
trigger1 = movecontact 
trigger2 = time > 16
value = 232
[state -1, Enryu Haibi Follow]
type = changestate
triggerall = ifelse(p2dist X> 0, command = "y", command = "y")
triggerall = stateno = 231 && statetype != A
trigger1 = movecontact 
value = 233
[state -1, Enryu Haibi Follow]
type = changestate
triggerall = ifelse(p2dist X> 0, command = "y", command = "y")
triggerall = stateno = 232 && statetype != A
trigger1 = movecontact 
trigger2 = time > 22
value = 234
[state -1, Enryu Haibi Follow]
type = changestate
triggerall = ifelse(p2dist X> 0, command = "holdfwd", command = "holdfwd")
triggerall = ifelse(p2dist X> 0, command = "y", command = "y")
triggerall = stateno = 201 && statetype != A
trigger1 = movecontact 
value = 213
[state -1, Enryu Haibi Follow]
type = changestate
triggerall = ifelse(p2dist X> 0, command = "holdfwd", command = "holdfwd")
triggerall = ifelse(p2dist X> 0, command = "y", command = "y")
triggerall = stateno = 202 && statetype != A
trigger1 = movecontact && time > 47
value = 213
[state -1, Enryu Haibi Follow]
type = changestate
triggerall = ifelse(p2dist X> 0, command = "holdfwd", command = "holdfwd")
triggerall = ifelse(p2dist X> 0, command = "y", command = "y")
triggerall = stateno = 230 && statetype != A
trigger1 = movecontact 
value = 213

;---------------------------------------------------------------------------
;Stand Light Punch
[State -1, Stand Light Punch]
type = ChangeState
value = 202
triggerall = stateno = 201 && movecontact
triggerall = command = "y" 
triggerall = command = "holdback"
trigger1 = statetype = S

[state -1, Enryu Haibi Follow]
type = changestate
triggerall = ifelse(p2dist X> 0, command = "holdback", command = "holdback")
triggerall = ifelse(p2dist X> 0, command = "y", command = "y")
triggerall = stateno = 230 && statetype != A
trigger1 = movecontact 
value = 202
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
trigger3 = stateno = 213 && movecontact 
trigger4 = stateno = 214 && movecontact

[state -1, Enryu Haibi Follow]
type = changestate
triggerall = command = "y"
triggerall= time < 27
triggerall = stateno = 210 && statetype != A
trigger1 = movecontact
trigger2 = time > 18
value = 211

[state -1, Enryu Haibi Follow]
type = changestate
triggerall = command = "y"
triggerall = stateno = 211 && statetype != A
trigger1 = movecontact
value = 212
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
trigger2 = stateno = 230 && movecontact
trigger3 = stateno = 200 && movecontact 
;---------------------------------------------------------------------------
;Crouching Light Punch
[State -1, Crouching Light Punch]
type = ChangeState
value = 401
triggerall = command = "x"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
;---------------------------------------------------------------------------
;Crouching Strong Punch
[State -1, Crouching Strong Punch]
type = ChangeState
value = 410
triggerall = command = "y"
triggerall= var(36)<=0
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = stateno = 430 && movecontact 
trigger3 = stateno = 401 && movecontact 
;---------------------------------------------------------------------------
;Crouching Light Kick
[State -1, Crouching Light Kick]
type = ChangeState
value = 430
triggerall = command = "a"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = stateno = 401 && movecontact
trigger3 = stateno = 430 && movecontact
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
