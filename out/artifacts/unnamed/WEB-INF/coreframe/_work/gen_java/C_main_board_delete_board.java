package ioprocess;
import java.sql.*;
import coreframe.log.*;
import coreframe.data.*;
import coreframe.data.schema.*;
final public class C_main_board_delete_board extends corelogic.adapter.dbms.DbmsProcessor
{
public C_main_board_delete_board() {
super();
}
public void execute(final DataSet input, final DataSet output) throws Exception {
				
				executeSQL("deleteBoardData", connection, input, output);
							
			
}
public long getCheckTime() {
 return 1541743194152L;
}
}
