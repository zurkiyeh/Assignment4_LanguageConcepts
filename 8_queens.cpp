#include<stdio.h>
#include<stdlib.h>

// Holds queens 
int t[8] = {-1};
// Number of solutions 
int sol = 1;



void printsol()
{	
	// Itterate the board 
	int i,j;
	// Chess board
	char crossboard[8][8];

	// Fill board with '_
	for(i=0;i<8;i++)
	{
		for(j=0;j<8;j++)
		{
			crossboard[i][j]='_';
		}
	}

	// Prints queens onto board, t[i] represents the solution index
	for(i=0;i<8;i++)
	{		
			// each queen has an X coordinate from (0..7) and a Y coordinate given by t[i]
			crossboard[i][t[i]]='q';
	}
	
	// Simply prints the board
	for(i=0;i<8;i++)
	{
		for(j=0;j<8;j++)
		{
			printf("%c ",crossboard[i][j]);
		}
		printf("\n");
	}  
}


// Checks for an attack.
int empty(int i)
{
	int j=0;
	while((t[i]!=t[j])&&(abs(t[i]-t[j])!=(i-j))&&j<8)j++;
	return i==j?1:0;
}



void queens(int i)
{
	for(t[i] = 0;t[i]<8;t[i]++)
	{
		if(empty(i))
		{
			if(i==7){
				printsol();
				printf("\n solution %d\n",sol++);
			}
			else
			queens(i+1);
		}
	}
}

	

int main()
{
	queens(0);
	return 0;
}