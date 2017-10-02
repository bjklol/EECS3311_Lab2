/*
 * Code for class BOARD_TEMPLATES
 */

#include "eif_eiffel.h"
#include "../E1/estructure.h"


#ifdef __cplusplus
extern "C" {
#endif

extern void F960_7130(EIF_REFERENCE);
extern EIF_TYPED_VALUE F960_7131(EIF_REFERENCE);
extern EIF_TYPED_VALUE F960_7132(EIF_REFERENCE);
extern EIF_TYPED_VALUE F960_7133(EIF_REFERENCE);
extern EIF_TYPED_VALUE F960_7134(EIF_REFERENCE);
extern EIF_TYPED_VALUE F960_7135(EIF_REFERENCE);
extern EIF_TYPED_VALUE F960_7136(EIF_REFERENCE);
extern EIF_TYPED_VALUE F960_7137(EIF_REFERENCE);
extern EIF_TYPED_VALUE F960_7138(EIF_REFERENCE);
extern EIF_TYPED_VALUE F960_7139(EIF_REFERENCE);
extern EIF_TYPED_VALUE F960_7140(EIF_REFERENCE);
extern EIF_TYPED_VALUE F960_7141(EIF_REFERENCE);
extern EIF_TYPED_VALUE F960_7142(EIF_REFERENCE);
extern EIF_TYPED_VALUE F960_7143(EIF_REFERENCE);
extern EIF_TYPED_VALUE F960_7144(EIF_REFERENCE);
extern EIF_TYPED_VALUE F960_7145(EIF_REFERENCE);
extern EIF_TYPED_VALUE F960_7146(EIF_REFERENCE);
extern void F960_7795(EIF_REFERENCE, int);
extern void EIF_Minit960(void);

#ifdef __cplusplus
}
#endif


#ifdef __cplusplus
extern "C" {
#endif


#ifdef __cplusplus
}
#endif


