package com.sp.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.sp.dao.BoardDAO;
import com.sp.domain.BoardVO;

@Service
public class BoardServiceimpl implements BoardService{
	@Inject
	BoardDAO dao;
	
	@Override
	public List<BoardVO> getList(int start, int cnt) throws Exception {
		return dao.getListAll(start, cnt);
	}

	@Override
	public float getBoardCount() throws Exception {
		return dao.getBoardCount();
	}

	@Override
	public BoardVO getContent(int bno) throws Exception {
		return dao.getContent(bno);
	}

	@Override
	public int insertBoard(BoardVO vo) throws Exception {
		return dao.insertBoard(vo);
	}

	@Override
	public int removeBoard(int bno) throws Exception {
		return dao.removeBoard(bno);
	}

	@Override
	public int updateBoard(BoardVO vo) throws Exception {
		return dao.updateBoard(vo);
	}

}
