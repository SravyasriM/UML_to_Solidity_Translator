package org.iitp.translator.utilities;

import com.github.javaparser.StaticJavaParser;
import com.github.javaparser.ast.CompilationUnit;
import com.github.javaparser.printer.YamlPrinter;

import java.io.File;
import java.io.IOException;

import static org.iitp.translator.configs.Constants.JAVA_FILE_PATH;

public class Test {
    public static void main(String[] args) throws IOException {

        CompilationUnit cu = StaticJavaParser.parse(new File(JAVA_FILE_PATH));
        YamlPrinter yamlPrinter = new YamlPrinter(true);
        System.out.println(yamlPrinter.output(cu));
//        Files.writeString(Paths.get(JAVA_AST_YML_OUTPUT_PATH), yamlPrinter.output(cu));
    }
}