#ifdef __cplusplus
extern "C" {
#endif

/* {BOARD_TEMPLATES}.make */
void F960_7130 (EIF_REFERENCE Current)
{
	GTCX
	char *l_feature_name = "make";
	RTEX;
	EIF_REFERENCE tr1 = NULL;
	RTCDT;
	RTSN;
	RTDA;
	RTLD;
	
	RTLI(2);
	RTLR(0,Current);
	RTLR(1,tr1);
	RTLIU(2);
	RTLU (SK_VOID, NULL);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 959, Current, 0, 0, 13403);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(959, Current, 13403);
	RTIV(Current, RTAL);
	RTHOOK(1);
	RTDBGAA(Current, dtype, 4963, 0xF80003BE, 0); /* default_board */
	tr1 = RTLNSMART(RTWCT(4963, dtype, Dftype(Current)).id);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTWC(4939, Dtype(tr1)))(tr1);
	RTNHOOK(1,1);
	RTAR(Current, tr1);
	*(EIF_REFERENCE *)(Current + RTWA(4963, dtype)) = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(2);
	RTDBGAA(Current, dtype, 4964, 0xF80003BE, 0); /* easy_board */
	tr1 = RTLNSMART(RTWCT(4964, dtype, Dftype(Current)).id);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTWC(4940, Dtype(tr1)))(tr1);
	RTNHOOK(2,1);
	RTAR(Current, tr1);
	*(EIF_REFERENCE *)(Current + RTWA(4964, dtype)) = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(3);
	RTDBGAA(Current, dtype, 4965, 0xF80003BE, 0); /* cross_board */
	tr1 = RTLNSMART(RTWCT(4965, dtype, Dftype(Current)).id);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTWC(4941, Dtype(tr1)))(tr1);
	RTNHOOK(3,1);
	RTAR(Current, tr1);
	*(EIF_REFERENCE *)(Current + RTWA(4965, dtype)) = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(4);
	RTDBGAA(Current, dtype, 4966, 0xF80003BE, 0); /* plus_board */
	tr1 = RTLNSMART(RTWCT(4966, dtype, Dftype(Current)).id);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTWC(4942, Dtype(tr1)))(tr1);
	RTNHOOK(4,1);
	RTAR(Current, tr1);
	*(EIF_REFERENCE *)(Current + RTWA(4966, dtype)) = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(5);
	RTDBGAA(Current, dtype, 4967, 0xF80003BE, 0); /* pyramid_board */
	tr1 = RTLNSMART(RTWCT(4967, dtype, Dftype(Current)).id);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTWC(4943, Dtype(tr1)))(tr1);
	RTNHOOK(5,1);
	RTAR(Current, tr1);
	*(EIF_REFERENCE *)(Current + RTWA(4967, dtype)) = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(6);
	RTDBGAA(Current, dtype, 4968, 0xF80003BE, 0); /* arrow_board */
	tr1 = RTLNSMART(RTWCT(4968, dtype, Dftype(Current)).id);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTWC(4944, Dtype(tr1)))(tr1);
	RTNHOOK(6,1);
	RTAR(Current, tr1);
	*(EIF_REFERENCE *)(Current + RTWA(4968, dtype)) = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(7);
	RTDBGAA(Current, dtype, 4969, 0xF80003BE, 0); /* diamond_board */
	tr1 = RTLNSMART(RTWCT(4969, dtype, Dftype(Current)).id);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTWC(4945, Dtype(tr1)))(tr1);
	RTNHOOK(7,1);
	RTAR(Current, tr1);
	*(EIF_REFERENCE *)(Current + RTWA(4969, dtype)) = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(8);
	RTDBGAA(Current, dtype, 4970, 0xF80003BE, 0); /* skull_board */
	tr1 = RTLNSMART(RTWCT(4970, dtype, Dftype(Current)).id);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTWC(4946, Dtype(tr1)))(tr1);
	RTNHOOK(8,1);
	RTAR(Current, tr1);
	*(EIF_REFERENCE *)(Current + RTWA(4970, dtype)) = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(9);
	RTDBGAA(Current, dtype, 4971, 0xF80000E7, 0); /* default_board_out */
	tr1 = RTMS_EX_H("*******\012*******\012*******\012*******\012*******\012*******\012*******",55,778293802);
	RTAR(Current, tr1);
	*(EIF_REFERENCE *)(Current + RTWA(4971, dtype)) = (EIF_REFERENCE) tr1;
	RTHOOK(10);
	RTDBGAA(Current, dtype, 4972, 0xF80000E7, 0); /* easy_board_out */
	tr1 = RTMS_EX_H("***.***\012***O***\012***O***\012***.***\012***O***\012***.***\012*******",55,2056662058);
	RTAR(Current, tr1);
	*(EIF_REFERENCE *)(Current + RTWA(4972, dtype)) = (EIF_REFERENCE) tr1;
	RTHOOK(11);
	RTDBGAA(Current, dtype, 4973, 0xF80000E7, 0); /* cross_board_out */
	tr1 = RTMS_EX_H("**...**\012**.O.**\012..OOO..\012...O...\012...O...\012**...**\012**...**",55,338884138);
	RTAR(Current, tr1);
	*(EIF_REFERENCE *)(Current + RTWA(4973, dtype)) = (EIF_REFERENCE) tr1;
	RTHOOK(12);
	RTDBGAA(Current, dtype, 4974, 0xF80000E7, 0); /* plus_board_out */
	tr1 = RTMS_EX_H("**...**\012**.O.**\012...O...\012.OOOOO.\012...O...\012**.O.**\012**...**",55,1617426474);
	RTAR(Current, tr1);
	*(EIF_REFERENCE *)(Current + RTWA(4974, dtype)) = (EIF_REFERENCE) tr1;
	RTHOOK(13);
	RTDBGAA(Current, dtype, 4975, 0xF80000E7, 0); /* pyramid_board_out */
	tr1 = RTMS_EX_H("**...**\012**.O.**\012..OOO..\012.OOOOO.\012OOOOOOO\012**...**\012**...**",55,720226346);
	RTAR(Current, tr1);
	*(EIF_REFERENCE *)(Current + RTWA(4975, dtype)) = (EIF_REFERENCE) tr1;
	RTHOOK(14);
	RTDBGAA(Current, dtype, 4976, 0xF80000E7, 0); /* arrow_board_out */
	tr1 = RTMS_EX_H("**.O.**\012**OOO**\012.OOOOO.\012...O...\012...O...\012**OOO**\012**OOO**",55,1324979754);
	RTAR(Current, tr1);
	*(EIF_REFERENCE *)(Current + RTWA(4976, dtype)) = (EIF_REFERENCE) tr1;
	RTHOOK(15);
	RTDBGAA(Current, dtype, 4977, 0xF80000E7, 0); /* diamond_board_out */
	tr1 = RTMS_EX_H("**.O.**\012**OOO**\012.OOOOO.\012OOO.OOO\012.OOOOO.\012**OOO**\012**.O.**",55,481193770);
	RTAR(Current, tr1);
	*(EIF_REFERENCE *)(Current + RTWA(4977, dtype)) = (EIF_REFERENCE) tr1;
	RTHOOK(16);
	RTDBGAA(Current, dtype, 4978, 0xF80000E7, 0); /* skull_board_out */
	tr1 = RTMS_EX_H("**OOO**\012**OOO**\012.OOOOO.\012.O.O.O.\012.OOOOO.\012**OOO**\012**OOO**",55,1784625706);
	RTAR(Current, tr1);
	*(EIF_REFERENCE *)(Current + RTWA(4978, dtype)) = (EIF_REFERENCE) tr1;
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(17);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(2);
	RTEE;
}

