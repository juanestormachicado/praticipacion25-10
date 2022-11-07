
package com.emergentes.control;

import com.emergentes.modelo.GestorTareas;
import com.emergentes.modelo.tareas;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "control", urlPatterns = {"/control"})
public class control extends HttpServlet {

   

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        tareas onjtarea =new tareas();
        
        int id;
        int pos;
        String opcion = request.getParameter("op");
        String op =(opcion != null)? request.getParameter("op"):"view";
        
        if(op.equals("nuevo")){
            HttpSession ses =request.getSession();
            GestorTareas agenda =(GestorTareas) ses.getAttribute("agenda");
            onjtarea.setId(agenda.obtieneid());
            request.setAttribute("op", op);
            request.setAttribute("mitarea", onjtarea);
            request.getRequestDispatcher("editar.jsp").forward(request, response);
                        
            }
        
         if(op.equals("modificar")){
             id = Integer.parseInt(request.getParameter("id"));
             HttpSession ses =request.getSession();
             GestorTareas agenda =(GestorTareas) ses.getAttribute("agenda");
             pos = agenda.ubicartarea(id);
             onjtarea = agenda.getLista().get(pos);
             
             request.setAttribute("op", op);
            request.setAttribute("mitarea", onjtarea);
            request.getRequestDispatcher("editar.jsp").forward(request, response);
                        
            }
         if(op.equals("eliminar")){
             id = Integer.parseInt(request.getParameter("id"));
             HttpSession ses =request.getSession();
             GestorTareas agenda =(GestorTareas) ses.getAttribute("agenda");
             pos = agenda.ubicartarea(id);
             
             agenda.eliminartarea(pos);
             ses.setAttribute("agenda", agenda);
             
            response.sendRedirect("index.jsp");
             
            
                        
            }
         
        
        if(op.equals("view")){
             
            response.sendRedirect("index.jsp");
              }
         
        
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        tareas objtareas = new tareas();
        int pos ;
        String op = request.getParameter("op");
        
        
         if(op.equals("grabar")){
            
             objtareas.setId(Integer.parseInt(request.getParameter("id")));
            objtareas.setTarea(request.getParameter("tarea"));
             objtareas.setPrioridad(request.getParameter("prioridad"));
             
             HttpSession ses =request.getSession();
             GestorTareas agenda =(GestorTareas) ses.getAttribute("agenda");
             
             String opg = request.getParameter("opg");
             if (opg.equals("nuevo")){
                 agenda.insertartarea(objtareas);
             }
             else{
             pos=agenda.ubicartarea(objtareas.getId());
             agenda.modificartarea(pos, objtareas);
             }
             ses.setAttribute("agenda",agenda);
             response.sendRedirect("index.jsp");
         }
         
         }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
