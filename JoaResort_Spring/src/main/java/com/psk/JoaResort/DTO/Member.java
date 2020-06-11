package com.psk.JoaResort.DTO;

import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonBackReference;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.Setter;
import lombok.ToString;

@Entity
@Getter
@Setter
@ToString(exclude= {"reservations","reviews","notices"})
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Member {
	
	@Id
	@Column
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	
	@Column(unique=true)
	@NonNull
	private String username;
	
	@Column
	private String name;
	
	@Column
	private String addr;
	
	@Column(length = 15)
	@NonNull
	private String password;
	
	@Column
	private String tel;
	
	@Column(length = 15)
	private String mobile;
	
	@Column
	private String email;
	
	@Column(updatable = false)
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@Builder.Default
	private LocalDateTime created=LocalDateTime.now();
	
	
	@Column
	@OneToMany(cascade=CascadeType.ALL,mappedBy="member")
	@JsonBackReference 
	private List<Notice> notices;
	
	@Column
	@OneToMany(cascade=CascadeType.ALL,mappedBy="member")
	@JsonBackReference
	private List<Review> reviews;
	
	@Column
	@OneToMany(cascade=CascadeType.ALL,mappedBy="member")
	@JsonBackReference
	private List<Reservation> reservations;
	
}
