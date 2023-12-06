-- Tabla de Usuarios
CREATE TABLE Usuarios (
    Cedula VARCHAR(20) PRIMARY KEY,
    Nombre VARCHAR(255),
    Apellido VARCHAR(255),
    CorreoElectronico VARCHAR(255) UNIQUE,
    Contraseña VARCHAR(255),
    Direccion VARCHAR(255),
    Telefono VARCHAR(15)
);

-- Tabla de Ubicaciones
CREATE TABLE Ubicaciones (
    LocationID INT PRIMARY KEY AUTO_INCREMENT,
    NombreUbicacion VARCHAR(255),
    Latitud DECIMAL(10, 6),
    Longitud DECIMAL(10, 6),
    Direccion VARCHAR(255)
);

-- Tabla de Bicicletas
CREATE TABLE Bicicletas (
    BikeID INT PRIMARY KEY AUTO_INCREMENT,
    Modelo VARCHAR(255),
    Tipo VARCHAR(50),
    Estado VARCHAR(50),
    PrecioPorHora DECIMAL(8, 2),
    Descripcion TEXT,
    LocationID INT,
    FOREIGN KEY (LocationID) REFERENCES Ubicaciones(LocationID)
);

-- Tabla de Alquileres
CREATE TABLE Alquileres (
    RentalID INT PRIMARY KEY AUTO_INCREMENT,
    Cedula varchar(20),
    BikeID INT,
    FechaInicio DATETIME,
    FechaFin DATETIME,
    EstadoAlquiler VARCHAR(50),
    MontoTotal DECIMAL(8, 2),
    LocationID INT,
    FOREIGN KEY (Cedula) REFERENCES Usuarios(Cedula),  -- Cambié UserID a Cedula
    FOREIGN KEY (BikeID) REFERENCES Bicicletas(BikeID),
    FOREIGN KEY (LocationID) REFERENCES Ubicaciones(LocationID)
);


-- Tabla de Transacciones
CREATE TABLE Transacciones (
    TransactionID INT PRIMARY KEY AUTO_INCREMENT,
    Cedula VARCHAR(20),
    RentalID INT,
    Monto DECIMAL(8, 2),
    MetodoPago VARCHAR(50),
    FechaTransaccion DATETIME,
    FOREIGN KEY (Cedula) REFERENCES Usuarios(Cedula),
    FOREIGN KEY (RentalID) REFERENCES Alquileres(RentalID)
);

-- Tabla de Calificaciones y Reseñas
CREATE TABLE CalificacionesResenas (
    ReviewID INT PRIMARY KEY AUTO_INCREMENT,
    Cedula VARCHAR(20),
    BikeID INT,
    Comentario TEXT,
    Calificacion INT,
    FechaResena DATETIME,
    FOREIGN KEY (Cedula) REFERENCES Usuarios(Cedula),
    FOREIGN KEY (BikeID) REFERENCES Bicicletas(BikeID)
);

-- Tabla de Propietarios de Bicicletas
CREATE TABLE PropietariosBicicletas (
    OwnerID INT PRIMARY KEY AUTO_INCREMENT,
    Cedula VARCHAR(20),
    BikeID INT,
    FOREIGN KEY (Cedula) REFERENCES Usuarios(Cedula),
    FOREIGN KEY (BikeID) REFERENCES Bicicletas(BikeID)
);

-- Tabla de Mantenimiento
CREATE TABLE Mantenimiento (
    MaintenanceID INT PRIMARY KEY AUTO_INCREMENT,
    BikeID INT,
    DescripcionMantenimiento TEXT,
    FechaInicioMantenimiento DATETIME,
    FechaFinMantenimiento DATETIME,
    CostoMantenimiento DECIMAL(8, 2),
    EstadoMantenimiento VARCHAR(50),
    FOREIGN KEY (BikeID) REFERENCES Bicicletas(BikeID)
);

-- Tabla de Control de Calidad
CREATE TABLE ControlCalidad (
    QualityControlID INT PRIMARY KEY AUTO_INCREMENT,
    BikeID INT,
    FechaRevision DATETIME,
    Observaciones TEXT,
    EstadoCalidad VARCHAR(50),
    FOREIGN KEY (BikeID) REFERENCES Bicicletas(BikeID)
);

-- Tabla de Filtrados y Preferencias
CREATE TABLE FiltradosPreferencias (
    FilterID INT PRIMARY KEY AUTO_INCREMENT,
    Cedula VARCHAR(20),
    TipoFiltro VARCHAR(50),
    ValorFiltro VARCHAR(255),
    FOREIGN KEY (Cedula) REFERENCES Usuarios(Cedula)
);

-- Tabla de Incidentes
CREATE TABLE Incidentes (
    IncidentID INT PRIMARY KEY AUTO_INCREMENT,
    RentalID INT,
    DescripcionIncidente TEXT,
    CostoReparacion DECIMAL(8, 2),
    FechaIncidente DATETIME,
    FOREIGN KEY (RentalID) REFERENCES Alquileres(RentalID)
);

-- Tabla de Pagos
CREATE TABLE Pagos (
    PaymentID INT PRIMARY KEY AUTO_INCREMENT,
    Cedula VARCHAR(20),
    Monto DECIMAL(8, 2),
    MetodoPago VARCHAR(50),
    FechaPago DATETIME,
    FOREIGN KEY (Cedula) REFERENCES Usuarios(Cedula)
);

-- Tabla de Garantías
CREATE TABLE Garantias (
    WarrantyID INT PRIMARY KEY AUTO_INCREMENT,
    Cedula VARCHAR(20),
    BikeID INT,
    DescripcionGarantia TEXT,
    FechaInicioGarantia DATETIME,
    FechaFinGarantia DATETIME,
    FOREIGN KEY (Cedula) REFERENCES Usuarios(Cedula),
    FOREIGN KEY (BikeID) REFERENCES Bicicletas(BikeID)
);
