package;

class Main
{
	public static var flArray:Array<Float> = [234,5643,1734,45234,73,561,3423,5464,356,86546,54324,65,4235];
	public static var twoDArray:Array<Array<Float>> = [[2,2,3,8],[2,2,3,5]];//[[234,5643,1734,45234],[73,561,3423,5464],[356,86546,54324,65],[4235,3478,4980,3423]];
	public static var twoDArrayB:Array<Array<Float>> = [[2,3],[2,2],[2,2],[4,7]];//[[234,5643,1734,45234],[73,561,3423,5464],[356,86546,54324,65],[4235,3478,4980,3423]];
	public static var resultArray:Array<Array<Float>>;
	public static function main() {
		
		trace(sequencialSearch(flArray,65));
		exchangeSortLowHigh(flArray);

		trace(flArray);

		trace(sequencialSearch(flArray,65));
		trace(binarySearch(flArray,1734));

		matrixMult(twoDArray,twoDArrayB);
		trace(resultArray);
		matrixMult(twoDArrayB,twoDArray);
		trace(resultArray);

		trace(fib(6));
	}


	public static function fib(n):Int
	{
		var fibNums = [0,1];

		if(n <= 1)
			return n;
		else
		{
			for(i in 2...n)
			{
				fibNums[i] = fibNums[i - 1] + fibNums[i - 2];
			}
			return fibNums[n-1];
		}
	}

	/*
	*	Array must be sorted low to high
	*/
	public static function binarySearch(arr:Array<Float>,v:Float):Int
	{
		var result:Int = -1;
		var low:Int = 0;
		var high:Int = arr.length;
		var mid:Int;
		while(result == -1 && low <= high)
		{
			mid = Math.floor((low+high)/2);
			if(arr[mid] == v)
			{
				result = mid;
			}
			else if(arr[mid] > v)
			{
				high = mid - 1;
			}
			else if(arr[mid] < v)
			{
				low = mid + 1;
			}
		}
		return result;
	}

	public static function sequencialSearch(arr:Array<Float>,v:Float):Int
	{
		var i:Int = 0;
		while(i <= arr.length && arr[i] != v)
		{
			i++;
		}
		if(i == arr.length)
			i = -1;
		return i;
	}


	public static function exchangeSortLowHigh(arr:Array<Float>)
	{
		for(i in 0...arr.length)
		{
			for(j in (i + 1)...arr.length)
			{
				if(arr[i] > arr[j])
				{
					var oldJ:Float = arr[j];
					arr[j] = arr[i];
					arr[i] = oldJ;
				}
			}
		}
	}

	public static function matrixMult(a:Array<Array<Float>>, b:Array<Array<Float>>)
	{
		resultArray = [];

		for (i in 0...a.length)
		{
			resultArray.push([]);
			for(j in 0...a.length)
			{
				resultArray[i][j] = 0;
				for(k in 0...a[i].length)
				{
					resultArray[i][j] += a[i][k] * b[k][j];
				}
			}
		}
	}
}