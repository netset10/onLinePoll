package com.koreait.onlinePoll;

import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.util.ArrayList;

public class PollWrite {
	public static void pollWrite(String filepath, ArrayList<String> poll) {
		PrintWriter pw=null;
		try {
			pw=new PrintWriter(filepath);
			
			for(String str:poll)
				pw.write(str+"\r\n");
			
		}catch(FileNotFoundException e) {
			System.out.println("디스크에 파일이 존재하지 않습니다.");
			
		}finally {
			if(pw!=null) pw.close();
		}
		
	}

}
