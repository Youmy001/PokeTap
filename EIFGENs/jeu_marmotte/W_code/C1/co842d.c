/*
 * Class COLLISION
 */

#include "eif_macros.h"


#ifdef __cplusplus
extern "C" {
#endif

static EIF_TYPE_INDEX gen_type0_842 [] = {0,218,841,0xFFFF};
static EIF_TYPE_INDEX gen_type1_842 [] = {0,0,0xFFFF};
static EIF_TYPE_INDEX gen_type2_842 [] = {0,0,0xFFFF};
static EIF_TYPE_INDEX gen_type3_842 [] = {0,0,0xFFFF};


static struct desc_info desc_842[] = {
	{(BODY_INDEX) -1, (BODY_INDEX) -1, INVALID_DTYPE, NULL},
	{0, (BODY_INDEX)-1, 201, NULL},
	{1, (BODY_INDEX)-1, 218, gen_type0_842},
	{2, (BODY_INDEX)-1, 172, NULL},
	{3, (BODY_INDEX)-1, 172, NULL},
	{4, (BODY_INDEX)-1, 172, NULL},
	{5, (BODY_INDEX)-1, 172, NULL},
	{6, (BODY_INDEX)-1, 172, NULL},
	{7, (BODY_INDEX)-1, 172, NULL},
	{8, (BODY_INDEX)-1, 172, NULL},
	{9, (BODY_INDEX)-1, 172, NULL},
	{10, (BODY_INDEX)-1, 841, NULL},
	{11, (BODY_INDEX)-1, (EIF_TYPE_INDEX)-1, NULL},
	{12, (BODY_INDEX)-1, (EIF_TYPE_INDEX)-1, NULL},
	{13, (BODY_INDEX)-1, 0, gen_type1_842},
	{14, (BODY_INDEX)-1, 0, gen_type2_842},
	{15, (BODY_INDEX)-1, 841, NULL},
	{16, (BODY_INDEX)-1, 841, NULL},
	{17, (BODY_INDEX)-1, 0, gen_type3_842},
	{18, (BODY_INDEX)-1, (EIF_TYPE_INDEX)-1, NULL},
	{19, (BODY_INDEX)-1, (EIF_TYPE_INDEX)-1, NULL},
	{20, (BODY_INDEX)-1, 12, NULL},
	{21, (BODY_INDEX)-1, 201, NULL},
	{22, (BODY_INDEX)-1, 201, NULL},
	{23, (BODY_INDEX)-1, (EIF_TYPE_INDEX)-1, NULL},
	{24, (BODY_INDEX)-1, 13, NULL},
	{25, (BODY_INDEX)-1, (EIF_TYPE_INDEX)-1, NULL},
	{26, (BODY_INDEX)-1, (EIF_TYPE_INDEX)-1, NULL},
	{27, (BODY_INDEX)-1, (EIF_TYPE_INDEX)-1, NULL},
	{28, (BODY_INDEX)-1, 841, NULL},
	{29, (BODY_INDEX)-1, 196, NULL},
	{30, (BODY_INDEX)-1, 841, NULL},
	{11772, 0, 843, NULL},
	{11773, 4, 844, NULL},
	{11774, 8, 836, NULL},
};

extern void Init842(void);
void Init842(void)
{
	IDSC(desc_842, 0, 841);
	IDSC(desc_842 + 1, 1, 841);
	IDSC(desc_842 + 32, 338, 841);
}


#ifdef __cplusplus
}
#endif
