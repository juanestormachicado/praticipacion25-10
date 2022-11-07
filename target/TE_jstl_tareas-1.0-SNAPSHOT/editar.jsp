<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <h1>praticion   TEM-742 </h1>
            <h2>Nombre.- Juan Nestor Machicado Chaiña </h2>
            <h2 >Carnet.- 5980983</h2>
            <h2>
            <c:if var="res" scope="request" test="${requestScope.op =='nuevo'}"   >
                registro de 
                
            </c:if>
             <c:if var="res" scope="request" test="${requestScope.op =='modificar'}"   >
                modificar
                
            </c:if>
            tarea
            </h2>
            
            
            <jsp:useBean id="mitarea" scope="request" class="com.emergentes.modelo.tareas"/>
            
            <form>
                <table class="table" >
               <tbody>
                    <tr>
                        <td>ID</td>
                        <td> <input type="text" name="id" value="<jsp:getProperty name="mitarea" property="id"/>"> </td>
                     </tr>
                    <tr>
                       
                         <td>TAREA</td>
                          <td><input type="text" name="tarea" value="<jsp:getProperty name="mitarea" property="id"/>"> </td>
                 
                    </tr>
                   <tr>
                       
                         <td>TAREA</td>
                          <td>
                              <select name="prioridad">
                                  <option value="alta"   <c:if var="res" scope="request" 
                                        test="${mitarea.prioridad=='alta'} >"> selected</c:if>
                                              >alta</option>
                                  
                                   <option value="Media"   <c:if var="res" scope="request" 
                                        test="${mitarea.prioridad=='Media'} >"> selected</c:if>
                                              >Media</option>
                                   
                                    <option value="Baja"   <c:if var="res" scope="request" 
                                        test="${mitarea.prioridad=='Baja'} >"> selected</c:if>
                                              >Baja</option>
                              </select>
                              
                             
                          </td>
                 
                    </tr>
                    <tr>
                        <td>
                            <input type="hidden" name="opg" value="${requestScope.op}"/>
                            <input type="hidden" name="op" value="grabar"/>
                        </td>
                        <td>
                            <input type="submit"  value="Enviar"/>
                        </td>
                    </tr>
                   
                </tbody>
            </table>
                
                
            </form>
            
            
       </div>
    </body>
</html>
