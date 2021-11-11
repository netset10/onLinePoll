package com.koreait.onlinePoll;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.Scanner;

public class PollRead {
	// 파일 경로&이름을 받아 읽고 ArrayList에 저장 후 리턴
	public static ArrayList<String> pollRead(String filepath){
		ArrayList<String> list=new ArrayList<String>();
		Scanner s=null;
		
		
		try {
			s=new Scanner(new File(filepath));
			
			while(s.hasNext()) {
				String str=s.nextLine().trim();
				if(str.length()>0)
					list.add(str);
			}
			
		} catch (FileNotFoundException e) {
			System.out.println("파일을 찾을 수 없습니다.");
		} finally {
			if(s!=null) s.close();
		}
		
		return list;
	}

}
