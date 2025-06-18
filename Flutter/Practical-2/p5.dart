//5. W.A.P. to sort values in List. Ex. Input : [13, 2, -11, 142, -389, 0] Result: [-389, -11, 0, 2, 13, 142] (B)

import 'dart:io';

void main()
{
  var n,v;
  List<int> a = [];
  print("Enter  value :: ");
  n = int.parse(stdin.readLineSync()!);

  for(int i=1;i<=n;i++)
  {
    v = int.parse(stdin.readLineSync()!);
    a.add(v);
  }

  for(int i=0;i<n-1;i++)
  {
    for(int j=0;j<n-i-1;j++)
    {
      if(a[j] > a[j+1])
      {
        int temp = a[j];
        a[j] = a[j+1];
        a[j+1] = temp;
      }
    }
  }
  print("Your Sorted List is  :: ");
  print(a);
}
