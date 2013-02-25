/*
 * Code for class FOND_ECRAN
 */

#include "eif_eiffel.h"
#include "../E1/estructure.h"


#ifdef __cplusplus
extern "C" {
#endif

extern void F846_6546(EIF_REFERENCE);
extern void EIF_Minit846(void);

#ifdef __cplusplus
}
#endif

#include <string.h>

#ifdef __cplusplus
extern "C" {
#endif


#ifdef __cplusplus
}
#endif


#ifdef __cplusplus
extern "C" {
#endif

/* {FOND_ECRAN}.affiche_fond_ecran */
void F846_6546 (EIF_REFERENCE Current)
{
	GTCX
	char *l_feature_name = "affiche_fond_ecran";
	RTEX;
	EIF_NATURAL_32 loc1 = (EIF_NATURAL_32) 0;
	EIF_INTEGER_32 loc2 = (EIF_INTEGER_32) 0;
	EIF_POINTER loc3 = (EIF_POINTER) 0;
	EIF_REFERENCE loc4 = (EIF_REFERENCE) 0;
	EIF_REFERENCE loc5 = (EIF_REFERENCE) 0;
	EIF_POINTER loc6 = (EIF_POINTER) 0;
	EIF_POINTER loc7 = (EIF_POINTER) 0;
	EIF_POINTER loc8 = (EIF_POINTER) 0;
	EIF_INTEGER_32 loc9 = (EIF_INTEGER_32) 0;
	EIF_INTEGER_32 loc10 = (EIF_INTEGER_32) 0;
	EIF_TYPED_VALUE up1x = {0, SK_POINTER};
#define up1 up1x.it_p
	EIF_TYPED_VALUE up2x = {0, SK_POINTER};
#define up2 up2x.it_p
	EIF_TYPED_VALUE up3x = {0, SK_POINTER};
#define up3 up3x.it_p
	EIF_TYPED_VALUE up4x = {0, SK_POINTER};
#define up4 up4x.it_p
	EIF_TYPED_VALUE ur1x = {0, SK_REF};
#define ur1 ur1x.it_r
	EIF_TYPED_VALUE ui4_1x = {0, SK_INT32};
#define ui4_1 ui4_1x.it_i4
	EIF_TYPED_VALUE ui4_2x = {0, SK_INT32};
#define ui4_2 ui4_2x.it_i4
	EIF_TYPED_VALUE ui4_3x = {0, SK_INT32};
#define ui4_3 ui4_3x.it_i4
	EIF_TYPED_VALUE uu4_1x = {0, SK_UINT32};
#define uu4_1 uu4_1x.it_n4
	EIF_TYPED_VALUE ui2_1x = {0, SK_INT16};
#define ui2_1 ui2_1x.it_i2
	EIF_POINTER tp1;
	EIF_REFERENCE tr1 = NULL;
	EIF_INTEGER_32 ti4_1;
	EIF_NATURAL_32 tu4_1;
	EIF_INTEGER_16 ti2_1;
	RTSN;
	RTDA;
	RTLD;
	
	RTLI(5);
	RTLR(0,loc4);
	RTLR(1,loc5);
	RTLR(2,tr1);
	RTLR(3,ur1);
	RTLR(4,Current);
	RTLU (SK_VOID, NULL);
	RTLU (SK_REF, &Current);
	RTLU(SK_UINT32, &loc1);
	RTLU(SK_INT32, &loc2);
	RTLU(SK_POINTER, &loc3);
	RTLU(SK_REF, &loc4);
	RTLU(SK_REF, &loc5);
	RTLU(SK_POINTER, &loc6);
	RTLU(SK_POINTER, &loc7);
	RTLU(SK_POINTER, &loc8);
	RTLU(SK_INT32, &loc9);
	RTLU(SK_INT32, &loc10);
	
	RTEAA(l_feature_name, 845, Current, 10, 0, 11776);
	RTSA(Dtype(Current));
	RTSC;
	RTME(Dtype(Current), 0);
	RTGC;
	RTDBGEAA(845, Current, 11776);
	RTIV(Current, RTAL);
	RTHOOK(1);
	RTDBGAL(Current, 1, 0x38000000, 1, 0); /* loc1 */
	
	loc1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(837, 45, 837))(Current)).it_n4);
	RTHOOK(2);
	RTDBGAL(Current, 2, 0x10000000, 1, 0); /* loc2 */
	
	uu4_1 = loc1;
	loc2 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(837, 32, 837))(Current, uu4_1x)).it_i4);
	RTHOOK(3);
	RTDBGAL(Current, 4, 0xF80000C9, 0, 0); /* loc4 */
	
	loc4 = RTMS_EX_H("poke_arena.bmp",14,410803056);
	RTHOOK(4);
	RTDBGAL(Current, 5, 0xF800007B, 0, 0); /* loc5 */
	
	tr1 = RTLN(123);
	ur1 = RTCCL(loc4);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWPC(72, 0, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(4,1);
	loc5 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(5);
	RTDBGAL(Current, 7, 0x40000000, 1, 0); /* loc7 */
	
	tp1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVPF(72, 19, "item", loc5))(loc5)).it_p);
	up1 = tp1;
	loc7 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(837, 33, 837))(Current, up1x)).it_p);
	RTHOOK(6);
	RTDBGAL(Current, 10, 0x10000000, 1, 0); /* loc10 */
	
	up1 = loc7;
	loc10 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(837, 42, 837))(Current, up1x)).it_i4);
	RTHOOK(7);
	RTDBGAL(Current, 9, 0x10000000, 1, 0); /* loc9 */
	
	up1 = loc7;
	loc9 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(837, 43, 837))(Current, up1x)).it_i4);
	RTHOOK(8);
	RTDBGAL(Current, 3, 0x40000000, 1, 0); /* loc3 */
	
	ui4_1 = loc9;
	ui4_2 = loc10;
	ui4_3 = ((EIF_INTEGER_32) 32L);
	tu4_1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(837, 46, 837))(Current)).it_n4);
	uu4_1 = tu4_1;
	loc3 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWF(837, 34, 837))(Current, ui4_1x, ui4_2x, ui4_3x, uu4_1x)).it_p);
	RTHOOK(9);
	RTDBGAL(Current, 8, 0x40000000, 1, 0); /* loc8 */
	
	tp1 = ((EIF_POINTER) 0);
	loc8 = (EIF_POINTER) tp1;
	RTHOOK(10);
	RTDBGAL(Current, 6, 0x40000000, 1, 0); /* loc6 */
	
	ti4_1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(837, 44, 837))(Current)).it_i4);
	ui4_1 = ti4_1;
	tp1 = malloc((size_t)ui4_1);
	loc6 = (EIF_POINTER) tp1;
	RTHOOK(11);
	up1 = loc6;
	ti2_1 = (EIF_INTEGER_16) ((EIF_INTEGER_32) 0L);
	ui2_1 = ti2_1;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWF(837, 38, 837))(Current, up1x, ui2_1x);
	RTHOOK(12);
	up1 = loc6;
	ti2_1 = (EIF_INTEGER_16) ((EIF_INTEGER_32) 0L);
	ui2_1 = ti2_1;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWF(837, 39, 837))(Current, up1x, ui2_1x);
	RTHOOK(13);
	up1 = loc6;
	ui4_1 = loc9;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWF(837, 41, 837))(Current, up1x, ui4_1x);
	RTHOOK(14);
	up1 = loc6;
	ui4_1 = loc10;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWF(837, 40, 837))(Current, up1x, ui4_1x);
	RTHOOK(15);
	RTDBGAL(Current, 2, 0x10000000, 1, 0); /* loc2 */
	
	up1 = loc7;
	tp1 = ((EIF_POINTER) 0);
	up2 = tp1;
	up3 = loc3;
	up4 = loc6;
	loc2 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWF(837, 35, 837))(Current, up1x, up2x, up3x, up4x)).it_i4);
	RTHOOK(16);
	RTDBGAL(Current, 2, 0x10000000, 1, 0); /* loc2 */
	
	up1 = loc3;
	loc2 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(837, 36, 837))(Current, up1x)).it_i4);
	RTHOOK(17);
	tu4_1 = (EIF_NATURAL_32) ((EIF_INTEGER_32) 2000L);
	uu4_1 = tu4_1;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(837, 37, 837))(Current, uu4_1x);
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(18);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(12);
	RTEE;
#undef up1
#undef up2
#undef up3
#undef up4
#undef ur1
#undef ui4_1
#undef ui4_2
#undef ui4_3
#undef uu4_1
#undef ui2_1
}

void EIF_Minit846 (void)
{
	GTCX
}


#ifdef __cplusplus
}
#endif
