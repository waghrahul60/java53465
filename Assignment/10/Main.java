import java.util.Scanner;
class Main{
    public static void main(String args[])
    {
            Scanner sc = new Scanner(System.in);

            System.out.println("Enter the Temp in Fahrenheit ");
            float f=sc.nextFloat();
            
            float cel=(f-32)*5/9;
            System.out.println(" Temp in celcius = "+ cel);
    }
}