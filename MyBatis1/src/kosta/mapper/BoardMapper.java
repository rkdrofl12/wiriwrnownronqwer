package kosta.mapper;

import java.util.List;

import kosta.model.Board;
import kosta.model.Search;

public interface BoardMapper {
	int insertBoard(Board board);
	List<Board> listBoard(Search search);
	Board getBoard(int seq);
	int updateBoard(Board board);
	int deleteBoard(int seq);

}
