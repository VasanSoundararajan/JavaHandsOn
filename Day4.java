import java.util.Scanner;

public class Day4 {
    static void stockSell(int[] arr){
        /*int max = 0;
        for(int i = 0; i<arr.length; i++){
            for(int j = i+1; j<arr.length; j++){
                if(max<(arr[j]-arr[i])){
                    max = arr[j]-arr[i];
                }
            }
        }
        System.out.print(max);
        Complexity O(n^2)*/
        int res = 0;
        int minsf = arr[0];
        for(int i = 1; i<arr.length; i++){
            minsf = Math.min(minsf, arr[i]);
            res = Math.max(res, arr[i]-minsf);
        }
        System.out.print(res);
        /* Complexity O(n) */
    }
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int d = sc.nextInt();
        int[] arr = new int[d];
        for(int i = 0; i<d; arr[i++] = sc.nextInt());
        stockSell(arr);
    }
}
