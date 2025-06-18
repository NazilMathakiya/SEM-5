//WAP to find percentage of 5 subjects
import java.util.Scanner;
public class p2{
	public static void main(String[] args) {
			Scanner sc = new Scanner(System.in);
			System.out.println("Enter subject marks: ");
			int s1=sc.nextInt();
			int s2=sc.nextInt();
			int s3=sc.nextInt();
			int s4=sc.nextInt();
			int s5=sc.nextInt();
			double percent=((s1+s2+s3+s4+s5)/500.0)*100.0;
			System.out.println("Percentage is "+ percent);
	}
}