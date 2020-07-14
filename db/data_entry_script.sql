insert into categoria (id_categoria, nombre) values (0, 'verdura');
insert into categoria (id_categoria, nombre) values (1, 'carne');
insert into categoria (id_categoria, nombre) values (2, 'legumbre');
insert into categoria (id_categoria, nombre) values (3, 'lacteo');
insert into categoria (id_categoria, nombre) values (4, 'fruta');

insert into unidad_medida (id_unidad_medida, nombre) values (0, 'gramos');
insert into unidad_medida (id_unidad_medida, nombre) values (1, 'unidades');
insert into unidad_medida (id_unidad_medida, nombre) values (2, 'filetes');

insert into alimento (id_alimento, nombre, calorias, grasas, proteinas, carbohidratos, id_unidad_medida, id_categoria) values (0, 'Carne de vaca', 150, 50, 20, 0, 2, 1);
insert into alimento (id_alimento, nombre, calorias, grasas, proteinas, carbohidratos, id_unidad_medida, id_categoria) values (1, 'Lentejas', 100, 0, 35, 30, 0, 2);
insert into alimento (id_alimento, nombre, calorias, grasas, proteinas, carbohidratos, id_unidad_medida, id_categoria) values (2, 'Queso parmesano', 500, 200, 70, 15, 0, 3);

insert into estado_animo (id_estado_animo, nombre) values (0, 'desanimado');
insert into estado_animo (id_estado_animo, nombre) values (1, 'energico');
insert into estado_animo (id_estado_animo, nombre) values (2, 'cansado');
insert into estado_animo (id_estado_animo, nombre) values (3, 'desmotivado');
insert into estado_animo (id_estado_animo, nombre) values (4, 'motivado');

insert into paciente (dni, nombre, apellido, email, password, telefono, genero, fecha_nacimiento, altura, peso, imc, metabolismo_basal, peso_objetivo, objetivo)
	values ('1111111', 'agustin', 'dangelo', 'agustin@gmail.com', 'agustin', '12313123', 'masculino', '20000224', 177, 77, 20, 2000, 90, 'subir peso');
insert into paciente (dni, nombre, apellido, email, password, telefono, genero, fecha_nacimiento, altura, peso, imc, metabolismo_basal, peso_objetivo, objetivo)
	values ('2222222', 'rodrigo', 'perez', 'rodrigo@gmail.com', 'rodrigo', '7657567567', 'masculino', '20050224', 150, 60, 15, 1800, 55, 'bajar peso');
insert into paciente (dni, nombre, apellido, email, password, telefono, genero, fecha_nacimiento, altura, peso, imc, metabolismo_basal, peso_objetivo, objetivo)
	values ('4124412', 'martin', 'moreno', 'martin@gmail.com', 'martin', '556456', 'masculino', '20050130', 165, 57, 12, 2150, 70, 'aumentar masa muscular');
    
insert into nutricionista (matricula, nombre, apellido, password) values (00000, 'laura', 'merlo', 'laura');
insert into nutricionista (matricula, nombre, apellido, password) values (12312, 'martina', 'moron', 'martina');
insert into nutricionista (matricula, nombre, apellido, password) values (55555, 'juan', 'mendez', 'juan');

insert into nutricionista_paciente (id_nutricionista, id_paciente, fecha) values (00000, 1111111, 20201202);
insert into nutricionista_paciente (id_nutricionista, id_paciente, fecha) values (00000, 1111111, 20200815);
insert into nutricionista_paciente (id_nutricionista, id_paciente, fecha) values (55555, 2222222, 20200615);

insert into solicitud (id_nutricionista, id_paciente, estado_solicitud) values (00000, 4124412, 'confirmada');
insert into solicitud (id_nutricionista, id_paciente, estado_solicitud) values (55555, 4124412, 'pendiente');
insert into solicitud (id_nutricionista, id_paciente, estado_solicitud) values (55555, 4124412, 'rechazada');
insert into solicitud (id_nutriconsumo_pacienteconsumo_pacientecionista, id_paciente, estado_solicitud) values (12312, 4124412, 'confirmada');
insert into solicitud (id_nutricionista, id_paciente, estado_solicitud) values (12312, 2222222, 'pendiente');
insert into solicitud (id_nutricionista, id_paciente, estado_solicitud) values (55555, 2222222, 'rechazada');

