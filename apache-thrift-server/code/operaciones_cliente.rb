$:.push('gen-rb') #Instalar el gen de ruby

require 'thrift'
require 'operaciones_servicio'

puerto = 9090

transporte = Thrift::Socket.new('localhost', puerto)
transporte = Thrift::BufferedTransport.new(transporte)
protocolo = Thrift::BinaryProtocol.new(transporte)

cliente = OperacionesServicio::Client.new(protocolo)

transporte.open()
i = 1
while i != 0
    begin
        puts "Ingrese el número 1: "
        numero1 = gets
        puts "Ingrese el número 2:"
        numero2 = gets

        total = cliente.suma(numero1.to_i, numero2.to_i)
        total2 = cliente.resta(numero1.to_i, numero2.to_i)
        total3 = cliente.multiplicacion(numero1.to_i, numero2.to_i)
        total4 = cliente.division(numero1.to_i, numero2.to_i)

        puts "El resultado de la suma es: #{total}"
        puts "El resultado de la resta es: #{total2}"
        puts "El resultado de la multiplicación es: #{total3}"
        puts "El resultado de la división es: #{total4}"

        puts "¿Desea continuar? 1: Sí   0: No"
        bandera = gets
        i = bandera.to_i
        rescue 
            puts "Ingrese un número, por favor!"
    end
    
end

puts "¡HASTA LUEGO!"
transporte.close()