import java.util.Scanner;
import java.util.Stack;

public class Day5{
    /*
    Problem Statement
You are given an array price[] of length N, where price[i] represents the stock price on day i (0-based indexing).
The span of the stock on day i is defined as the maximum number of consecutive days immediately before and including day i, for which the stock price was less than or equal to price[i].
    */
    static void prob1(int[] price){
        /*int[] pr =new int[price.length];
        pr[0] = 1;
        for(int i = 1; i<price.length; i++){
            int p = 1;
            if(price[i-1]<price[i]){
                p++;
                for(int j = 0; j<i-1; j++){
                    if(price[i]>price[j]) p++;
                }
            }
            pr[i] = p;
        }
        for (var i = 0; i < pr.length; i++) {
            System.out.print(pr[i]+" ");
        } O(n^2)*/
        int n = price.length;
        int[] pr = new int[n];
        Stack<Integer> st =new Stack<>();
        for(int i = 0 ; i<n; i++){
            while(!st.isEmpty() && price[st.peek()] <= price[i]){
                st.pop();
            }
            pr[i] = st.isEmpty() ? (i+1): (i-st.peek());
            st.push(i);
        }
        for(int i = 0; i<n; i++){
            System.out.print(pr[i]+" ");
        }
    }
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        int[] price = new int[n];
        for(int i = 0; i<n; price[i++]=sc.nextInt());
        prob1(price);
    }
}