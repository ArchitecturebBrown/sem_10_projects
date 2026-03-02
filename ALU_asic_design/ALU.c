#include <stdio.h> 
#include <stdint.h> 
 
#define add 0b000 
#define sub 0b001 
#define mult 0b010 
#define and 0b011 
#define or 0b100 
#define xor 0b101 
#define SHL 0b110 
#define SHR 0b111 
 
__int32_t ALU(__int32_t x, __int32_t y, __int32_t 
select); 
 
int main() { 
    __int32_t a = 12; 
    __int32_t b = 3; 
 
    printf("Add: %d\n", ALU(a, b, add)); 
    printf("Sub: %d\n", ALU(a, b, sub)); 
    printf("Mult: %d\n", ALU(a, b, mult)); 
    printf("AND: %d\n", ALU(a, b, and)); 
    printf("OR : %d\n", ALU(a, b, or)); 
    printf("XOR: %d\n", ALU(a, b, xor)); 
    printf("SHL: %d\n", ALU(a, b, SHL)); 
    printf("SHR: %d\n", ALU(a, b, SHR)); 
 
    return 0; 
} 
__int32_t ALU(__int32_t x, __int32_t y, __int32_t 
select){ 
 
    __int32_t result = 0; 
     
    if (select == add){ 
        result = x + y; 
    } 
    else if (select == sub){ 
        result = x - y; 
    } 
    else if (select == mult){ 
        result = x * y; 
    } 
    else if (select == and){ 
        result = x & y; 
    } 
    else if (select == or){ 
        result = x | y; 
    } 
    else if (select == xor){ 
        result = x ^ y; 
    } 
    else if (select == SHL){ 
        result = x << y; 
    } 
    else if (select == SHR){ 
        result = (__uint32_t)x >> y; 
    } 
    return result;    
}