/* {BOARD_TEMPLATES}.default_board */
EIF_TYPED_VALUE F960_7131 (EIF_REFERENCE Current)
{
	EIF_TYPED_VALUE r;
	r.type = SK_REF;
	r.it_r = *(EIF_REFERENCE *)(Current + RTWA(4963,Dtype(Current)));
	return r;
}


/* {BOARD_TEMPLATES}.easy_board */
EIF_TYPED_VALUE F960_7132 (EIF_REFERENCE Current)
{
	EIF_TYPED_VALUE r;
	r.type = SK_REF;
	r.it_r = *(EIF_REFERENCE *)(Current + RTWA(4964,Dtype(Current)));
	return r;
}


/* {BOARD_TEMPLATES}.cross_board */
EIF_TYPED_VALUE F960_7133 (EIF_REFERENCE Current)
{
	EIF_TYPED_VALUE r;
	r.type = SK_REF;
	r.it_r = *(EIF_REFERENCE *)(Current + RTWA(4965,Dtype(Current)));
	return r;
}


/* {BOARD_TEMPLATES}.plus_board */
EIF_TYPED_VALUE F960_7134 (EIF_REFERENCE Current)
{
	EIF_TYPED_VALUE r;
	r.type = SK_REF;
	r.it_r = *(EIF_REFERENCE *)(Current + RTWA(4966,Dtype(Current)));
	return r;
}


/* {BOARD_TEMPLATES}.pyramid_board */
EIF_TYPED_VALUE F960_7135 (EIF_REFERENCE Current)
{
	EIF_TYPED_VALUE r;
	r.type = SK_REF;
	r.it_r = *(EIF_REFERENCE *)(Current + RTWA(4967,Dtype(Current)));
	return r;
}


/* {BOARD_TEMPLATES}.arrow_board */
EIF_TYPED_VALUE F960_7136 (EIF_REFERENCE Current)
{
	EIF_TYPED_VALUE r;
	r.type = SK_REF;
	r.it_r = *(EIF_REFERENCE *)(Current + RTWA(4968,Dtype(Current)));
	return r;
}


/* {BOARD_TEMPLATES}.diamond_board */
EIF_TYPED_VALUE F960_7137 (EIF_REFERENCE Current)
{
	EIF_TYPED_VALUE r;
	r.type = SK_REF;
	r.it_r = *(EIF_REFERENCE *)(Current + RTWA(4969,Dtype(Current)));
	return r;
}


