package ioprocess;
import java.sql.*;
import coreframe.log.*;
import coreframe.data.*;
import coreframe.data.schema.*;
final public class C_main_board_reply_board extends corelogic.adapter.dbms.DbmsProcessor
{
public C_main_board_reply_board() {
super();
}
public void execute(final DataSet input, final DataSet output) throws Exception {

				String sqlID = input.getText("sqlID");	
				
				System.out.println("진입");	
				System.out.println(sqlID);

				if(sqlID.equals("addReplyBoardData")){
					
					executeSQL(sqlID, connection, input, output);
					
				} 
					
			
}
public long getCheckTime() {
 return 1541743244533L;
}
}
