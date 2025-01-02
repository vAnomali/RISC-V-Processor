/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2020 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/

#if defined(_WIN32)
 #include "stdio.h"
 #define IKI_DLLESPEC __declspec(dllimport)
#else
 #define IKI_DLLESPEC
#endif
#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2020 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/

#if defined(_WIN32)
 #include "stdio.h"
 #define IKI_DLLESPEC __declspec(dllimport)
#else
 #define IKI_DLLESPEC
#endif
#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
typedef void (*funcp)(char *, char *);
extern int main(int, char**);
IKI_DLLESPEC extern void execute_439(char*, char *);
IKI_DLLESPEC extern void execute_1090(char*, char *);
IKI_DLLESPEC extern void execute_1091(char*, char *);
IKI_DLLESPEC extern void execute_1092(char*, char *);
IKI_DLLESPEC extern void execute_1093(char*, char *);
IKI_DLLESPEC extern void execute_1094(char*, char *);
IKI_DLLESPEC extern void execute_1095(char*, char *);
IKI_DLLESPEC extern void execute_438(char*, char *);
IKI_DLLESPEC extern void execute_1087(char*, char *);
IKI_DLLESPEC extern void execute_1088(char*, char *);
IKI_DLLESPEC extern void execute_1089(char*, char *);
IKI_DLLESPEC extern void execute_449(char*, char *);
IKI_DLLESPEC extern void execute_445(char*, char *);
IKI_DLLESPEC extern void execute_446(char*, char *);
IKI_DLLESPEC extern void execute_765(char*, char *);
IKI_DLLESPEC extern void vlog_const_rhs_process_execute_0_fast_no_reg_no_agg(char*, char*, char*);
IKI_DLLESPEC extern void execute_435(char*, char *);
IKI_DLLESPEC extern void execute_437(char*, char *);
IKI_DLLESPEC extern void execute_441(char*, char *);
IKI_DLLESPEC extern void execute_442(char*, char *);
IKI_DLLESPEC extern void execute_443(char*, char *);
IKI_DLLESPEC extern void execute_444(char*, char *);
IKI_DLLESPEC extern void execute_1096(char*, char *);
IKI_DLLESPEC extern void execute_1097(char*, char *);
IKI_DLLESPEC extern void execute_1098(char*, char *);
IKI_DLLESPEC extern void execute_1099(char*, char *);
IKI_DLLESPEC extern void execute_1100(char*, char *);
IKI_DLLESPEC extern void execute_1101(char*, char *);
IKI_DLLESPEC extern void vlog_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
funcp funcTab[29] = {(funcp)execute_439, (funcp)execute_1090, (funcp)execute_1091, (funcp)execute_1092, (funcp)execute_1093, (funcp)execute_1094, (funcp)execute_1095, (funcp)execute_438, (funcp)execute_1087, (funcp)execute_1088, (funcp)execute_1089, (funcp)execute_449, (funcp)execute_445, (funcp)execute_446, (funcp)execute_765, (funcp)vlog_const_rhs_process_execute_0_fast_no_reg_no_agg, (funcp)execute_435, (funcp)execute_437, (funcp)execute_441, (funcp)execute_442, (funcp)execute_443, (funcp)execute_444, (funcp)execute_1096, (funcp)execute_1097, (funcp)execute_1098, (funcp)execute_1099, (funcp)execute_1100, (funcp)execute_1101, (funcp)vlog_transfunc_eventcallback};
const int NumRelocateId= 29;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/test_alu_tb_behav/xsim.reloc",  (void **)funcTab, 29);

	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/test_alu_tb_behav/xsim.reloc");
}

	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net

void wrapper_func_0(char *dp)

{

}

void simulate(char *dp)
{
		iki_schedule_processes_at_time_zero(dp, "xsim.dir/test_alu_tb_behav/xsim.reloc");
	wrapper_func_0(dp);

	iki_execute_processes();

	// Schedule resolution functions for the multiply driven Verilog nets that have strength
	// Schedule transaction functions for the singly driven Verilog nets that have strength

}
#include "iki_bridge.h"
void relocate(char *);

void sensitize(char *);

void simulate(char *);

extern SYSTEMCLIB_IMP_DLLSPEC void local_register_implicit_channel(int, char*);
extern SYSTEMCLIB_IMP_DLLSPEC int xsim_argc_copy ;
extern SYSTEMCLIB_IMP_DLLSPEC char** xsim_argv_copy ;

int main(int argc, char **argv)
{
    iki_heap_initialize("ms", "isimmm", 0, 2147483648) ;
    iki_set_sv_type_file_path_name("xsim.dir/test_alu_tb_behav/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/test_alu_tb_behav/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/test_alu_tb_behav/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, (void*)0, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
