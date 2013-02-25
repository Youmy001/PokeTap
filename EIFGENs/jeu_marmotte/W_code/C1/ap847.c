/*
 * Code for class APPLICATION
 */

#include "eif_eiffel.h"
#include "../E1/estructure.h"


#ifdef __cplusplus
extern "C" {
#endif

extern void F847_6547(EIF_REFERENCE);
extern EIF_TYPED_VALUE F847_6548(EIF_REFERENCE);
extern EIF_TYPED_VALUE F847_6549(EIF_REFERENCE);
extern EIF_TYPED_VALUE F847_6550(EIF_REFERENCE);
extern EIF_TYPED_VALUE F847_6551(EIF_REFERENCE);
extern EIF_TYPED_VALUE F847_6552(EIF_REFERENCE);
extern void EIF_Minit847(void);

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

/* {APPLICATION}.make */
void F847_6547 (EIF_REFERENCE Current)
{
	GTCX
	char *l_feature_name = "make";
	RTEX;
	EIF_TYPED_VALUE ur1x = {0, SK_REF};
#define ur1 ur1x.it_r
	EIF_REFERENCE tr1 = NULL;
	RTSN;
	RTDA;
	RTLD;
	
	RTLI(3);
	RTLR(0,tr1);
	RTLR(1,ur1);
	RTLR(2,Current);
	RTLU (SK_VOID, NULL);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 846, Current, 0, 0, 11777);
	RTSA(Dtype(Current));
	RTSC;
	RTME(Dtype(Current), 0);
	RTGC;
	RTDBGEAA(846, Current, 11777);
	RTIV(Current, RTAL);
	RTHOOK(1);
	tr1 = RTMS_EX_H("Hello Eiffel World!\012",20,1206243338);
	ur1 = tr1;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(846, 8, Dtype(Current)))(Current, ur1x);
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(2);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(2);
	RTEE;
#undef ur1
}

/* {APPLICATION}.tempgame */
EIF_TYPED_VALUE F847_6548 (EIF_REFERENCE Current)
{
	EIF_TYPED_VALUE r;
	r.type = SK_REF;
	r.it_r = *(EIF_REFERENCE *)(Current + RTWA(846,56, Dtype(Current)));
	return r;
}


/* {APPLICATION}.tempfond */
EIF_TYPED_VALUE F847_6549 (EIF_REFERENCE Current)
{
	EIF_TYPED_VALUE r;
	r.type = SK_REF;
	r.it_r = *(EIF_REFERENCE *)(Current + RTWA(846,57, Dtype(Current)));
	return r;
}


/* {APPLICATION}.temptrou */
EIF_TYPED_VALUE F847_6550 (EIF_REFERENCE Current)
{
	EIF_TYPED_VALUE r;
	r.type = SK_REF;
	r.it_r = *(EIF_REFERENCE *)(Current + RTWA(846,58, Dtype(Current)));
	return r;
}


/* {APPLICATION}.tempmarmotte */
EIF_TYPED_VALUE F847_6551 (EIF_REFERENCE Current)
{
	EIF_TYPED_VALUE r;
	r.type = SK_REF;
	r.it_r = *(EIF_REFERENCE *)(Current + RTWA(846,59, Dtype(Current)));
	return r;
}


/* {APPLICATION}.tempmarteau */
EIF_TYPED_VALUE F847_6552 (EIF_REFERENCE Current)
{
	EIF_TYPED_VALUE r;
	r.type = SK_REF;
	r.it_r = *(EIF_REFERENCE *)(Current + RTWA(846,60, Dtype(Current)));
	return r;
}


void EIF_Minit847 (void)
{
	GTCX
}


#ifdef __cplusplus
}
#endif
