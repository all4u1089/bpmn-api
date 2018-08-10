package com.eazymation.clouvir.util;

import java.net.Socket;
import java.util.HashMap;

import org.springframework.stereotype.Component;

@Component
public class SocketWrapper {
	public HashMap<String, Socket> sockets = new HashMap<String, Socket>();
    public HashMap<String, Socket> getSockets() {
        return sockets;
    }

    public void setSockets(HashMap<String, Socket> sockets) {
        this.sockets = sockets;
   }
}
