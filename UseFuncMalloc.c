#include<stdio.h>
#include <stdlib.h>
#include<string.h>

struct test
{
        char *test;
};

func1(char *p)
{
printf("\nf11 p:%x",p);
    p=malloc(6);
printf("\nf11 p:%x",p);
    strcpy(p,"hello");
}
func2(void)
{
    char *p;//"bye";
        p = malloc(3);
        strcpy(p,"bye");
printf("\nf21 p:%x",p);
    func1(p);
printf("\nf22 p:%x",p);
    printf("\np is :%s\n",p);
}

func3(struct test *p)
{

printf("\nf31 valTest:%x",p->test);
p->test = malloc (8);
printf("\nf32 valTest:%x",p->test);
}

int main()
{
        char *p=NULL;
        struct test val;
        val.test="amit";

printf("\nfm1 valTest:%x",val.test);
func3(&val);


printf("\nfm1 p:%x",p);
    func2();
printf("\nfm1 p:%x",p);
printf("\nfm2 valTest:%x",val.test);
    return 0;
}
