package ioprocess;
import java.sql.*;
import coreframe.log.*;
import coreframe.data.*;
import coreframe.data.schema.*;
final public class C_main_board_select_board extends corelogic.adapter.dbms.DbmsProcessor
{
public C_main_board_select_board() {
super();
}
public void execute(final DataSet input, final DataSet output) throws Exception {

				String sqlID = input.getText("sqlID");	
				String keyField = input.getText("keyField");	
				String keyWord = input.getText("keyWord");	
				String page = input.getText("page");
				String endpage = input.getText("endpage");
				
				
				if(sqlID.equals("getBoardData")){
					executeSQL(sqlID, connection, input, output);
					executeSQL("upHit", connection, input, output);
				}else if(keyField.equals("bTitle")){ 
					executeSQL("getBoardCount", connection, input, output);
					executeSQL("getSearchList_bTitle", connection, input, output);
					System.out.println("실행된 쿼리는  getSearchList_bTitle");
					executeSQL("upHit", connection, input, output);
				}
				else if(keyField.equals("bContent")){ 
					executeSQL("getBoardCount", connection, input, output);
					executeSQL("getSearchList_bContent", connection, input, output);
					System.out.println("실행된 쿼리는  getSearchList_bContent");
					executeSQL("upHit", connection, input, output);
				}
				else if(keyField.equals("bName")){ 
					executeSQL("getBoardCount", connection, input, output);
					executeSQL("getSearchList_bName", connection, input, output);
					System.out.println("실행된 쿼리는 getSearchList_bName ");
					executeSQL("upHit", connection, input, output);
				}
				else {
					executeSQL("getBoardCount", connection, input, output);
					executeSQL("getBoardList", connection, input, output);
						System.out.println("실행된 쿼리는 getBoardList");
					executeSQL("upHit", connection, input, output);
				}
				
				
				
			
}
public long getCheckTime() {
 return 1547171280146L;
}
}
