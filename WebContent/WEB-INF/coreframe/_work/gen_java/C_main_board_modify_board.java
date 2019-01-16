package ioprocess;
import java.sql.*;
import coreframe.log.*;
import coreframe.data.*;
import coreframe.data.schema.*;
final public class C_main_board_modify_board extends corelogic.adapter.dbms.DbmsProcessor
{
public C_main_board_modify_board() {
super();
}
public void execute(final DataSet input, final DataSet output) throws Exception {
				
				executeSQL("modifyBoardData", connection, input, output);
				
				String bTitle = input.getText("bTitle");
				String bContent = input.getText("bContent");
				String bId = input.getText("bId");
				System.out.println(".xml에서 "+bTitle);
				System.out.println(".xml에서 "+bContent);
				System.out.println(".xml에서 "+bId);
				
			
}
public long getCheckTime() {
 return 1541568966812L;
}
}
