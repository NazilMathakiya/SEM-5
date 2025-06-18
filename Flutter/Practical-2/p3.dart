// 2.3 - W.A.P. to insert Strings into List and display in terminal. (A)

import 'dart:io';

void main()
{
  var str,n;
  List<String> a = [];

  print("Enter your value :: ");
  n = int.parse(stdin.readLineSync()!);

  for(int i=1;i<=n;i++)
  {
    str = stdin.readLineSync()!;
    a.add(str);
  }
  print(" your List is  :: ");
  for(String i in a)
  {

    print(i);
  }
}
