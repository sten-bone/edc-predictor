
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>

#define MAX_INSTRUCTIONS 100000
long long instCountList[MAX_INSTRUCTIONS];
int init_flag = 0;


void profileCount(long llfiIndex){
	if(init_flag == 0){
		for(int i=0; i < MAX_INSTRUCTIONS; i++){
			instCountList[i] = 0;
		}
		init_flag = 1;
	}

	instCountList[llfiIndex] += 1;
}

void dumpResult(){
	FILE *f = fopen("dynamic-instruction-count.txt", "w");
	for(long i=0; i < MAX_INSTRUCTIONS; i++){
		if(instCountList[i] != 0){
			fprintf(f, "%ld: %lld\n", i, instCountList[i]);
		}
	}
	fclose(f);
}