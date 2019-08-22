//
//  main.m
//  RSA
//
//  Created by 蒋鹏志 on 2019/8/11.
//  Copyright © 2019 蒋鹏志. All rights reserved.
//

//1. 任取两个不同的质数p和q，计算乘积 n = pq
//2. 计算pq的欧拉函数
//3. 随机选一个整数e,满足e与m互质，且 1 < e < m
//4. 选一整数d，满足 e*d % m = 1
//5. 公钥为（n,e） 私钥为（n,d）
//6. 将明文P加密为密文C.  C = P^e mod n
//7. 将密文C解密为明文P.   P = C^d mod n

#include <stdio.h>

static int P = 11;
static int Q = 13;
static int N = 209;
static int M = 180;
static int E = 31;
static int D = 151;
// 公钥（209,31）
// 私钥 (209,151)

int getCoverModValue(int P, int E, int mod);

int main(int argc, const char * argv[]) {
    int M = 100;   // 原文
    int C = getCoverModValue(M, E, N);  // 密文
    printf("加密后：%d\n",C);
    
    int res = getCoverModValue(C, D, N);
    printf("解密后 %d\n",res);
    return 0;
}


// 计算机 P^e mod n 这种幂运算时，经常会超出计算机范围，需要特殊的去处理一下。可根据  (a*b)%c => (a%c * b)%c  用循环遍历的方式可以解决这个问题。

/**
 求P^e mod n
 
 @param P 底数
 @param E 幂次
 @param mod 求模
 @return 结果
 */
int getCoverModValue(int P, int E, int mod) {
    int res = 1;
    for (int i = 0; i < E; i++ ) {
        res = (res * P) % mod;
    }
    return res;
}

