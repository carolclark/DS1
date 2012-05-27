// =================================================================================
//	Keyboard_AL.h				©1997-2009 C & C Software, Inc. All rights reserved.
// =================================================================================

#pragma once

// modifier flags

#define mf_command	0x01
#define mf_shift	0x02
#define mf_capslock	0x04
#define mf_option	0x08
#define mf_control	0x10
								//	above bits constitute EventRecord modifiers field
#define mf_lock		0x80
#define mf_unlock	0x40
#define mf_toggle	0xC0


// keycodes
#define kc_command	0x3700
#define kc_shift	0x3800
#define kc_capslock 0x3900
#define kc_option	0x3A00
#define kc_control	0x3B00

#define kc_A	0x0061
#define kc_B	0x0B62
#define kc_C	0x0863
#define kc_D	0x0264
#define kc_E	0x0E65
#define kc_F	0x0366
#define kc_G	0x0567
#define kc_H	0x0468
#define kc_I	0x2269
#define kc_J	0x266A
#define kc_K	0x286B
#define kc_L	0x256C
#define kc_M	0x2E6D
#define kc_N	0x2D6E
#define kc_O	0x1F6F
#define kc_P	0x2370
#define kc_Q	0x0C71
#define kc_R	0x0F72
#define kc_S	0x0173
#define kc_T	0x1174
#define kc_U	0x2075
#define kc_V	0x0976
#define kc_W	0x0D77
#define kc_X	0x0778
#define kc_Y	0x1079
#define kc_Z	0x067A

#define kc_0	0x1D30
#define kc_1	0x1231
#define kc_2	0x1332
#define kc_3	0x1433
#define kc_4	0x1534
#define kc_5	0x1735
#define kc_6	0x1636
#define kc_7	0x1A37
#define kc_8	0x1C38
#define kc_9	0x1939

#define kc_kp0	0x5230
#define kc_kp1	0x5331
#define kc_kp2	0x5432
#define kc_kp3	0x5533
#define kc_kp4 	0x5634
#define kc_kp5	0x5735
#define kc_kp6	0x5836
#define kc_kp7	0x5937
#define kc_kp8	0x5B38
#define kc_kp9	0x5C39

#define kc_kpperiod	0x412E
#define kc_kptimes	0x432A
#define kc_kpplus	0x452B
#define kc_kpclear	0x477F
#define kc_kpdivide	0x4B2F
#define kc_kpminus	0x4E2D
#define kc_kpequal	0x513D

#define kc_fn1		0x7A31
#define kc_fn2		0x7832
#define kc_fn3		0x6333
#define kc_fn4		0x7634
#define kc_fn5		0x6035
#define kc_fn6		0x6136
#define kc_fn7		0x6237
#define kc_fn8		0x6438
#define kc_fn9		0x6539
#define kc_fn10		0x6D3A
#define kc_fn11		0x673B
#define kc_fn12		0x6F3C
#define kc_fn13		0x6910
#define kc_fn14		0x6B10
#define kc_fn15		0x7110
#define kc_fn16		0x6A10

// DTS: do not send '\09' with tab
#define kc_help		0x7200	//0x7205
#define kc_fdelete	0x7500	//0x757F
#define kc_home		0x7300	//0x7301
#define kc_end		0x7700	//0x7704
#define kc_pageup	0x7400	//0x740B
#define kc_pagedown	0x7900	//0x790C
	
#define kc_space	0x3120
#define kc_return	0x2400	//0x240D
#define kc_enter	0x4C00	//0x4C03
#define kc_delete	0x3300	//0x3308
#define kc_tab		0x3000	//0x3009
#define kc_escape	0x3500	//0x351B
#define kc_left		0x7B00	//0x7B1C
#define kc_right	0x7C00	//0x7C1D
#define kc_up		0x7E00	//0x7E1E
#define kc_down		0x7D00	//0x7D1F

#define kc_accent		0x3260
#define kc_minus		0x1B2D
#define kc_equal		0x183D
#define kc_bracket		0x215B
#define kc_closebracket	0x1E5D
#define kc_backslash	0x2A5C
#define kc_semicolon	0x293B
#define kc_quote		0x2727
#define kc_comma		0x2B2C
#define kc_period		0x2F2E
#define kc_slash		0x2C2F

// Interactive Mouse Codes
#define im_Drag			1
#define im_Move			2
#define im_StepSize		3
#define im_Up			4
#define im_Down			5
#define im_Left			6
#define im_Right		7
#define im_Click		9
#define im_Close		12
#define im_MarkSet		13
#define im_DragToMark	14
#define im_GoToMark		15
#define im_MarkClear	16
#define im_MarkNext		17
#define im_Previous		18
#define im_MarkCurrent	19
#define im_Position		20
