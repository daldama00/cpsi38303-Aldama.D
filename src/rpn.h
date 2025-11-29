#ifndef RPN_H
#define RPN_H

typedef struct NodeList {
    double value;
    struct NodeList *next;
} NodeList;

NodeList* append(NodeList *list, double value);
double evaluate_list(NodeList *list);

#endif

