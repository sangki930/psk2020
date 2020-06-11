package kopo.example.service;

import kopo.example.Repo.VoteRepo;
import kopo.example.domain.VoteRIO;
import kopo.example.dto.VoteSIO;

public class Service_vote {
		
		public Service_vote(int id, int age) {//id, age로 받을 때
			
			VoteRepo.insert(new VoteRIO(id,age));
		}
		public Service_vote(VoteSIO v) {//voteSIO로 받을때
			VoteRepo.insert(new VoteRIO(v.getId(),v.getAge()));
		}
		
}
