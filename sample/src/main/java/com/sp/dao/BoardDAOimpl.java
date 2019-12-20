package com.sp.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.sp.domain.BoardVO;

@Repository
public class BoardDAOimpl implements BoardDAO{
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public int insertBoard(BoardVO vo) throws Exception {
		return sqlSession.insert("board.insertBoard",vo);
	}

	@Override
	public int updateBoard(BoardVO vo) throws Exception {
		return sqlSession.update("board.updateBoard",vo);
	}

	@Override
	public List<BoardVO> getListAll(int start, int cnt) throws Exception {
		Map<String,Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("cnt", cnt);
		return sqlSession.selectList("board.getListAll",map);
	}

	@Override
	public float getBoardCount() throws Exception {
		return sqlSession.selectOne("board.getBoardCount");
	}

	@Override
	public BoardVO getContent(int bno) throws Exception {
		return sqlSession.selectOne("board.getContent",bno);
	}

	@Override
	public int removeBoard(int bno) throws Exception {
		return sqlSession.delete("board.removeBoard",bno);
	}
}
