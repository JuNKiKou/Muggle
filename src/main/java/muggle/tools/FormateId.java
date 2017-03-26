package muggle.tools;/**
 * Created by JuN on 2017/3/25.
 */

/**
 * 格式化id的工具类
 *
 * @authorJuN
 * @create2017-03-25 12:05
 */
public class FormateId {


    private static String formate(String head,String number){
        int headLength = head.length();
        int numberLength = number.length();
        int restLength = 16 - headLength - numberLength;
        StringBuilder builder = new StringBuilder();
        builder.append(head);
        while (restLength > 0){
            builder.append("0");
            restLength --;
        }
        builder.append(number);
        return builder.toString();
    }

    public static String getGeneralId(String id,String head){
        String number = getNumber(id,head);
        int num = Integer.parseInt(number);
        num = num + 1;
        String result = String.valueOf(num);
        return formate(head,result);
    }

    private static String getNumber(String id,String head){
        int headerLength = head.length();
        String number = id.substring(headerLength);
        return number;
    }

}
