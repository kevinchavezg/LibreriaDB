CREATE DATABASE Libreria;

use Libreria;

create table Nacionalidades (
    idNacionalidad int primary key auto_increment,
    nombre varchar(45) not null
);

create table Autores (
    idAutor int primary key auto_increment,
    nombre varchar(45) not null,
    fechaNacimiento date not null,
    idNacionalidad int not null,
    foreign key (idNacionalidad) references Nacionalidades(idNacionalidad)
);

create table Editoriales (
    idEditorial int primary key auto_increment,
    nombre varchar(45) not null
);

create table Categorias (
    idCategoria int primary key auto_increment,
    nombre varchar(45) not null
);

create table Libros (
    idLibro int primary key auto_increment,
    titulo varchar(45) not null,
    fechaPublicacion date not null,
    isbn varchar(45) not null,
    precio decimal not null,
    cantidad int not null,
    idEditorial int not null,
    foreign key (idEditorial) references Editoriales(idEditorial)
);

create table Autores_has_Libros (
    Autores_idAutor int not null,
    Libros_idLibro int not null,
    primary key (Autores_idAutor, Libros_idLibro),
    foreign key (Autores_idAutor) references Autores(idAutor),
    foreign key (Libros_idLibro) references Libros(idLibro)
);

create table Categorias_has_Libros (
    Categorias_idCategoria int not null,
    Libros_idLibro int not null,
    primary key (Categorias_idCategoria, Libros_idLibro),
    foreign key (Categorias_idCategoria) references Categorias(idCategoria),
    foreign key (Libros_idLibro) references Libros(idLibro)
);

create table LineasPedidos (
    idLineaPedido int primary key auto_increment,
    cantidad int not null,
    precio decimal not null
);

create table Libros_has_LineasPedidos (
    Libros_idLibro int not null,
    LineasPedidos_idLineaPedido int not null,
    primary key (Libros_idLibro, LineasPedidos_idLineaPedido),
    foreign key (Libros_idLibro) references Libros(idLibro),
    foreign key (LineasPedidos_idLineaPedido) references LineasPedidos(idLineaPedido)
);

create table Clientes (
    idCliente int primary key auto_increment,
    nombre varchar(45) not null,
    correo varchar(45) not null,
    direccion varchar(45) not null
);

create table EstadoPedidos (
    idEstadoPedido int primary key auto_increment,
    estado varchar(45) not null
);

create table Pedidos (
    idPedido int primary key auto_increment,
    idCliente int not null,
    idEstadoPedido int not null,
    fechaCompra date not null,
    foreign key (idCliente) references Clientes(idCliente),
    foreign key (idEstadoPedido) references EstadoPedidos(idEstadoPedido)
);

create table MetodosPago (
    idMetodoPago int primary key auto_increment,
    metodo varchar(45) not null
);

create table Transacciones (
    idTransaccion int primary key auto_increment,
    idMetodo int not null,
    monto decimal not null,
    fechaTransaccion date not null,
    foreign key (idMetodo) references MetodosPago(idMetodoPago)
);

create table Transacciones_has_Pedidos (
    Transacciones_idTransaccion int not null,
    Pedidos_idPedido int not null,
    primary key (Transacciones_idTransaccion, Pedidos_idPedido),
    foreign key (Transacciones_idTransaccion) references Transacciones(idTransaccion),
    foreign key (Pedidos_idPedido) references Pedidos(idPedido)
);