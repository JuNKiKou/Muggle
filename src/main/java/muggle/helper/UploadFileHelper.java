package muggle.helper;/**
 * Created by JuN on 2017/3/26.
 */

import muggle.constant.*;
import muggle.tools.FormateTime;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.json.JSONObject;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * 上传文件的工具类
 *
 * @authorJuN
 * @create2017-03-26 16:07
 */
public class UploadFileHelper {

    public static String uploadHeader(ServletContext context,HttpServletRequest request, HttpServletResponse response){
        JSONObject object = new JSONObject();
        String savePath = context.getRealPath(FilePathConstant.USER_HEADER_SAVE_PATH);
        File dir = new File(savePath);
        String path = "";

        //目录是否存在
        if (!dir.exists() && !dir.isDirectory()){
            dir.mkdir();
        }

        //文件解析器
        DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);
        upload.setHeaderEncoding(EncodingConstant.UTF8);
        //判断提交上来的数据是否是上传表单的数据
        if(!ServletFileUpload.isMultipartContent(request)){
            //按照传统方式获取数据
            //上传格式不正确
            System.out.println(RequestParamConstant.REQUEST_CONTENT_TYPE_INVALID);
            return null;
        }

        //解析上传数据
        try {
            List<FileItem> list = upload.parseRequest(request);
            for (FileItem item : list){
                if (item.isFormField()){
                    //普通输入项
                    //获取id和column
                    String name = item.getFieldName();
                    if (name.equals(RequestParamConstant.ID)){
                        try {
                            String value = item.getString(EncodingConstant.UTF8);
                            object.put(RequestParamConstant.ID,value);
                        } catch (UnsupportedEncodingException e) {
                            System.out.println(FileConstant.FILE_MESSAGE_FETCH_EXCEPTION);
                            e.printStackTrace();
                        }
                    }else if (name.equals(RequestParamConstant.COLUMN)){
                        try {
                            String value = item.getString(EncodingConstant.UTF8);
                            int column = Integer.parseInt(value);
                            object.put(RequestParamConstant.COLUMN,column);
                        } catch (UnsupportedEncodingException e) {
                            System.out.println(FileConstant.FILE_MESSAGE_FETCH_EXCEPTION);
                            e.printStackTrace();
                        }
                    }
                }else {
                    //文件项
                    String fileName = item.getName();
                    if (fileName == null || fileName.trim().equals("")){
                        continue;
                    }
                    fileName = fileName.substring(fileName.lastIndexOf("/")+1);
                    String suffix = fileName.substring(fileName.lastIndexOf("."));
                    String now = FormateTime.getCurrentTime();
                    String uuid = UUID.randomUUID().toString();

                    fileName = uuid + now + suffix;
                    path = savePath + "/"+fileName;
                    try {
                        InputStream in = item.getInputStream();
                        saveFile(in,path);
                    } catch (IOException e) {
                        System.out.println(FileConstant.FILE_SAVE_EXCEPTION);
                        e.printStackTrace();
                    }
                }
                item.delete();
            }
        } catch (FileUploadException e) {
            System.out.println(FileConstant.FILE_SAVE_EXCEPTION);
            e.printStackTrace();
        }
        object.put(JSONConstant.HEADER_PATH,path);

        return object.toString();

    }

    private static void saveFile(InputStream in,String path){
        try {
            FileOutputStream out = new FileOutputStream(path);
            byte[] buffer = new byte[1024];
            int length = 0;
            while ((length = in.read(buffer)) > 0){
                out.write(buffer,0,length);
            }
            out.close();
        } catch (FileNotFoundException e) {
            System.out.println(FileConstant.FILE_SAVE_EXCEPTION);
            e.printStackTrace();
        } catch (IOException e){
            System.out.println(FileConstant.FILE_SAVE_EXCEPTION);
            e.printStackTrace();
        } finally {
            if (in != null){
                try {
                    in.close();
                } catch (IOException e) {
                    System.out.println(FileConstant.FILE_SAVE_EXCEPTION);
                    e.printStackTrace();
                }
            }
        }
    }



}
