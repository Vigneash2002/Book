/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package IssueBook;

/**
 *
 * @author nsivaakumaar
 */
public class IssueBookBean implements java.io.Serializable{
    private String roll_number;
    private String isbn_number;
    private String issue_date;
    private String due_date;
    public void setroll_number(String roll_number){
        this.roll_number = roll_number;
    }
    public String getroll_number(){
        return roll_number;
    }
    public void setisbn_number(String isbn_number){
        this.isbn_number = isbn_number;
    }
    public String getisbn_number(){
        return isbn_number;
    }
    public void setissue_date(String issue_date){
        this.issue_date = issue_date;
    }
    public String getissue_date(){
        return issue_date;
    }
    public void setdue_date(String due_date){
        this.due_date = due_date;
    }
    public String getdue_date(){
        return due_date;
    }
}
