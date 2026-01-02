import java.util.Scanner;

public class Day1 {// Compliant
    public static void minimumSum(int n, int[] arr1, int[] arr2){
        for(int i = 0; i<n; i++){
            for(int j = 0; j<n; j++){
                if(arr1[i]<arr1[j]){
                    int temp = arr1[i];
                    arr1[i] = arr1[j];
                    arr1[j] = temp;
                }
            }
        }
        for(int i = 0; i<n; i++){
            for(int j = 0; j<n; j++){
                if(arr2[i]>arr2[j]){
                    int temp = arr2[i];
                    arr2[i] = arr2[j];
                    arr2[j] = temp;
                }
            }
        }
        int sum = 0;
        for (var i = 0; i < n; i++) {
            sum += arr1[i]*arr2[i];
        }
        System.out.print(sum);
    }
    static String countSay(int n){
        if(n==1) return "1";
        String str = countSay(n-1);
        StringBuffer res = new StringBuffer();
        for (int i = 0; i < str.length(); i++) {
            int count = 1;
            for (int j = i+1; j < str.length(); j++) {
                if(str.charAt(j) == str.charAt(j-1)){
                    count++;
                }
                else
                    break;
            }
            res.append(count);
            res.append(str.charAt(i));
            i+=count-1;
        }
        return new String(res);
    }
    static String consecutiveRemoval(String s){
        StringBuffer res = new StringBuffer();
        for (int i = 0; i < s.length(); i++) {
            int cnt = 1;
            for (int j = i+1; j < s.length(); j++) {
                if(s.charAt(j)==s.charAt(j-1)){
                    cnt++;
                }
                else break;
            }
            res.append(s.charAt(i));
            i+=cnt-1;
        }
        return res.toString();
    }
    static String rr(String s){
        StringBuffer res = new StringBuffer();
        for (int i = 0; i < s.length(); i++) {
            int cnt = 1;
            for (int j = i+1; j < s.length(); j++) {
                if(s.charAt(j)==s.charAt(j-1)){
                    cnt++;
                }
                else break;
            }
            if(cnt == 1)
                res.append(s.charAt(i));
            i+=cnt-1;
        }
        return res.toString();
    }
    static void recursiveConsecutiveRemoval(String s){
        while(true){
            String res = rr(s);
            if(res.length() == s.length()){
                System.out.print(res);
                break;
            }
            s = res;
        }
    }
    static void passwordCheck(String old, String npa){
        if(old.length() != npa.length()) System.out.print("No");
        for(int i = 1; i<old.length(); i++){
            String s = old.substring(i)+old.substring(0, i);
            System.out.println(s);
            if(s.equals(npa)){
                System.out.print("Yes");
                return;
            }
        }
        System.out.print("No");
        /* 
        sample = old + old;
        if(sample.contains(npa)) System.out.print("Yes");
        else System.out.print("No");
         */
    }
    static int visitHome(int n, int[] arr){
        int sum = 0;
        for(int i = 0; i<n; i+=arr[i])
        sum++;
        return sum;
    }
    static int penSwitch(int n, int[] arr){
        int cnt = 0;
        for(int i = 1; i<n ; i++){
            if(arr[i]%2 == arr[i-1]%1 && (arr[i-1]%2 != 0)) cnt++;
        }
        return cnt;
    }
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        // int n = sc.nextInt();
        // int[] a = new int[n], b = new int[n];
        // for(int i = 0; i<n; a[i++]=sc.nextInt());
        // for(int i = 0; i<n; b[i++]=sc.nextInt());
        // minimumSum(n, a, b);
        int n = sc.nextInt();
        int[] a = new int[n];
        for(int i=0; i<n; a[i++]=sc.nextInt());
        System.out.print(penSwitch(n, a));
        sc.close();
    }
}
