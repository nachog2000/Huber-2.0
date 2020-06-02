module Lib where
import Text.Show.Functions

laVerdad = True

type Fecha = (Int, Int, Int)
type CondicionViaje = Viaje -> Bool

-- 1)

data Chofer = UnChofer {
    nombreChofer :: String,
    kilometraje :: Int,
    viajes :: [Viaje],
    condicionViaje :: CondicionViaje
}deriving (Show)

data Cliente = UnCliente {
    nombreCliente :: String,
    vivienda :: String
}deriving (Show)

data Viaje = UnViaje {
    fecha :: Fecha,
    cliente :: Cliente,
    costo :: Int
}deriving (Show)

-- 2)

cualquierViaje :: CondicionViaje
cualquierViaje _ = True

viajeMayorA200 :: CondicionViaje
viajeMayorA200 = (>200).costo

viajeNombreCliente :: Int -> CondicionViaje
viajeNombreCliente n = (>n).largoDelNombreDelCliente
largoDelNombreDelCliente :: Viaje -> Int
largoDelNombreDelCliente = length.nombreCliente.cliente

noViveEnZonaDeterminada :: String -> CondicionViaje
noViveEnZonaDeterminada zona = (/=zona) . vivienda . cliente

-- 3)

lucas :: Cliente
lucas = UnCliente {
    nombreCliente = "Lucas",
    vivienda = "Victoria"
}

daniel :: Chofer
daniel = UnChofer {
    nombreChofer = "Daniel",
    kilometraje = 23500,
    viajes = [UnViaje (20,04,2017) lucas 150],
    condicionViaje = noViveEnZonaDeterminada "Olivos"
}


alejandra :: Chofer
alejandra = UnChofer {
    nombreChofer = "Alejandra",
    kilometraje = 180000,
    viajes = [],
    condicionViaje = cualquierViaje
}


-- 5)

liquidacionChofer :: Chofer -> Int
liquidacionChofer = sum. map costo. viajes


-- Ejemplos: 

clientePrueba = UnCliente {
    nombreCliente = "Paulita",
    vivienda = "Devoto"
}

viajePrueba = UnViaje {
    fecha = (02,06,2020),
    cliente = (UnCliente "Paulita" "Devoto"),
    costo = 1200
}



