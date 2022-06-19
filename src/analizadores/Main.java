package analizadores;/*
 * Ejemplo desarrollado por Erick Navarro
 * Blog: e-navarro.blogspot.com
 * Julio - 2018
 */

import java.io.FileInputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;

/**
 * Clase principal de la aplicación
 * @author Erick
 */
public class Main {

    /**
     * @param args argumentos de la linea de comando
     */
    public static void main(String[] args) {
        interpretar("/home/fwcheesecake/IdeaProjects/testsyntaxer/src/entrada.txt");
    }
    /**
     * Método que interpreta el contenido del archivo que se encuentra en el path
     * que recibe como parámentro
     * @param path ruta del archivo a interpretar
     */
    private static void interpretar(String path) {
        try {
            InputStream initialSTream = new FileInputStream(path);
            Reader targetReader = new InputStreamReader(initialSTream);

            Lexico lexico = new Lexico(targetReader);
            Sintactico pars = new Sintactico(lexico);
            pars.parse();
        } catch (Exception ex) {
            ex.printStackTrace();
            System.out.println("Error fatal en compilación de entrada.");
            System.out.println("Causa: "+ex.getCause());
        }
    }

}