insert into ejercicio (id_ejercicio, nombre, gasto_energetico) values (0, 'correr', 1000);
insert into ejercicio (id_ejercicio, nombre, gasto_energetico) values (1, 'nado', 1300);
insert into ejercicio (id_ejercicio, nombre, gasto_energetico) values (2, 'caminata', 500);
insert into ejercicio (id_ejercicio, nombre, gasto_energetico) values (3, 'pesas', 600);
insert into ejercicio (id_ejercicio, nombre, gasto_energetico) values (4, 'ciclismo', 400);
insert into ejercicio (id_ejercicio, nombre, gasto_energetico) values (5, 'tennis', 1000);

insert into paciente_ejercicio (id_paciente, id_ejercicio, fecha_hora, duracion, intensidad) values (2222222, 0, now(), 30, 'moderada');
insert into paciente_ejercicio (id_paciente, id_ejercicio, fecha_hora, duracion, intensidad) values (1111111, 3, now(), 50, 'alta');
insert into paciente_ejercicio (id_paciente, id_ejercicio, fecha_hora, duracion, intensidad) values (1111111, 4, now(), 10, 'baja');
insert into paciente_ejercicio (id_paciente, id_ejercicio, fecha_hora, duracion, intensidad) values (2222222, 0, now(), 30, 'moderada');
insert into paciente_ejercicio (id_paciente, id_ejercicio, fecha_hora, duracion, intensidad) values (1111111, 2, now(), 10, 'baja');
insert into paciente_ejercicio (id_paciente, id_ejercicio, fecha_hora, duracion, intensidad) values (1111111, 0, now(), 10, 'baja');
insert into paciente_ejercicio (id_paciente, id_ejercicio, fecha_hora, duracion, intensidad) values (4124412, 0, now(), 30, 'moderada');
insert into paciente_ejercicio (id_paciente, id_ejercicio, fecha_hora, duracion, intensidad) values (4124412, 3, now(), 50, 'alta');
insert into paciente_ejercicio (id_paciente, id_ejercicio, fecha_hora, duracion, intensidad) values (4124412, 4, now(), 10, 'baja');

insert into plan (id_paciente, fecha_desde, id_plan_alimentacion) values (0, curdate(), 0);
insert into plan (id_paciente, fecha_desde, id_plan_alimentacion) values (1, curdate(), 1);
insert into plan (id_paciente, fecha_desde, id_plan_alimentacion) values (2, curdate(), 2);

insert into plan_alimento (id_plan_alimentacion, id_alimento) values (0, 0);
insert into plan_alimento (id_plan_alimentacion, id_alimento) values (0, 1);
insert into plan_alimento (id_plan_alimentacion, id_alimento) values (1, 0);
insert into plan_alimento (id_plan_alimentacion, id_alimento) values (1, 2);
insert into plan_alimento (id_plan_alimentacion, id_alimento) values (2, 2);

insert into paciente_estado_animo (id_paciente, id_estado_animo, fecha) values (2222222, 4, curdate());
insert into paciente_estado_animo (id_paciente, id_estado_animo, fecha) values (1111111, 3, curdate());
insert into paciente_estado_animo (id_paciente, id_estado_animo, fecha) values (4124412, 1, curdate());

