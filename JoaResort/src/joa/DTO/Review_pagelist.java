package joa.DTO;

import joa.Repo.*;

import java.util.*;

import joa.DTO.*;
import joa.Domain.*;

public class Review_pagelist {

		List<Review> list = new ArrayList<>();
		
		public Review_pagelist(int from,int cnt){
			this.list=ReviewRepo.getPage(from, cnt);
		}

		public List<Review> getList() {
			return list;
		}

		public void setList(List<Review> list) {
			this.list = list;
		}
		
		
		
}
