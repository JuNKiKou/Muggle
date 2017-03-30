package muggle.helper;/**
 * Created by JuN on 2017/3/30.
 */

import muggle.constant.*;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;

/**
 * 下载文件的工具类
 *
 * @authorJuN
 * @create2017-03-30 08:39
 */
public class DownloadFileHelper {

    public static void downloadExamination(ServletContext context,HttpServletResponse response, String fileName){
        download(context,response,FilePathConstant.EXAMINATION_RESOURCE_SAVE_PATH,fileName);
    }

    public static void downloadKey(ServletContext context,HttpServletResponse response,String fileName){
        download(context,response,FilePathConstant.KEY_RESOURCE_SAVE_PATH,fileName);
    }

    public static void downloadRadio(ServletContext context,HttpServletResponse response,String fileName){
        download(context,response,FilePathConstant.RADIO_RESOURCE_SAVE_PATH,fileName);
    }

    private static void download(ServletContext context,HttpServletResponse response,String rootPath,String fileName){
        String savePath = context.getRealPath(rootPath);
        File dir = new File(savePath);
        if (!dir.exists() && !dir.isDirectory()){
            dir.mkdir();
        }
        String path = savePath + "/" + fileName;
        String name = null;
        try {
            name = URLEncoder.encode(fileName, EncodingConstant.UTF8);
        } catch (UnsupportedEncodingException e) {
            System.out.println(FileConstant.FILE_DOWNLOAD_EXCEPTION);
            e.printStackTrace();
        }
        response.setHeader(ResponseConstant.CONTENT_TYPE,ResponseConstant.CONTENT_TYPE_DOWNLOAD);
        response.setHeader(ResponseConstant.CONTENT_DISPOSITION,ResponseConstant.CONTENT_DISPOSITION_DOWNLOAD + name);

        File file = new File(path);
        if (!file.exists() || !file.isFile()){
            System.out.println(FileConstant.FILE_CAN_NOT_FOUND_EXCEPTION);
            return;
        }

        try {
            FileInputStream inputStream = new FileInputStream(file);
            OutputStream outputStream = response.getOutputStream();
            byte[] buffer = new byte[1024];
            int length = 0;
            while ((length = inputStream.read(buffer)) > 0){
                outputStream.write(buffer,0,length);
            }
            outputStream.close();
            inputStream.close();
        } catch (IOException e) {
            System.out.println(FileConstant.FILE_DOWNLOAD_EXCEPTION);
            e.printStackTrace();
        }
    }

}
