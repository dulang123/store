package com.itheima.web.servlet.base;

public class test {
	public static void main(String[] args) {
		String s1 = "符串要不是其是最大相同项a。就按照从多往少判断，这里面的具体就是从最大项";
		String s2 = "事实上是最大相同项a";
		String sub = Maxsubstring(s1, s2);
		System.out.println("Maxsubstring:" + sub);
	}

	public static String Maxsubstring(String s1, String s2) {
		String max = (s1.length() > s2.length()) ? s1 : s2;
		String min = max.equals(s1) ? s2 : s1;
		for (int i = 0; i < min.length(); i++) {
			for (int m = 0, n = min.length() - i; n != min.length() + 1; m++, n++) {
				// System.out.println(min.substring(m, n));
				String sub = min.substring(m, n);
				if (max.contains(sub)) {
					return sub;
				}
			}
		}
		return null;
	}
}
