#include "rpn.h"
#include <stdlib.h>

NodeList* append(NodeList *list, double value) {
    NodeList *n = malloc(sizeof(NodeList));
    n->value = value;
    n->next = NULL;
    if (!list) return n;
    NodeList *t = list;
    while (t->next) t = t->next;
    t->next = n;
    return list;
}

double evaluate_list(NodeList *list) {
    if (!list) return 0.0;
    NodeList *t = list;
    double result = 0.0;
    while (t) {
        result = t->value; // parser already handles operations
        t = t->next;
    }
    return result;
}

