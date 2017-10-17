package kosta.model;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kosta.mapper.BoardMapper;

public class BoardDao {

	private static BoardDao dao = new BoardDao();

	public BoardDao() {
	}

	public static BoardDao getInstance() {
		return dao;
	}
	
	public SqlSessionFactory getSqlSessionFactory(){
		
		String resource = "mybatis-config.xml";
		
		InputStream in = null;
		
		try 
		{
			in = Resources.getResourceAsStream(resource);
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return new SqlSessionFactoryBuilder().build(in);
	}

	
	public Board getBoard(int seq){
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		
		try {
			return sqlSession.getMapper(BoardMapper.class).getBoard(seq);
			//return sqlSession.selectOne("kosta.mapper.BoardMapper.getBoard",seq);
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}	

	public List<Board> listBoard(Search search) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		
		try 
		{
			return sqlSession.getMapper(BoardMapper.class).listBoard(search);
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		finally
		{
			sqlSession.close();
		}		
		return null;
	}

	public int insertBoard(Board board) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		int re = -1;
		
		try {
			re = sqlSession.getMapper(BoardMapper.class).insertBoard(board);
			if( re > 0){
				
				sqlSession.commit();
			}
			else{
				
				sqlSession.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally{
			sqlSession.close();
		}
		
		
		return re;
	}
	public int updateBoard(Board board){
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		int re = -1;
		try {
			re = sqlSession.getMapper(BoardMapper.class).updateBoard(board);

			if( re > 0){
				System.out.println("성공");
				sqlSession.commit();
			}
			else{
				System.out.println("실패");
				sqlSession.rollback();
			}			
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return re;
	}
	
	public int deleteBoard(int seq){
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		
		int re = -1;
		try {
			re = sqlSession.getMapper(BoardMapper.class).deleteBoard(seq);

			if( re > 0){
				System.out.println("성공");
				sqlSession.commit();
			}
			else{
				System.out.println("실패");
				sqlSession.rollback();
			}			
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return re;
	}
}