/* {BOARD_TEMPLATES}.skull_board */
EIF_TYPED_VALUE F960_7138 (EIF_REFERENCE Current)
{
	EIF_TYPED_VALUE r;
	r.type = SK_REF;
	r.it_r = *(EIF_REFERENCE *)(Current + RTWA(4970,Dtype(Current)));
	return r;
}


/* {BOARD_TEMPLATES}.default_board_out */
EIF_TYPED_VALUE F960_7139 (EIF_REFERENCE Current)
{
	EIF_TYPED_VALUE r;
	r.type = SK_REF;
	r.it_r = *(EIF_REFERENCE *)(Current + RTWA(4971,Dtype(Current)));
	return r;
}


/* {BOARD_TEMPLATES}.easy_board_out */
EIF_TYPED_VALUE F960_7140 (EIF_REFERENCE Current)
{
	EIF_TYPED_VALUE r;
	r.type = SK_REF;
	r.it_r = *(EIF_REFERENCE *)(Current + RTWA(4972,Dtype(Current)));
	return r;
}


/* {BOARD_TEMPLATES}.cross_board_out */
EIF_TYPED_VALUE F960_7141 (EIF_REFERENCE Current)
{
	EIF_TYPED_VALUE r;
	r.type = SK_REF;
	r.it_r = *(EIF_REFERENCE *)(Current + RTWA(4973,Dtype(Current)));
	return r;
}


/* {BOARD_TEMPLATES}.plus_board_out */
EIF_TYPED_VALUE F960_7142 (EIF_REFERENCE Current)
{
	EIF_TYPED_VALUE r;
	r.type = SK_REF;
	r.it_r = *(EIF_REFERENCE *)(Current + RTWA(4974,Dtype(Current)));
	return r;
}


/* {BOARD_TEMPLATES}.pyramid_board_out */
EIF_TYPED_VALUE F960_7143 (EIF_REFERENCE Current)
{
	EIF_TYPED_VALUE r;
	r.type = SK_REF;
	r.it_r = *(EIF_REFERENCE *)(Current + RTWA(4975,Dtype(Current)));
	return r;
}


/* {BOARD_TEMPLATES}.arrow_board_out */
EIF_TYPED_VALUE F960_7144 (EIF_REFERENCE Current)
{
	EIF_TYPED_VALUE r;
	r.type = SK_REF;
	r.it_r = *(EIF_REFERENCE *)(Current + RTWA(4976,Dtype(Current)));
	return r;
}


/* {BOARD_TEMPLATES}.diamond_board_out */
EIF_TYPED_VALUE F960_7145 (EIF_REFERENCE Current)
{
	EIF_TYPED_VALUE r;
	r.type = SK_REF;
	r.it_r = *(EIF_REFERENCE *)(Current + RTWA(4977,Dtype(Current)));
	return r;
}


/* {BOARD_TEMPLATES}.skull_board_out */
EIF_TYPED_VALUE F960_7146 (EIF_REFERENCE Current)
{
	EIF_TYPED_VALUE r;
	r.type = SK_REF;
	r.it_r = *(EIF_REFERENCE *)(Current + RTWA(4978,Dtype(Current)));
	return r;
}


/* {BOARD_TEMPLATES}._invariant */
void F960_7795 (EIF_REFERENCE Current, int where)
{
	GTCX
	char *l_feature_name = "_invariant";
	RTEX;
	RTLD;
	RTDA;
	
	RTLI(1);
	RTLR(0,Current);
	RTLIU(1);
	RTLU (SK_VOID, NULL);
	RTLU (SK_REF, &Current);
	RTEAINV(l_feature_name, 959, Current, 0, 7794);
	RTSA(Dtype(Current));
	RTME(Dtype(Current), 0);
	RTLO(2);
	RTMD(0);
	RTLE;
	RTEE;
}

void EIF_Minit960 (void)
{
	GTCX
}


#ifdef __cplusplus
}
#endif
