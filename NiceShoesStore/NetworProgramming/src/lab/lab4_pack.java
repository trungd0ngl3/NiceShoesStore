package lab;

import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.RandomAccessFile;
import java.util.ArrayList;
import java.util.List;

public class lab4_pack {

	// return fileList by folder
	public static List<File> getFiles(String folder) {
		List<File> files = new ArrayList<File>();
		File file = new File(folder);
		for (File f : file.listFiles()) {
			if (f.isFile())
				files.add(f);
		}
		return files;
	}

	public static void pack(String folder, String packedFile) throws IOException {
		RandomAccessFile raf = new RandomAccessFile(packedFile, "rw");
		List<File> files = getFiles(folder);
		raf.writeInt(files.size());

		long[] headPos = new long[files.size()];
		long pos = 0;
		int index = 0;

		// header format
		for (File f : files) {
			pos = raf.getFilePointer();
			headPos[index++] = pos;
			raf.writeLong(pos);
			raf.writeLong(f.length());
			raf.writeUTF(f.getName());
		}
		index = 0;
		// data format
		for (File f : files) {
//			DataOutputStream dos = new DataOutputStream(new FileOutputStream(f));
			raf.seek(headPos[index++]);
			System.out.println(raf.getFilePointer());

		}

		raf.close();
	}

	public static void copyData(String source, String destination) throws IOException {
		InputStream input = new FileInputStream(source);
		OutputStream output = new FileOutputStream(destination);

		int data = input.read();
		while (data != -1) {
			output.write(data);
			input.read();
		}

		input.close();
		output.close();
	}

	public void unpack(String packedFile, String extractFile, String destFile) throws IOException {
		RandomAccessFile raf = new RandomAccessFile(packedFile, "rw");

		raf.close();
	}

	public static void main(String[] args) throws IOException {
		String folder = "W:/bel/123";
		String packedFile = "W:\\bel\\123.pack";
		String destination = "bel\\abc";
		pack(folder, packedFile);

//		copyData(folder, destination);
	}
}
