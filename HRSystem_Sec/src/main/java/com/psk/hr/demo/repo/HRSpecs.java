package com.psk.hr.demo.repo;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.persistence.criteria.Join;
import javax.persistence.criteria.Predicate;

import org.hibernate.sql.JoinType;
import org.springframework.data.jpa.domain.Specification;

import com.psk.hr.demo.domain.HR.HR;
import com.psk.hr.demo.domain.account.UserItem;

import lombok.Getter;

public class HRSpecs {
	
	
	@Getter
	public enum SearchKey{
		
		USERNAME("username"),NAME("name"),TEL("tel"),BIRTH("birth")
		,GENDER("gender"),EMAIL("email");
		
		private String value;
		
		SearchKey(String value)
		{
			this.value = value;
		}
		
	}
	
	
	@SuppressWarnings("preview")
	public static Specification<HR> search(Map<String,Object> filter){
		
		System.out.println("filter : "+filter);
		return (rt,query,builder)->{
			Join<HR, UserItem> join = rt.join("userItem");//조인 필요
			List<Predicate> predicates = new ArrayList<>();
			filter.forEach((key,value)->{
				String likevalue="%"+value+"%";
				System.out.println("key값 : "+key);
				System.out.println("value값: " +value);
				System.out.println(query);
				
				
				switch(key) {
				case "selectColumn":
					break;
				case "juminid" :
					predicates.add(builder.like(builder.lower(rt.get("juminId")),likevalue));
					break;
				case "empid" :
					predicates.add(builder.like(builder.lower(rt.get("empId")),likevalue));
					break;
				case "name","username" : 
					predicates.add(builder.like(builder.lower(join.get(key)),likevalue));
				break;
					
//				case "empId","juminid","username","name":
//				case "empId","name","juminId","username":
//					predicates.add(builder.equal(root.get(key).as(String.class),value));//컬럼 키워드가 일치하면
//					System.out.println("root get key : "+root.get(key));
//					predicates.add(builder.like(builder.lower(rt.get(key)),likevalue));
//					predicates.add(builder.like(builder.lower(rt.get(key)),likevalue));
//					break;
				}
			});
			return builder.and(predicates.toArray(new Predicate[0]));
		};
	}
}
