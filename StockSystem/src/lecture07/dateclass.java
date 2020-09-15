package lecture07;

import java.util.*;
import java.text.*;

public class dateclass {
	Date now = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	String today=sdf.format(now);
}
