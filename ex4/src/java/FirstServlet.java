import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/FirstServlet"})
public class FirstServlet extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String n=request.getParameter("userName");  
out.print("Welcome "+n);  

out.print("<form action='http://localhost:8080/ex4/SecondServlet'>");  
out.print("<input type='hidden' name='uname' value='"+n+"'>");  
out.print("<input type='submit' value='go'>");  
out.print("</form>");  
out.close();  
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
processRequest(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
processRequest(request, response);
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    } 
}
