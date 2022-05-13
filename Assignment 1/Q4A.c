#include <stdio.h>

void getCount(char a[],int output[]);

int main(){
    char a[32];
    printf("Enter the Character Array of size 32:\n");
    for(int i=0;i<32;i++){
        scanf("%c",&a[i]);
    }
    int output[26];

    getCount(a,output);

    for(int i=0;i<26;i++){
        printf("Count of '%c' : %d\n",i+97,output[i]);
    }
}