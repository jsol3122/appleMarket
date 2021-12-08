package warningBoard.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import warningBoard.bean.WarningBoardDTO;
import warningBoard.dao.WarningBoardDAO;

@Service
public class WarningBoardServiceImpl implements WarningBoardService {
	
	@Autowired
	public WarningBoardDAO warningBoardDAO;
	
	@Override
	public void warningBoardWrite(WarningBoardDTO warningBoardDTO) {
		
		warningBoardDAO.warningBoardWrite(warningBoardDTO);
	}

}
