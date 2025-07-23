using Microsoft.Data.SqlClient;

namespace SistemaGestionVentas.Data
{
    public class Conexion
    {
        private static readonly string connection = "Server=LAPTOPLT;Database=SistemaVentas;User Id=sa;Password=12345;TrustServerCertificate=True";

        public static SqlConnection GetConnection()
        {
            return new SqlConnection(connection);
        }
    }
}
