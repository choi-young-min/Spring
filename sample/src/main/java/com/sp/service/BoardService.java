package com.sp.service;

import java.util.List;

import com.sp.domain.BoardVO;

public interface BoardService {
	public List<BoardVO> getList(int start, int cnt) throws Exception;
	public float getBoardCount() throws Exception;
	public BoardVO getContent(int bno) throws Exception;
	public int insertBoard(BoardVO vo) throws Exception;
	public int removeBoard(int bno) throws Exception;
	public int updateBoard(BoardVO vo) throws Exception;
}
