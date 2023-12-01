#include"string.h"
main()
{
	void sort(char *name[],int n);
	void print(char *name[],int n);
	static char *name[]={ "CHANGJIANG","YALUZANGBUJIANG","NUJIANG","YALUJIANG","DADUHE"};
	int n=5;
	sort(name,n);
	print(name,n);
}

void sort(char *name[],int n)
{
	char *pt;
	int i,j,k;
	for(i=0;i<n-1;i++)
	{
		k=i;
		for(j=i+1;j<n;j++)
			if(strcmp(name[k],name[j])>0) k=j;
		if(k!=i)
		{
			pt=name[i];
			name[i]=name[k];
			name[k]=pt;
		}
	}
}

void print(char *name[],int n)
{
	int i;
	for (i=0;i<n;i++) printf("%s\n",name[i]);
}
