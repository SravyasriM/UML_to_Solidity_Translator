package org.iitp.pl;

import static org.iitp.translator.configs.Constants.OUTPUT_DIRECTORY;
import static org.iitp.translator.configs.Constants.SOLIDITY_VERSION_DEFAULT;
import static org.iitp.translator.configs.Constants.JAVA_FOLDER_PATH;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;

import static java.nio.file.StandardCopyOption.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;
import java.util.logging.Logger;

import org.iitp.translator.Application.TranslatorApplication;
import org.iitp.translator.javaAST.JavaASTWalker;




public class JavaToSolidityTranslator {
	
	static JavaASTWalker javaAstWalker;
	static List<String> resultAnalysis = new ArrayList<String>();

	public static void main(String[] args)  {
		// TODO Auto-generated method stub
		File tempfile = new File("newfile.txt");
		try {
			tempfile.createNewFile();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
        
	  final Logger LOGGER = Logger.getLogger(Logger.GLOBAL_LOGGER_NAME);
      if(args.length >=1)LOGGER.info(args[0]);
      else
      {
    	  // TODO : throw Exception 
      }
      String outputLocation = OUTPUT_DIRECTORY;
      if(args.length >=2)
      { 
    	  LOGGER.info(args[1]);
    	  outputLocation = args[1];  
      }
      
      if(args.length>=1) JAVA_FOLDER_PATH = args[0];
     
     
      
      SOLIDITY_VERSION_DEFAULT = args.length >= 3 ? args[2] : SOLIDITY_VERSION_DEFAULT;
      //Scanner sc = new Scanner(System.in);
      //System.out.println(SOLIDITY_VERSION_DEFAULT);
     // sc.nextLine();
      
      
      // TODO : CHECK WEATHER USER FILE EXISTS OR NOT
     
     
      javaAstWalker = new JavaASTWalker(SOLIDITY_VERSION_DEFAULT,outputLocation);
      
      File file = new File(JAVA_FOLDER_PATH);
  
      resultAnalysis.add("File Path,File Name,LOC Java (including doc comments),LOC Java (excluding doc comments),No. of classes,No. of methods,Java code parsing time (seconds),AST to AST translation time (seconds),Memory usage (MB), Fail %,AST to Solidity code generation time (seconds),Memory usage (MB),LOC Solidity (including comments),LOC Solidity (excluding comments)");
      if(file.isDirectory())
      {
    	  processAllFiles(file,file.getAbsoluteFile().getPath(),outputLocation);
      } 
      else {
    	  String actualPath = file.getAbsoluteFile().getPath();
    	  try 
    	  {
    		  resultAnalysis.add(javaAstWalker.processJavaFile(actualPath,actualPath.substring(file.getAbsoluteFile().getPath().length()+1)));
    	  }
    	  catch(Exception e)
    	  {
    		  
    	  }
      }

		try {
			
			//System.out.print(JAVA_FOLDER_PATH);
			System.out.print(outputLocation+"/_resultAnalysis.csv");
			Files.write(Paths.get(outputLocation+"/_resultAnalysis.csv"), resultAnalysis);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static void processAllFiles(File folder,String userPath,String outputLocation ) 
	{
		
		for(File file : folder.listFiles())
		{
			 // Skip hidden or system files (e.g., macOS metadata files starting with ._)
        	if (file.getName().startsWith("._")) {
        	    continue;
        	}
        	
			 if(file.isDirectory())
		     {
		    	  processAllFiles(file,userPath,outputLocation);
		     }
			 else if(file.getName().endsWith(".java")) 
			 {		
				try 
				 {
				   String actualPath = file.getAbsoluteFile().getPath();
				   
				   resultAnalysis.add(javaAstWalker.processJavaFile(actualPath,actualPath.substring(userPath.length()+1)));
				   
				   //System.out.println("PathChecking : "+actualPath.substring(userPath.length()+1));
				 }
				catch(IOException e)
				 {
					 e.printStackTrace();
				 }
			 }
			 else
			 {
				 try {
					   Files.copy(file.toPath(), (new File(outputLocation+file.getName()).toPath()),REPLACE_EXISTING);
					} catch (IOException e) {
					    e.printStackTrace();
					}
				 
				
			 }
		}
		
	}
}
