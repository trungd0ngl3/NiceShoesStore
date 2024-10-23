package lab;

import java.io.File;
import java.io.FilenameFilter;
import java.util.Iterator;

public class WLister {
	public static boolean deleteDir(String path) {
		File file = new File(path);
		String[] list = file.list();
		for(String s : list) {
			File currentFile = new File(file.getPath(),s);
			currentFile.delete();
		}
		

		return false;
	}

	public static void main(String[] args) {
//		File path = new File("W:\\");
//		String[] list;
//		list = path.list(new DirFilter(".tgz"));
//		for (int i = 0; i < list.length; i++) {
//			System.out.println(list[i]);
//		}

		deleteDir("message");

	}

}

class DirFilter implements FilenameFilter {
	String afn;

	public DirFilter(String afn) {
		this.afn = afn;
	}

	@Override
	public boolean accept(File dir, String name) {
		String f = new File(name).getName();
		return f.indexOf(afn) != -1;
	}

}
