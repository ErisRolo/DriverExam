package com.guohouxiao.driverexam.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 工具类
 */
public class Tools {

    /**
     * 判断字符串为空
     * @param s
     * @return
     */
    public static boolean isEmpty(String s) {
        if (s == null) {
            return true;
        }
        if (s.isEmpty()) {
            return true;
        }
        return false;
    }

    /**
     * 判断字符串不为空
     * @param s
     * @return
     */
    public static boolean isNotEmpty(String s) {
        if (s == null) {
            return false;
        }
        if (s.isEmpty()) {
            return false;
        }
        return true;
    }

    /**
     * 生成ID
     * @return
     */
    public static String createID() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
        return sdf.format(new Date());
    }

    /**
     * 随机指定范围内N个不重复的数
     * 最简单最基本的方法
     * @param min 指定范围最小值
     * @param max 指定范围最大值
     * @param n   随机数个数
     */
    public static int[] randomCommon(int min, int max, int n) {
        if (n > (max - min + 1) || max < min) {
            return new int[0];
        }
        int[] result = new int[n];
        int count = 0;
        while (count < n) {
            int num = (int) (Math.random() * (max - min)) + min + 1;
            boolean flag = true;
            for (int j = 0; j < n; j++) {
                if (num == result[j]) {
                    flag = false;
                    break;
                }
            }
            if (flag) {
                result[count] = num;
                count++;
            }
        }
        return result;
    }

}
