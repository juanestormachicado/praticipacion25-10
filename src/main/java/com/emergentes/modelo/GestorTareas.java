
package com.emergentes.modelo;

import java.util.ArrayList;
import java.util.Iterator;
public class GestorTareas {
    
    
    private ArrayList<tareas> lista;

    public GestorTareas() {
        lista = new ArrayList<tareas>();
    }

    public ArrayList<tareas> getLista() {
        return lista;
    }

    public void setLista(ArrayList<tareas> lista) {
        this.lista = lista;
    }
    
    public void insertartarea(tareas item){
    lista.add(item);
    
    }
     public void modificartarea(int pos , tareas item){
     
         lista.set(pos, item);
     
     
     }
    public void eliminartarea(int pos){
    lista.remove(pos);
    
    
    }
    
    public int obtieneid(){
     int idaux =0;
     for (tareas item:lista){
     idaux = item.getId();
     }
    
    return idaux +1;
    }
    
    public int ubicartarea(int id){
        
        int pos = -1;
        Iterator<tareas> it = lista.iterator();
        
        while(it.hasNext()){
        ++pos;
        tareas aux= it.next();
        if(aux.getId()== id){
            break;
        }
        }
        
    return pos;
    
    }
    
    
}
