// 2.4 - W.A.P. to insert double into List and display in terminal and do sum of all numbers and print it with 2 decimal only. Ex: Total
// = 22.39998 => 22.40 (A)

import 'dart:io';

void main()
{
  var n,v;
  double ans=0;
  List<double> a = [];
  print("Enter  value :: ");
  n = int.parse(stdin.readLineSync()!);

  for(int i=0;i<n;i++)
  {
    v = double.parse(stdin.readLineSync()!);
    a.add(v);
  }
  ans = a.reduce((a,b) => a+b);
  print(" YOUR ANS IS  :: ");
  print(ans);
  // for(int i=0;i<n;i++)
  // {
  //   ans+=a[i];
  // }

  print(ans.toStringAsFixed(2));
}