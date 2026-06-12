#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>
#include <stdlib.h>

#include "arvoreB.h"

#define GRAU_MINIMO_T 3
#define TOTAL_ELEMENTOS 1000000

int main() {
    // semente fixa para garantir que o MIPS e o RISC-V vão testar os mesmos números
    srand(42); 

    printf("Iniciando Benchmark: T = %d, Elementos = %d\n", GRAU_MINIMO_T, TOTAL_ELEMENTOS);

    struct arvoreB *arvore = criarArvoreB(GRAU_MINIMO_T);

    // Inserção
    for (int i = 0; i < TOTAL_ELEMENTOS; i++) {
        int32_t chave = rand() % (TOTAL_ELEMENTOS * 10);
        inserirArvoreB(arvore, chave);
    }

    //Busca
    int32_t idx = 0;
    for (int i = 0; i < TOTAL_ELEMENTOS; i++) {
        int32_t chave_busca = rand() % (TOTAL_ELEMENTOS * 10);
        buscarArvoreB(arvore, chave_busca, &idx);
    }

    // Remoção 
    for (int i = 0; i < TOTAL_ELEMENTOS / 2; i++) {
        int32_t chave_remocao = rand() % (TOTAL_ELEMENTOS * 10);
        removerChaveArvoreB(arvore, chave_remocao);
    }

    //debug
    printf("testes finalizado com sucesso.\n");

    deletarArvore(arvore);
    return 0;
}