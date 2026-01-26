import java.util.Arrays;
import java.util.Scanner;

public class Day6{
    static void prob1(String s){
        char[] sb = s.toCharArray();
        int i = 0, j = s.length()-1;
        while(i<j){
            char c1 =s.charAt(i), c2 = s.charAt(j);
            if(Character.isLetter(c1) && Character.isLetter(c2)){
                sb[i] = c2;
                sb[j] = c1;
                j--;
                i++;
            }
            else if(!Character.isLetter(c1)){
                i++;
            }else if(!Character.isLetter(c2)){
                j--;
            }
        }
        System.out.println(new String(sb));
    }
    static int maxArrayOfM(int[] arr, int m){
        int[] a = {52, 24, 23, 43};
        int k=5;   
        int dp[]=new int[k];
        Arrays.fill(dp,-1);
        dp[0]=0;
        for(int num:a)
        {
            int newDp[]=dp.clone();
            for (int i=0;i<k;i++)
            {
                if (dp[i]!=-1)
                {
                    int newSum=dp[i]+num;
                    int newRem=newSum%k;
                    newDp[newRem]=Math.max(newDp[newRem],newSum);
                }
            }
            dp=newDp;
        }
        System.out.println(dp[0]);
    }
//     import java.io.*;
// import java.util.*;

// public class Solution {
//     public static void main(String[] args) {
//         Scanner sc = new Scanner(System.in);
//         int n = sc.nextInt();
//         int[] a = new int[n];
//         for (int i = 0; i < n; i++) {
//             a[i] = sc.nextInt();
//         }
        
//         Arrays.sort(a);
//         long res = 1;  // smallest sum we cannot form yet
//         for (int i = 0; i < n; i++) {
//             if (a[i] <= res) {
//                 res += a[i];
//             } else {
//                 break;
//             }
//         }
//         System.out.println(res);
//     }
// }
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        int[] arr = new int[n];
        for(int i = 0; i< n; i++){
            arr[i] = sc.nextInt();
        }
        int m = sc.nextInt();
        System.out.print(maxArrayOfM(arr, m));
    }
}
