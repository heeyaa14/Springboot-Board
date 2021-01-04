package com.cos.board.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.cos.board.model.Board;

// 자동 Ioc 등록됨.
public interface BoardRepository extends JpaRepository<Board, Integer> {
	// public abstract 생략
	@Query(value = "SELECT * FROM board WHERE id=:id", nativeQuery = true)	// 이 query가 실행됨.
	Board mFindById(int id);
	
	@Modifying	// 직접 수정,삭제,저장을 nativeQuery로 짜줄 때 Modifying을 포함시켜줘야 커밋이됨.
	@Query(value = "DELETE FROM board WHERE id=:id", nativeQuery = true)
	int mDeleteById(int id);

}
