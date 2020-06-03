module Lib where
import Text.Show.Functions

laVerdad = True

-- 1)
type CondicionViaje = Viaje -> Bool
type Fecha = (Int, Int, Int)

data Chofer = UnChofer {
    nombreChofer :: String,
    kilometraje :: Int,
    viajes :: [Viaje],
    condicionViaje :: CondicionViaje
}deriving (Show)

data Viaje = UnViaje {
    fecha :: Fecha,
    cliente :: Cliente,
    costo :: Float
}deriving (Show)

data Cliente = UnCliente {
    nombreCliente :: String,
    localidad :: String
}deriving (Show)


-- 2)

cualquierViaje :: CondicionViaje
cualquierViaje _ = True

viajesMasDe200 :: CondicionViaje
viajesMasDe200 = (>200).costo

viajesConNombreLargo :: Int -> CondicionViaje
viajesConNombreLargo n = (>n).nombreLargo 
nombreLargo :: Viaje -> Int
nombreLargo = length.nombreCliente.cliente

clienteViveEnUnaZonaNoDeterminada :: String -> CondicionViaje
clienteViveEnUnaZonaNoDeterminada zona = (/=zona).localidad.cliente