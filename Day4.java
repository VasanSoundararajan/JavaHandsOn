import java.util.*;
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
    static void sortWeight(int[] arr){
        HashMap<Integer, Integer> mp = new HashMap<>();
        for(int i = 0; i<arr.length; i++){
            int wt = 0;
            if(Math.ceil(Math.sqrt((double)arr[i])) == Math.floor(Math.sqrt((double)arr[i])))wt+=5;
            if(arr[i]%4 == 0 && arr[i]%6 == 0) wt+=4;
            if(arr[i]%2 == 0) wt+=3;
            mp.put(arr[i], wt);
        }
        List<Map.Entry<Integer, Integer>> list =
        new LinkedList<>(mp.entrySet());
        Collections.sort(list, (e1, e2) ->
                e2.getValue().compareTo(e1.getValue()));
        for (Map.Entry<Integer, Integer> entry : list) {
            System.out.println(entry.getKey());
        }
    }
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int d = sc.nextInt();
        int[] arr = new int[d];
        for(int i = 0; i<d; arr[i++] = sc.nextInt());
        sortWeight(arr);
        sc.close();
    }
}