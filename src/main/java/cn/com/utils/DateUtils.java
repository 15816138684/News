package cn.com.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtils {
    public static String getDate() {
        //得到long类型当前时间
        long currentDate = System.currentTimeMillis();
        //new日期对象
        Date date = new Date(currentDate);
        //转换提日期输出格式
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy年MM月dd日  HH:mm:ss");
        String dateStr = dateFormat.format(date);
        return dateStr;
    }
}
