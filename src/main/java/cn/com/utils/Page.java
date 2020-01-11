package cn.com.utils;

public class Page {

    //返回分页数目
    public static int getCountPage(int count) {
        int countPage = 0;
        if (count % 6 != 0) {
            countPage = count / 6 + 1;
        } else {
            countPage = count / 6;
        }
        return countPage;
    }
}
