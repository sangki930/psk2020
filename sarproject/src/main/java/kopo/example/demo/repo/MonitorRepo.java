package kopo.example.demo.repo;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.apache.taglibs.standard.lang.jstl.Logger;
import org.slf4j.LoggerFactory;

import kopo.example.demo.VO.Serv;

@Repository
public class MonitorRepo {
	private static final org.slf4j.Logger logger = LoggerFactory.getLogger(MonitorRepo.class);

	@Autowired
	private JdbcTemplate jdbcTemplate;

	public void createDB() throws Exception  {
		logger.info("Repo-- createDB");
		String sql = "create table if not exists sarcrawl("+
				"server_num int not null primary key,"+
				"sar_url varchar(200),"+
				"time varchar(200)," +
				"CPU varchar(200)," +
				"User varchar(25)," +
				"Nice double,"+
				"System double,"+
				"Iowait double," + 
				"Steal double," +
				"Idle double," +
				"last_req_time datetime," + 
				"last_proc_flag boolean"
				+") DEFAULT CHARSET=utf8;";
		jdbcTemplate.execute(sql);

	}

	public void dropDB() throws Exception  {

		logger.info("Repo-- createDB");
		String sql = "drop table if exists sarcrawl";
		jdbcTemplate.execute(sql);
	}

	public List<Serv> selectAll() throws Exception  {
		String sql = "select * from sarcrawl";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Serv>(Serv.class));
	}
	
	public int insert(Serv serv) throws Exception {
		String sql = "insert into sarcrawl("
				+
				"server_num,"+
				"sar_url,"+
				"time," +
				"CPU," +
				"User," +
				"Nice,"+
				"System,"+
				"Iowait," + 
				"Steal," +
				"Idle," +
				"last_req_time," + 
				"last_proc_flag"
				+") values(?,?,?,?,?,?,?,?,?,?,?,?)";
		return jdbcTemplate.update(sql,serv.getServer_num()
				,serv.getSar_url(),serv.getTime(),serv.getCpu()
				,serv.getUser(), serv.getNice(),serv.getSystem()
				,serv.getIowait(),serv.getSteal(),serv.getIdle()
				,serv.getLast_req_time(),serv.getLast_proc_flag());
	}
	
	public void update(Serv serv) throws Exception{
		String sql="update sarcrawl set server_num=?,"
				+"sar_url=?,"
				+"time=?,"
				+"CPU=?,"
				+"User=?,"
				+"Nice=?,"
				+"System=?,"
				+"Iowait=?,"
				+"Steal=?,"
				+"Idle=?,"
				+"last_req_time=?,"
				+"last_proc_flag=? "
				+"where server_num=?";
		
		jdbcTemplate.update(sql,serv.getServer_num()
				,serv.getSar_url(),serv.getTime(),serv.getCpu()
				,serv.getUser(), serv.getNice(),serv.getSystem()
				,serv.getIowait(),serv.getSteal(),serv.getIdle()
				,serv.getLast_req_time(),serv.getLast_proc_flag(),serv.getServer_num());
		
	}
	
	public void delete(Serv serv) throws Exception{
		String sql = "delete from sarcrawl where server_num=?";
		jdbcTemplate.update(sql,serv.getServer_num());
		
	}
	
	public boolean btoint(int i) {
		if(i==0) {
			return false;
			
		}else {
			return true;
		}
	}
	
	public Serv selectOne(int serv_num) throws Exception  {
		String sql = "select * from sarcrawl where server_num=?";
		logger.info("Repo-- getOneRecords");
		List<Serv> result=jdbcTemplate.query(
				sql,
				new RowMapper<Serv>() {
				@Override
				public Serv mapRow(ResultSet rs, int rowNum) throws SQLException{
			Serv s = new Serv();
			s.setServer_num(rs.getInt("server_num"));
			s.setSar_url(rs.getString("sar_url"));
			s.setTime(rs.getString("Time"));
			s.setCpu(rs.getString("CPU"));
			s.setUser(rs.getString("User"));
			s.setNice(rs.getDouble("Nice"));
			s.setSystem(rs.getDouble("System"));
			s.setIowait(rs.getDouble("Iowait"));
			s.setSteal(rs.getDouble("Steal"));
			s.setIdle(rs.getDouble("Idle"));
			s.setLast_req_time(rs.getTimestamp("last_req_time").toLocalDateTime());
			s.setLast_proc_flag(rs.getInt("last_proc_flag"));
			
			return s;
				}				
				},serv_num);//Row Mapper가 끝나는 곳
	return result.isEmpty()?null:result.get(0);
	}
	
	
}
