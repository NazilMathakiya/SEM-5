// 2.1 - . W.A.P. to count number of even or odd number from an array of n numbers. (A)


import 'dart:io';

void main()
{
  var n,v,even=0,odd=0;
  List<int> a = [];
  print("Enter your value :: ");
  n = int.parse(stdin.readLineSync()!);

  for(int i=1;i<=n;i++)
  {
    v = int.parse(stdin.readLineSync()!);
    a.add(v);
  }

  for(int i in a)
  {
    if(i%2 == 0)
    {
      even++;
    }
    else
    {
      odd++;
    }
  }
  print("Even Number is:$even");
  print("odd number is: $odd");
}