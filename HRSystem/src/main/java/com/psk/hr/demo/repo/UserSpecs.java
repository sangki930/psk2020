package com.psk.hr.demo.repo;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.persistence.criteria.Predicate;

import org.springframework.data.jpa.domain.Specification;

import com.psk.hr.demo.domain.account.UserItem;

import lombok.Getter;

public class UserSpecs {

	
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
	public static Specification<UserItem> search(Map<String,Object> filter){
		
		System.out.println("filter : "+filter);
		return (root,query,builder)->{
			List<Predicate> predicates = new ArrayList<>();
			filter.forEach((key,value)->{
				String likevalue="%"+value+"%";
				System.out.println("key값 : "+key);
				System.out.println("value값: " +value);
						
				switch(key) {
				case "selectColumn":
					break;
				case "username","name","tel","birth","gender","email":
//					predicates.add(builder.equal(root.get(key).as(String.class),value));//컬럼 키워드가 일치하면
					System.out.println("root get key ; "+root.get(key));
					predicates.add(builder.like(builder.lower(root.get(key)),likevalue));
					break;
				}
			});
			return builder.and(predicates.toArray(new Predicate[0]));
		};
	}

}
