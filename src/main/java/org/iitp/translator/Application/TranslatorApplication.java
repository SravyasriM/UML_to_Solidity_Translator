package org.iitp.translator.Application;

import org.iitp.translator.benchmark_testing.ClocStatistics;
import org.iitp.translator.benchmark_testing.Statistics;
import org.iitp.translator.javaAST.JavaASTWalker;
import org.iitp.translator.solidityAST.SolidityASTWalker;

import java.io.IOException;

public class TranslatorApplication {

    public static void main(String[] args) throws IOException, InterruptedException 
    {
        //JavaASTWalker.main(null);
        //SolidityASTWalker.main(null);
        ClocStatistics.main(null);
        Statistics.main(null);
    }
}