insert into horario (id_nutricionista, dia, hora_desde, hora_hasta) values ('12312', 'martes', 080000, 083000);
insert into horario (id_nutricionista, dia, hora_desde, hora_hasta) values ('12312', 'martes', 090000, 093000);
insert into horario (id_nutricionista, dia, hora_desde, hora_hasta) values ('12312', 'miercoles', 080000, 083000);
insert into horario (id_nutricionista, dia, hora_desde, hora_hasta) values ('12312', 'miercoles', 090000, 093000);
insert into horario (id_nutricionista, dia, hora_desde, hora_hasta) values ('12312', 'miercoles', 093000, 100000);
insert into horario (id_nutricionista, dia, hora_desde, hora_hasta) values ('12312', 'miercoles', 100000, 103000);
insert into horario (id_nutricionista, dia, hora_desde, hora_hasta) values ('12312', 'jueves', 080000, 083000);
insert into horario (id_nutricionista, dia, hora_desde, hora_hasta) values ('12312', 'jueves', 090000, 093000);
insert into horario (id_nutricionista, dia, hora_desde, hora_hasta) values ('12312', 'jueves', 093000, 100000);
insert into horario (id_nutricionista, dia, hora_desde, hora_hasta) values ('12312', 'jueves', 100000, 103000);
insert into horario (id_nutricionista, dia, hora_desde, hora_hasta) values ('55555', 'martes', 080000, 083000);
insert into horario (id_nutricionista, dia, hora_desde, hora_hasta) values ('55555', 'martes', 090000, 093000);
insert into horario (id_nutricionista, dia, hora_desde, hora_hasta) values ('55555', 'miercoles', 080000, 083000);
insert into horario (id_nutricionista, dia, hora_desde, hora_hasta) values ('55555', 'miercoles', 090000, 093000);
insert into horario (id_nutricionista, dia, hora_desde, hora_hasta) values ('55555', 'miercoles', 093000, 100000);
insert into horario (id_nutricionista, dia, hora_desde, hora_hasta) values ('55555', 'miercoles', 100000, 103000);
insert into horario (id_nutricionista, dia, hora_desde, hora_hasta) values ('55555', 'lunes', 080000, 083000);
insert into horario (id_nutricionista, dia, hora_desde, hora_hasta) values ('55555', 'lunes', 090000, 093000);
insert into horario (id_nutricionista, dia, hora_desde, hora_hasta) values ('55555', 'lunes', 093000, 100000);
insert into horario (id_nutricionista, dia, hora_desde, hora_hasta) values ('55555', 'lunes', 100000, 103000);
insert into horario (id_nutricionista, dia, hora_desde, hora_hasta) values ('55555', 'martes', 080000, 083000);
insert into horario (id_nutricionista, dia, hora_desde, hora_hasta) values ('00000', 'martes', 090000, 093000);
insert into horario (id_nutricionista, dia, hora_desde, hora_hasta) values ('00000', 'miercoles', 080000, 083000);
insert into horario (id_nutricionista, dia, hora_desde, hora_hasta) values ('00000', 'miercoles', 090000, 093000);
insert into horario (id_nutricionista, dia, hora_desde, hora_hasta) values ('00000', 'miercoles', 093000, 100000);
insert into horario (id_nutricionista, dia, hora_desde, hora_hasta) values ('00000', 'miercoles', 100000, 103000);
insert into horario (id_nutricionista, dia, hora_desde, hora_hasta) values ('00000', 'viernes', 080000, 083000);
insert into horario (id_nutricionista, dia, hora_desde, hora_hasta) values ('00000', 'viernes', 090000, 093000);
insert into horario (id_nutricionista, dia, hora_desde, hora_hasta) values ('00000', 'viernes', 093000, 100000);
insert into horario (id_nutricionista, dia, hora_desde, hora_hasta) values ('00000', 'viernes', 100000, 103000);

insert into direccion (cod_postal, localidad, numero, calle, id_nutricionista) values (2000, 'Rosario', 1300, 'Zeballos', 00000);
insert into direccion (cod_postal, localidad, numero, calle, id_nutricionista) values (2113, 'Peyrano', 200, 'Av. San Martin', 55555);
insert into direccion (cod_postal, localidad, numero, calle, id_nutricionista) values (2000, 'Rosario', 2213, 'Corrientes', 12312);

insert into consumo_paciente (id_paciente, id_alimento, fecha, tipo, cantidad) values (1111111, 0, curdate(), 'merienda', 3);
insert into consumo_paciente (id_paciente, id_alimento, fecha, tipo, cantidad) values (1111111, 1, curdate(), 'almuerzo', 200);
insert into consumo_paciente (id_paciente, id_alimento, fecha, tipo, cantidad) values (2222222, 1, curdate(), 'desayuno', 500);
insert into consumo_paciente (id_paciente, id_alimento, fecha, tipo, cantidad) values (2222222, 2, curdate(), 'almuerzo', 50);
insert into consumo_paciente (id_paciente, id_alimento, fecha, tipo, cantidad) values (4124412, 0, curdate(), 'cena', 2);
insert into consumo_paciente (id_paciente, id_alimento, fecha, tipo, cantidad) values (4124412, 0, curdate(), 'otro', 5);
