package lab;

import java.io.File;
import java.util.Scanner;

public class Ex2_CMD {
	File defaulDir;

	public Ex2_CMD(String initDir) {
		this.defaulDir = new File(initDir);
	}

	public void run() {
		while(true) {
			printPrompt();
			
			
		}

		
	}

	private void printPrompt() {
		// TODO Auto-generated method stub
		
	}

	/////////
	public static void cmd() {
		String input = "";
		Scanner sc = new Scanner(System.in);
		File path = new File("W:\\temp");
		while (!input.equalsIgnoreCase("Exit")) {

			System.out.print(path.getAbsolutePath() + "> ");
 
			input = sc.nextLine();
			String[] arr = input.split(" ", 2);
			if (arr[0].equalsIgnoreCase("cd")) {
				if (arr[1].equals("..")) {
					File newPath = new File(path.getParent());
					path = newPath;
				} else {
					File newPath = new File(path, "\\" + arr[1]);
					if (newPath.exists()) {
						path = newPath;
					} else {
						System.out.println("input path is not valid");
					}

				}
			}
			if (arr[0].equalsIgnoreCase("dir")) {
				File[] list = path.listFiles();
				for (File i : list) {
					System.out.println(i.getName());
				}
			}

		}
		sc.close();

	}

	public static void main(String[] args) {
		String dir = "W:\\temp";
		new Ex2_CMD(dir).run();
	}
}
