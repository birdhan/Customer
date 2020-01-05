package lin.snacks.dao;

import java.util.List;

import lin.snacks.pojo.Leave;

public interface LeaveMapper {
	
	public void addleave(Leave leave);
	
	public List<Leave> findleaveBySid(String snacksid);
	
	public List<Leave> findByAll();
	
	public void deletele(String id);
	
	public List<Leave> findByidstatus(String id);
	
	
	
}
