//WAP to find +ve or -ve number
import java.util.Scanner;
public class p4{
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.println("Enter n here: ");
		int n=sc.nextInt();
		if (n<0) {
			System.out.println(n+"is -ve");
		}
		else
		{
			System.out.println(n+"is +ve");
		}
	}
}