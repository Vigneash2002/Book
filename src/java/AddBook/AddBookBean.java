/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AddBook;

/**
 *
 * @author nsivaakumaar
 */
public class AddBookBean implements java.io.Serializable{
    private String isbn_number;
    private String book_name;
    private String author_first_name;
    private String author_last_name;
    private String total_copies;
    private String available_copies;
    private String reserve_copies;
    private String category;
    public void setisbn_number(String isbn_number){
        this.isbn_number = isbn_number;
    }
    public String getisbn_number(){
        return isbn_number;
    }
    public void setbook_name(String book_name){
        this.book_name = book_name;
    }
    public String getbook_name(){
        return book_name;
    }
    public void setauthor_first_name(String author_first_name){
        this.author_first_name = author_first_name;
    }
    public String getauthor_first_name(){
        return author_first_name;
    }
    public void setauthor_last_name(String author_last_name){
        this.author_last_name = author_last_name;
    }
    public String getauthor_last_name(){
        return author_last_name;
    }
    public void settotal_copies(String total_copies){
        this.total_copies = total_copies;
    }
    public String gettotal_copies(){
        return total_copies;
    }
    public void setreserve_copies(String reserve_copies){
        this.reserve_copies = reserve_copies;
    }
    public String getreserve_copies(){
        return reserve_copies;
    }
    public void setavailable_copies(String available_copies){
        this.available_copies = available_copies;
    }
    public String getavailable_copies(){
        return available_copies;
    }
    public void setcategory(String category){
        this.category = category;
    }
    public String getcategory(){
        return category;
    }
}

