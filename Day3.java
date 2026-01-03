import java.util.Scanner;

public class Day3 {
    static void swapChallenge(int[] arr){
        int p = 0, n = 0;
        for(int i = 0; i<arr.length; i++){
            if(arr[i]<0) n++;
            else if(arr[i] >0) p++;
        }
        System.out.println(p+n+(p*n));
    }
    public static void main(String[] args) {
        Scanner sc =new Scanner(System.in);
        int n = sc.nextInt();
        int[] arr = new int[n];
        for(int i = 0; i<n; arr[i++] = sc.nextInt());
        swapChallenge(arr);
        sc.close();
    }
}
