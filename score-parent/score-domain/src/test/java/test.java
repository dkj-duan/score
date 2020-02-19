import org.junit.Test;

public class test {

    String s = "out";
    public static void main(String[] args) {
        S2 s2 = new S2();
        s2.show();
    }
}
class S1{
    String s = "S1";

    public void show(){
        System.out.println(s);
    }

}

 class S2 extends S1{
    String s  = "S2";

 }
