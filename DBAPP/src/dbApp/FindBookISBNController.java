package dbApp;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.scene.control.Alert;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.ListView;
import javafx.scene.control.TextField;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.layout.BorderPane;
import javafx.stage.Stage;
import util.DBConnect;

public class FindBookISBNController {

    @FXML
    private Label lblISBN;

    @FXML
    private TextField txtISBN;

    @FXML
    private ListView<String> listViewBooks;

    @FXML
    private Button btnBack;

    @FXML
    private Button btnEnter;

    @FXML
    void btnBackClicked(ActionEvent event) throws IOException {
    	FXMLLoader loader = new FXMLLoader();
    	loader.setLocation(getClass().getResource("LibrarySystemApp.fxml"));
    	Stage mainStage = (Stage) btnBack.getScene().getWindow();
	     
    	BorderPane root = (BorderPane) loader.load(getClass().getResource("LibrarySystemApp.fxml"));
    	//modify the scene of the stage to display this file

    	//instantiate scene based on the new layout of the fxml that we just loaded
    	Scene nextScene = new Scene(root,400,400);
    	
    	mainStage.setScene(nextScene);
		mainStage.show();
    }

    @FXML
    void btnEnterClicked(ActionEvent event) throws SQLException {
    	listViewBooks.getItems().clear();
    	listViewBooks.setVisible(true);
    	try {
    		DBConnect.connectDB();
    		Connection dbConnection = DBConnect.getConnection();
    		if(dbConnection == null)
    		{
    			Alert alert = new Alert (AlertType.ERROR);
    			alert.setContentText("data not available at this time");
    			alert.showAndWait();
    		}
    		else
    		{
    			System.out.println("got a database connection");
    			//now try to retrieve the data the user requested
    			
    			PreparedStatement statement = dbConnection.prepareStatement("select Branch.BranchName, BookBranch.BookID, Book.BookTitle, Author.AuthorFName + ' ' + Author.AuthorLName as [Author Name]\r\n" + 
    					"from Branch inner join BookBranch\r\n" + 
    					"on Branch.BranchID = BookBranch.BranchID inner join Book\r\n" + 
    					"on BookBranch.ISBN = Book.ISBN inner join Book_Author \r\n" + 
    					"on Book.ISBN = Book_Author.ISBN inner join Author\r\n" + 
    					"on Book_Author.AuthorID = Author.AuthorID\r\n" + 
    					"where book.ISBN = ?");
    	        
    	        statement.setString(1, txtISBN.getText());
    			ResultSet rs = statement.executeQuery();
    			System.out.println("executed the statement");
    			
    			if(rs.next() == false)
    			{
    				listViewBooks.getItems().add("No books found");
    			}
    			else 
    			{
        			do
        			{
        				listViewBooks.getItems().add(rs.getString("BranchName") + ", " + rs.getString("BookID").toString() + ", " +  rs.getString("BookTitle") + ", " + rs.getString("Author Name"));
        			}while (rs.next()); 
        			
        			rs.close();
        			statement.close();
        			dbConnection.close();
        		}
    		}    		
    	}
    	catch (SQLException sqlException) 
    	{
            Alert alert = new Alert(AlertType.ERROR);
            alert.setTitle("SQL ERROR");
            alert.setContentText("SQLException couldnt retrieve data " + sqlException.getMessage());
    		
            throw sqlException;
    	}
    }

}
