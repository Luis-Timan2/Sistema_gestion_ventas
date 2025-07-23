INSERT INTO Rol(Nombre)
VALUES
('Administrador'),
('Vendedor'),
('Almacenero');

INSERT INTO TipoDocumento(Nombre)
VALUES
('Documento nacional de identidad'),
('Carnet de extranjería')

INSERT INTO Usuario(Nombre, Apellido, Correo, Usuario, TipoDocumentoId, NumeroDocumento, Estado, FechaRegistro)
VALUES
('Luis', 'Timana', 'timana.bautista.luis@gmail.com','luisadmin',1,'87654321',1,GETDATE())

--hash para 123456
INSERT INTO UsuarioCredencial(UsuarioId,ClaveHash,UltimoCambio)
VALUES
(1,'8d969eef6ecad3c29a3a629280e686cff8fabd7ea3dbeabf2a3e6a1637f7f0e6',GETDATE())

INSERT INTO UsuarioRol(UsuarioId,RolId)
VALUES
(1,1)