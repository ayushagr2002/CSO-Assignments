#include <stdio.h>

void rotatematrixcw(short int a[][8]);

int main(){
    short int a[8][8];
    printf("Enter the matrix of size 8X8:\n");
    for(int i=0;i<8;i++){
        for(int j=0;j<8;j++){
            scanf("%hd",&a[i][j]);
        }
    }

    rotatematrixcw(a);

    printf("\n===============\n");
    printf("Rotated Matrix in 90 degrees clockwise direction:\n");
    for(int i=0;i<8;i++){
        for(int j=0;j<8;j++){
            printf("%hd ",a[i][j]);
        }
        printf("\n");
    }
}