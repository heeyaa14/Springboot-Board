package com.cos.board.model;

import java.sql.Date;
import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.hibernate.annotations.CreationTimestamp;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data 	//-> Getter, Setter 를 한번에 선언(포함되있음). + toString()도 구현되어있음.
//@Getter
//@Setter
@AllArgsConstructor	// 전체 파라미터를 가진 생성자
@NoArgsConstructor	// 파라미터가 없는 생성자
@Builder	// 빌더 패턴
@Entity		// object relational mapping(ORM) 가능해짐.

public class Board {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)	// 해당 데이터베이트 번호증가 전략을 따라가기.
	private int id;
	private String title;
	private String content;
	private int readCount;
	@CreationTimestamp	// 현재시간이 자동으로 업데이트됨.
	private Timestamp createDate;
	
}
