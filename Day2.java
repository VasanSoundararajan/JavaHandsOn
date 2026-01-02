import java.util.Arrays;
import java.util.HashMap;
import java.util.Scanner;

public class Day2 {
    static void smartShoping(int n, int k, int[] arr){
        /*for(int i = 0; i<n; i++){
            for(int j = 0; j<n; j++){
                if(arr[i]>arr[j]){
                    int temp = arr[i];
                    arr[i] = arr[j];
                    arr[j] = temp;
                }
            }
        }
        int sum = 0;
        if(arr.length % k != 0){
            n -= arr.length % k;
        }
        for(int i = 0; i<n; i+=k){
            for(int j = 1; j<k; j++){
                sum+=arr[j+i];
            }
        }
        for(int i = n; i<arr.length; sum+=arr[i++]);
        System.out.println(sum);
        time complexity O(n^2)*/
        Arrays.sort(arr);//O(nlogn)
        int m = n/k, sum = 0;
        for(int i = 0; i<n-m; sum+=arr[i++]);
        System.out.print(sum);
    }
    static void noodleKing(int m){
        int i=0;
        for(i = 0; Math.pow(2, i)<=m; i++);
        System.out.print(i-1);
        /* Bitmanupulation
        int c=0;
        while(n>0){
            c++;
            n>>=1;
        }
        System.out.print(c-1);
         */
    }
    static String genericPattern(String dna, String pattern){
        if(dna==null || pattern == null || dna.length()<pattern.length())
        return "";
        HashMap<Character, Integer> mCount = new HashMap<>();
        for(char c: pattern.toCharArray()){
            mCount.put(c, mCount.getOrDefault(c, 0)+1);
        }
        int reqCount=mCount.size(), formed=0;
        HashMap<Character, Integer> wCount = new HashMap<>();
        int i = 0, j = 0,minlen = Integer.MAX_VALUE, start=0;
        while(j<dna.length()){
            char c = dna.charAt(j);
            wCount.put(c, wCount.getOrDefault(c, 0)+1);
            if(mCount.containsKey(c)&&wCount.get(c).intValue()==mCount.get(c))
                formed++;
            while(i<=j&&formed==reqCount){
                if(j-i+1 < minlen){
                    minlen = j-i+1;
                    start = i;
                }
                char chleft = dna.charAt(i);
                wCount.put(chleft, wCount.get(chleft)-1);
                if(mCount.containsKey(chleft)&&wCount.get(chleft)<mCount.get(chleft))
                    formed--;
                i++;
            }
            j++;
        }
        return minlen==Integer.MAX_VALUE?"":dna.substring(start, start+minlen);
    }
    public static void main(String[] args){
        Scanner sc = new Scanner(System.in);
        String dna = sc.next();
        String pattern = sc.next();
        System.out.println(genericPattern(dna, pattern));
        sc.close();
    }
}
