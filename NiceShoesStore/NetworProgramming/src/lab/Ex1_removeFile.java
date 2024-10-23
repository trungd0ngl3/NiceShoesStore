package lab;

import java.io.File;

public class Ex1_removeFile {

	public static boolean delete(String path) {
		File file = new File(path);

		if (!file.exists()) {
			System.out.println("path is not exist");
			return true;
		}
		if (file.isDirectory()) {
			File[] list = file.listFiles();

			for (File f : list) {
				delete(f.getAbsolutePath());
			}
		}

		return file.delete();
	}

	public static boolean deleteRemainFileTree(String path) {
		File file = new File(path);

		if (!file.exists()) {
			System.out.println("path is not exist");
			return true;
		}
		if (file.isFile()) {
			return file.delete();
		}
		if (file.isDirectory()) {
			File[] list = file.listFiles();
			for (File i : list) {
				deleteRemainFileTree(i.getAbsolutePath());

			}
		}
		return true;
	}

	public static void main(String[] args) {
		String path = "src/folder";
		System.out.println(deleteRemainFileTree(path));
	}

}
