class level{
    final int empty = 0;
    final int floor = 1;
    final int ladder = 2;
    final int wall = 3;

    int[][]map = {{3,3,3,3,3,3,3,3,3,3,3,3,3}
		  {3,0,0,0,0,0,0,0,0,0,0,0,3}
		  {3,0,0,0,0,0,0,0,0,0,0,0,3}
		  {3,0,0,1,1,1,1,1,1,1,1,0,3}
		  {3,0,0,0,0,0,0,0,0,0,2,0,3}
		  {3,0,0,0,0,0,0,0,0,0,2,0,3}
		  {3,0,0,0,0,0,0,0,0,0,2,0,3}
		  {3,0,0,0,0,0,0,0,0,0,2,0,3}
		  {3,0,0,0,0,0,0,0,0,0,2,0,3}
		  {3,0,0,0,0,0,0,0,0,0,2,0,3}
		   {3,3,3,3,3,3,3,3,3,3,3,3,3}};

    void fill{
	for(int h=0;h<map.length;h++){
	    for(int w=0;w<map[h].length;w++){
		draw();
	    }
	}
    }
}
