#include <stdio.h>

unsigned hammingdist(unsigned n1,unsigned n2);

int main(){
    unsigned n1,n2;
    printf("Enter 1st Number: ");
    scanf("%u",&n1);
    printf("Enter 2nd Number: ");
    scanf("%u",&n2);

    unsigned result = hammingdist(n1,n2);
    
    printf("Hamming Distance is : %u\n",result);
}