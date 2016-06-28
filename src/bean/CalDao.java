package bean;

import java.util.Calendar;

public class CalDao {

	public static final int START_DATE = 1;
	Calendar cal = Calendar.getInstance();
	StringBuilder today = new StringBuilder();
	int nowYear = 0;
	int nowMonth = 0;
	int nowDay = cal.get(Calendar.DAY_OF_MONTH);

	public String getDate() {
		CalDto dto = new CalDto();
		String param_month = dto.getMonth();
		String param_year = dto.getYear();
		today.append(cal.get(Calendar.YEAR)).append(cal.get(Calendar.MONTH) + 1);
		cal.set(Calendar.DAY_OF_MONTH, 1);

		if (param_month != null) {
			cal.set(Calendar.MONTH, Integer.parseInt(param_month) - 1);
		}
		// 설정된 월 받아오기 없으면 객체에서 자동생성.
		nowMonth = cal.get(Calendar.MONTH) + 1;

		if (param_year != null) {
			cal.set(Calendar.YEAR, Integer.parseInt(param_year));
		}

		// 설정된 년도를 얻어오기, 없으면 객체에서 자동생성.
		nowYear = cal.get(Calendar.YEAR);

		StringBuilder paramDay = new StringBuilder();
		paramDay.append(nowYear).append(nowMonth);

		return paramDay.toString();
	}

	public int getNowYear(String year) {	
		if (year != null) {
			cal.set(Calendar.YEAR, Integer.parseInt(year));
		}

		// 설정된 년도를 얻어오기, 없으면 객체에서 자동생성.
		nowYear = cal.get(Calendar.YEAR);
		
		return nowYear;
	}

	public int getNowMonth(String month) {
		if (month != null) {
			cal.set(Calendar.MONTH, Integer.parseInt(month) - 1);
		}
		// 설정된 월 받아오기 없으면 객체에서 자동생성.
		nowMonth = cal.get(Calendar.MONTH)+1;
	
		return nowMonth;
	}

}
