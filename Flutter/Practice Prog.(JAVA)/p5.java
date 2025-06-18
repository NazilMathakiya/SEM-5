//WAP to perform basic calculator using else-if ladder and switch case
import java.util.Scanner;
public class p5 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.println("Enter n1: ");
		int n1=sc.nextInt();
		System.out.println("Enter n2: ");
		int n2=sc.nextInt();
		System.out.println("Enter operator: ");
		String op = sc.nextLine();
		if (op=="+") {
			System.out.println("Addition is "+(n1+n2));
		}
		else if (op=="-") {
			System.out.println("Subtraction is "+(n1-n2));
		}
		else if (op=="*") {
			System.out.println("Multiplication is "+(n1*n2));
		}
		else if (op=="/") {
			System.out.println("Division is "+(n1/n2));
		}
		else
		{
			System.out.println("Invalid Operator");
		}
	}
}