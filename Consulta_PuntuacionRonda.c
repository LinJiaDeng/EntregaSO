//programa en C para consultar los datos de la base de datos
//Incluir esta libreria para poder hacer las llamadas en shiva2.upc.es
//#include <my_global.h>
#include <mysql.h>
#include <string.h>
#include <stdlib.h>
#include <stdio.h>
int main(int argc, char **argv)
{
	MYSQL *conn;
	int err;
	// Estructura especial para almacenar resultados de consultas 
	MYSQL_RES *resultado;
	MYSQL_ROW row;
	char nombre[20];
	int ronda=1;
	char consulta [80];
	//Creamos una conexion al servidor MYSQL 
	conn = mysql_init(NULL);
	if (conn==NULL) {
		printf ("Error al crear la conexiￃﾳn: %u %s\n", 
				mysql_errno(conn), mysql_error(conn));
		exit (1);
	}
	//inicializar la conexion
	conn = mysql_real_connect (conn, "localhost","root", "mysql", "sushigo",0, NULL, 0);
	if (conn==NULL) {
		printf ("Error al inicializar la conexiￃﾳn: %u %s\n", 
				mysql_errno(conn), mysql_error(conn));
		exit (1);
	}
	//Consulta la puntuacion de una ronda de un jugador en concreto.
	 printf("Introduce el nombre del jugador del cual quieres saber la puntuacion de todas las rondas: \n");
	 scanf("%s",nombre);
	
	 sprintf (consulta, "SELECT ROUND_SCORE.SCORE FROM (ROUND_SCORE,PLAYER) WHERE PLAYER.NAME = '%s' AND ROUND_SCORE.ID_P = PLAYER.ID;",nombre);

		err=mysql_query (conn, consulta); 
		if (err!=0) {
			printf ("Error al consultar datos de la base %u %s\n",
					mysql_errno(conn), mysql_error(conn));
			exit (1);
		}
		//recogemos el resultado de la consulta 
		resultado = mysql_store_result (conn); 
		row = mysql_fetch_row (resultado);
		if (row == NULL)
			printf ("No se han obtenido datos en la consulta\n");
		else
			printf ("Puntuaciones: \n");
			while (row != NULL) {
				printf ("     Ronda %d:    %s puntos\n", ronda, row[0]);
				row = mysql_fetch_row (resultado);
				ronda++;
			}
		// cerrar la conexion con el servidor MYSQL 
		mysql_close (conn);
		exit(0);
}
