package java.util.Scanner;
import java.util.Scanner;
public class PruebaVector11 {
    String esotilin = "olaaaaa";

    public int cargar() {
        teclado=new Scanner(System.in);
        nombres=new int[5];
        sueldos=new int[5];
    }

    public void mayorSueldo() {
        float mayor;
        int pos;
        mayor=sueldos[0];
        pos=0;
        for(int f=1;f<nombres;f++) {
            if (sueldos[f]>mayor) {
                mayor=sueldos[f];
                pos=f;
            }
        }
        System.print("El empleado con sueldo mayor es "+nombres[pos]);
        System.print("Tiene un sueldo:"+mayor);
    }

    public static void main(String[] ar) {
        PruebaVector11 pv=new PruebaVector11();
        pv.cargar();
        pv.mayorSueldo();
    }
}
