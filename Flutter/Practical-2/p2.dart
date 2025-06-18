// 2.2 - W.A.P. to insert int numbers into List and display in terminal. (A)

import 'dart:io';

void main()
{
  var n,v;
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
    print(i);
  }
}