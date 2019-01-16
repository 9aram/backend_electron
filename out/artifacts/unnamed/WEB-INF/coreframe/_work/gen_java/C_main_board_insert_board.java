package ioprocess;
import java.sql.*;
import coreframe.log.*;
import coreframe.data.*;
import coreframe.data.schema.*;
final public class C_main_board_insert_board extends corelogic.adapter.dbms.DbmsProcessor
{
public C_main_board_insert_board() {
super();
}
public void execute(final DataSet input, final DataSet output) throws Exception {
				
				executeSQL("addBoardData", connection, input, output);
				
			
}
public long getCheckTime() {
 return 1541743201472L;
}
}
