package joa.DTO;

import joa.Repo.*;

import java.util.*;

import joa.DTO.*;
import joa.Domain.*;

public class gongji_pagelist {

		List<gongji> list = new ArrayList<>();
		
		public gongji_pagelist(int from,int cnt){
			this.list=gongjiRepo.getPage(from, cnt);
		}

		public List<gongji> getList() {
			return list;
		}

		public void setList(List<gongji> list) {
			this.list = list;
		}
		
		
		
}
