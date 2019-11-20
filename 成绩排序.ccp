#include<stdio.h>
#include<stdlib.h>

int Sort(int *x,int);//成绩排序函数 
int Search(int *y,int,int);//成绩排名查询函数 

int main(void)
{
	A:
    //数据输入 
	int x=1;//x为学生人数
    //printf("请输入学生人数：");

    /*当读完文本时退出程序*/ 
    if(scanf("%d",&x)==EOF)
		exit(0);
    
    int y[x];//x个学生的成绩
    //printf("请输入学生成绩(用空格隔开)：");
    for(int i=0;i<x;i++)
        scanf("%d",&y[i]);
    
    int z;//需要查询排名的分数
    //printf("需要查询排名的分数：");
    scanf("%d",&z); 

    //数据处理
		//将输入的成绩进行排序 
	Sort(y,x);
		//查询成绩对应的名次
	int ranking=-1;//查询成绩的名次
	ranking=Search(y,x,z);

	//数据输出
		//输出排好序后的成绩 
	for(int i=0;i<x;i++)
	{
		printf("%d ",y[i]);
		if((i+1)%10==0 && i!=0)
			printf("\n");
	}
	printf("\n");
		//输入查询后的成绩名次
	if(ranking==-1)
		printf("no this score!");
	else

		printf("%d",ranking);
	printf("\n");

	goto A;
}

//数据输入处的模块函数 
int Sort(int *y,int x)
{
	for(int i=0,max=0,min=0;i<x;i++)//依次从x数组取出成绩,max为比较的两个成绩中较大的暂放处 ,min为较小成绩暂放处 
    {
    	max=y[i]; 
    	for(int o=i+1;o<x;o++)// 排出第i名成绩的分数 
        {
        	if(max<y[o])
        	{
        		min=max;
        		max=y[o];
        		y[o]=min;
			}
		}
        y[i]=max;
    }
    return 0;
}

int Search(int *y,int x,int z)
{
	int ranking=-1;//查询成绩的名次 
	for(int down=x,up=0,i=0;i<x;i++)//down为查询区间下限(低成绩位次），up为查询区间上限 (高成绩位次) ，i用来计数  
	{						//用二分法进行查找 
		if(y[(down+up)/2]==z)
		{
			ranking=(down+up)/2+1;
			break;
		}
		else if(y[(down+up)/2]>z)
			up=(down+up)/2;
		else if(y[(down+up)/2]<z)
			down=(down+up)/2;
	}
	return ranking;
}
