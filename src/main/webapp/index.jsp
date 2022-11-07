<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.emergentes.modelo.tareas"%>
<%@page import="com.emergentes.modelo.GestorTareas"%>
<%

if(session.getAttribute("agenda")==null){

GestorTareas objeto1 =new GestorTareas();
objeto1.insertartarea(new tareas(1,"reunion con estudiantes de la carrera", "alta"));
objeto1.insertartarea(new tareas(2,"estudiar para el examemde estadistica ", "alta"));
objeto1.insertartarea(new tareas(3,"partido de futsal", "baja"));
session.setAttribute("agenda",objeto1 );
}
%>







<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />

    <!-- Bootstrap CSS v5.2.0-beta1 -->
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
      integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
      crossorigin="anonymous"
    />
        
        <title>JNMCH</title>
    </head>
    <body>
         <div class="container">
            <h1>PARTICIPACION    TEM-742 </h1>
            <h2>Nombre.- Juan Nestor Machicado Chaiña </h2>
            <h2 >Carnet.- 5980983</h2>
            
            <h2>
              lista de tareas
            </h2>
            <a href="control?op=nuevo"> Nuevo</a>
            
            <table class="table" >
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>TAREA</th>
                        <th>PRIORIDAD</th>
                        <th></th>
                        <th></th>
                          
                    </tr>
                </thead>
                <tbody>
                    <c:forEach  var="item" items="${sessionScope.agenda.getLista()}"  >
                    <tr>
                       
                         <td>${item.id}</td>
                          <td>${item.tarea}</td>
                           <td>${item.prioridad}</td>
                           <td> <a href="control?op=modificar&id=${item.id}">modificar</a></td>
                         <td> <a href="control?op=eliminar&id=${item.id}">eliminar</a></td>
                        
                        
                    </tr>
                    </c:forEach>
                   
                </tbody>
            </table>
            
            
            
            
         </div>
    </body>
</html>
