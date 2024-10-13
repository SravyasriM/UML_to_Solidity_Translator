package org.iitp.translator.benchmark_testing;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.file.Files;
import java.nio.file.Paths;

import static org.iitp.translator.configs.Constants.*;

/*
Uses CLOC FOSS to gather the code statistics
 */
public class ClocStatistics {

    public static void main(String[] args) throws IOException, InterruptedException {


        ProcessBuilder processBuilder1 = new ProcessBuilder();
        ProcessBuilder processBuilder2 = new ProcessBuilder();

        processBuilder1.command("cloc", "--json", "testing/Character.java");
        processBuilder2.command("cloc", "--json", "testing_output/Character.sol");

        Process childProcess1 = processBuilder1.start();
        Process childProcess2 = processBuilder2.start();

        String result1 = getResultString(childProcess1);
        String result2 = getResultString(childProcess2);

        Files.writeString(Paths.get(JAVA_CLOC_RESULT_PATH), result1);
        Files.writeString(Paths.get(SOLIDITY_CLOC_RESULT_PATH), result2);
    }

    private static String getResultString(Process childProcess) throws IOException, InterruptedException {

        BufferedReader reader =
                new BufferedReader(new InputStreamReader(childProcess.getInputStream()));

        String line = "";
        StringBuilder result = new StringBuilder();
        while ((line = reader.readLine()) != null) {
            //System.out.print(line + "\n");
            result.append(line).append("\n");
        }
        childProcess.waitFor();

        return result.toString();
    }
}
