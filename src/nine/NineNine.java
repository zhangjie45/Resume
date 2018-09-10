package nine;

public class NineNine {
    public static void main(String[] args) {
        for (int i = 1; i <= 9; i++) {//行
            for (int j = 1; j <= i; j++) {
                String s = " ";
                if (j == i) {
                   s="";
                }
                System.out.print(i + "+" + j + s);

            }
            System.out.println("");
        }

    }
}
