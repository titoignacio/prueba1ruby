def read_alum(file_name)
file = File.open(file_name, 'r')
alum = file.readlines.map(&:chomp).map { |lines| lines.split(', ') }
file.close
alum
end

def end_line
puts "---------------------------------------------"
end

# Ejercicio nº1
def prom_alum
  alumnos = read_alum("alumnos.csv")
  alumnos.each do |average_alum|
    suma = 0
    average = 0
    count = 0
    average_alum.each_with_index do |prom, index|
    suma += prom.to_f unless index == 0
    average=suma.to_f/index
    end
puts "#{average_alum[0]} tiene un promedio de #{average}"
end_line
 end

end

# Ejercicio nº2
def absence_alum
    alumnos = read_alum("alumnos.csv")
    alumnos.each do |list|
        count = 0
        list.each_with_index do |value, index|
            if index != 0 && value == 'A'
                count += 1
            end
        end
        puts "#{list[0]} tiene #{count} inasistencia."
      end_line
    end
end


# Ejercicio nº3
def approved_alum
    alum = read_alum('alumnos.csv')
    alum.each do |list|
        suma = 0
        average = 0
        list.each_with_index do |notes, index|
            unless index == 0
            suma += notes.to_f
            average = suma/index.to_f
            end
      end
         puts "#{list[0]} tiene #{average} y aprueba" if average >=5
       end_line
   end

end



#menú

option = 0

while option!= 4

  puts "Escoge una opción entre el 1 al 4"
  puts "opción 1 - Mostrar en pantalla el nombre de cada alumno y el promedio de sus notas"
  puts "opción 2 - Mostrar en pantalla el nombre de cada alumno y la cantidad de inasistencias"
  puts "opción 3 - Mostrar en pantalla los nombres de los alumnos aprobados"
  puts "opción 4 - Termina el programa"

  option=gets.chomp.to_i

case option

when 1
  prom_alum
when 2
  absence_alum
when 3
  approved_alum
when 4
  puts "Adiós"
else
  puts "Opción inválida, vuelve a ingresar otra opción"

end
end
