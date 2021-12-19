package com.kh.spring.member.model.vo;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@NoArgsConstructor
@AllArgsConstructor
@Data
@Component
public class Member {

private String userId;
private String userPwd;
private String empName;
private String gender;
private String email;
private String phone;
private String address;
private String empNo;
private String dept;
private String position;


public Member(String userId, String userPwd) {
	this.userId = userId;
	this.userPwd=userPwd;
}


}