import sys
sys.path.append("gen-py")
from servicio import OperacionesServicio #importar stubs
from thrift.transport import TSocket #Endpoint -> conectar clientes
from thrift.protocol import TBinaryProtocol #serialización
from thrift.server import TServer #clases de servidores
from thrift.transport import TTransport

#Implementación del servicio

class OperacionesHandler: #manejador de llamadas al servicio

    def suma(self, numero1, numero2): #Método del servidor

        total1 = numero1+numero2
        print(total1)
        return total1

    def resta(self, numero1, numero2): #Método del servidor

        total2 = numero1-numero2
        print(total2)
        return total2

    def multiplicacion(self, numero1, numero2): #Método del servidor

        total3 = numero1*numero2
        print(total3)
        return total3
    
    def division(self, numero1, numero2): #Método del servidor

        total4 = numero1/numero2
        print(total4)
        return total4

#crear una instancia del manejador
manejador = OperacionesHandler()

#Inicializar un procesador para el servicio
procesador = OperacionesServicio.Processor(manejador)

#Crear el socket TCP
puerto = 9090
transporte_serv = TSocket.TServerSocket(port=puerto)

#Buffer ->Eficiencia
transporte_fact = TTransport.TBufferedTransportFactory()

#Protocolo binario
protocolo_fact = TBinaryProtocol.TBinaryProtocolFactory()

#Crear un servidor con funcionalidad básica
servidor = TServer.TSimpleServer(procesador, transporte_serv, transporte_fact, protocolo_fact)
print("Iniciando el servidor en el puerto %s" % puerto)
servidor.serve()

