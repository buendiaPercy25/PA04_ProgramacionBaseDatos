# PA4 - Programación Avanzada de Base de Datos

## 📌 Nombre del proyecto o evaluación
- **Evaluación:** PA4 - Proceso de Aprendizaje 4
- **Curso:** Programación Avanzada de Base de Datos (Código: `30627`)
- **Institución / Periodo / Corte:** ISIL | Periodo `202620` | Sesión 13 (Ponderación: 15%)
- **Caso trabajado:** Gestión de clientes, productos y operaciones en una organización comercial (**ComercialAndesDB** / tienda tecnológica)

---

## 👥 Integrantes
1. **Percy Astocahuana Buendía** — *Rol / Participación:* Gestión y diseño de la base de datos (`ComercialAndesDB.sql`) y desarrollo de la **Actividad 1** (`Query01-parte.sql` y `Query01-parte2.sql`: automatización mediante desencadenantes para `INSERT`, `UPDATE` y `DELETE` utilizando `inserted` y `deleted`, pruebas de modificación y auditoría)
2. **Nelson Amado Del Portal Neyra** — *Rol / Participación:* [Completa su rol o participación en el proyecto y la exposición]
3. **Luis Ángel Chávez Quispe** — *Rol / Participación:* [Completa su rol o participación en el proyecto y la exposición]
4. **Diego Fernando Martinez del Carpio** — *Rol / Participación:* [Completa su rol o participación en el proyecto y la exposición]

---

## 📝 Descripción
Una organización necesita administrar sus clientes, productos y operaciones mediante una base de datos en **Microsoft SQL Server** (`ComercialAndesDB`). A medida que crecen las transacciones y los perfiles de trabajo, resulta indispensable automatizar respuestas ante cambios en los datos (`INSERT`, `UPDATE`, `DELETE`), reutilizar cálculos y conjuntos de resultados, evaluar críticamente el recorrido fila por fila frente a operaciones basadas en conjuntos y establecer controles de acceso diferenciados y seguros en el servidor.

---

## 🎯 Objetivo
Construir una solución administrable y segura en **Microsoft SQL Server** sobre la base de datos `ComercialAndesDB`, aplicando exclusivamente los contenidos de las **Sesiones 11 a 13** del curso:

- **Sesión 11 (Desencadenantes):** Automatizar respuestas verificables ante operaciones `INSERT`, `UPDATE` y `DELETE` utilizando las pseudotablas `inserted` y `deleted`.
- **Sesión 12 (Funciones y cursores):** Implementar funciones escalares y funciones de tipo tabla para reutilizar lógica, además de crear y consumir un cursor sencillo evaluando críticamente sus ventajas, desventajas e implicancias frente a alternativas basadas en conjuntos.
- **Sesión 13 (Seguridad y control de acceso):** Definir perfiles de acceso, configurar autenticación, usuarios y roles en SQL Server según responsabilidades, validar permisos y explicar el propósito de claves y certificados.

---

## ⚙️ Desarrollo
1. **Contexto y base de datos (`ComercialAndesDB.sql` — Percy Astocahuana Buendía):** Se trabajó sobre el caso de gestión de clientes, productos y operaciones en SQL Server (incluyendo entidades como clientes, productos y operaciones de venta).
2. **Actividad 1 — Automatización mediante desencadenantes (`Query01-parte.sql` y `Query01-parte2.sql` — Percy Astocahuana Buendía):** Se diseñaron desencadenantes para las acciones `INSERT`, `UPDATE` y `DELETE`, empleando `inserted` y `deleted` para detectar los cambios realizados, actualizar/reponer existencias de productos y registrar el historial en auditoría con justificación técnica del uso de triggers.
3. **Actividad 2 — Funciones escalares y de tipo tabla:** Se desarrollaron funciones escalares y de tipo tabla orientadas a cálculos y consultas reutilizables del caso, documentando sus diferencias operativas y criterios de elección.
4. **Actividad 3 — Cursor y evaluación crítica de alternativas:** Se implementó y consumió un cursor sencillo sobre registros del proyecto y se contrastó su comportamiento frente a una alternativa basada en conjuntos, sustentando técnicamente cuándo conviene o no utilizarlo.
5. **Actividad 4 — Autenticación, usuarios, roles y seguridad:** Se definieron perfiles de acceso diferenciados, se configuró la autenticación pertinente y se crearon usuarios y roles acordes con las funciones de cada perfil, comprobando los permisos y explicando el rol de claves y certificados.
6. **Validación y entrega:** Se verificaron las pruebas en SQL Server, se organizó el repositorio en GitHub sin exponer contraseñas ni datos sensibles, y se preparó la exposición grupal en YouTube con cámaras encendidas.

---

## 💡 Solución propuesta
La solución organiza los scripts y artefactos correspondientes a las actividades del **PA4** (Sesiones 11 a 13):

- **Base de datos y carga inicial (`ComercialAndesDB.sql` — Percy Astocahuana Buendía):** Script de estructura y datos base (clientes, productos y operaciones) en Microsoft SQL Server.
- **Actividad 1 (`Query01-parte.sql` y `Query01-parte2.sql` — Percy Astocahuana Buendía):** Desencadenantes para `INSERT`, `UPDATE` y `DELETE` usando `inserted` y `deleted` para reflejar variaciones de cantidad/stock y registrar eventos de auditoría, acompañados de pruebas de modificación y verificación de resultados.
- **Actividad 2 (`Actividad2_Funciones.sql`):** Definición y consumo de función(es) escalar(es) y función(es) de tipo tabla aplicables al negocio, junto con la comparación funcional entre ambos tipos de objeto.
- **Actividad 3 (`Actividad3_Cursor_y_Comparativa.sql`):** Script de declaración, apertura, lectura (`FETCH`), procesamiento y cierre/liberación de un cursor sencillo, contrastado con una consulta/operación basada en conjuntos y una conclusión técnica.
- **Actividad 4 (`Actividad4_Seguridad_Roles.sql`):** Matriz de perfiles de acceso, configuración de autenticación, creación de usuarios y roles con privilegios delimitados, pruebas de acceso (permitidos/denegados) y explicación técnica del uso de claves y certificados.

---

## ▶️ Cómo ejecutar o revisar el proyecto
1. **Requisitos previos:** Contar con una instancia activa de **Microsoft SQL Server** y **SQL Server Management Studio (SSMS)** con permisos administrativos suficientes para crear objetos y gestionar seguridad durante las pruebas (sin utilizar credenciales reales o sensibles).
2. **Preparar la base de datos:** Abrir SSMS y ejecutar el script `ComercialAndesDB.sql` para crear la base de datos, tablas y datos iniciales del caso.
3. **Ejecutar las actividades en orden:**
  1. Scripts de **Actividad 1**: ejecutar `Query01-parte.sql` y luego `Query01-parte2.sql` (desencadenantes `INSERT`, `UPDATE`, `DELETE` y pruebas de modificación).
  2. Script de **Actividad 2** (funciones escalares y de tipo tabla + consultas de consumo).
  3. Script de **Actividad 3** (cursor sencillo y alternativa basada en conjuntos).
  4. Script de **Actividad 4** (perfiles, autenticación, usuarios, roles, pruebas de acceso y documentación de claves/certificados).
4. **Revisar evidencias:** Contrastar las salidas en las pestañas *Resultados* y *Mensajes* de SSMS con las capturas y comprobaciones registradas en el repositorio.

---

## 📷 Evidencias



<img width="991" height="597" alt="image" src="https://github.com/user-attachments/assets/1d87ea1c-1b74-4e97-a6f3-705d0d560edc" />

### 2. Pruebas de desencadenantes (`Query01-parte.sql` y `Query01-parte2.sql`) y tabla de auditoría
Ejecución de operaciones (`INSERT`, `UPDATE`, `DELETE`) sobre `ProductoID = 3` (*Monitor 24 Pulgadas*) mostrando la actualización del `StockActual` y el registro automático en la tabla de auditoría (`TipoCambio`: `INSERT`, `UPDATE`, `DELETE`, `CantidadAnterior`, `CantidadNueva`, `DescripcionCambio`, `FechaCambio`):
<img width="1443" height="538" alt="Captura de pantalla 2026-11-23 223537" src="https://github.com/user-attachments/assets/a94d4191-306a-4f17-a840-5973d9b30967" />

<img width="686" height="395" alt="Captura de pantalla 2026-11-23 223544" src="https://github.com/user-attachments/assets/0b1664a9-0d55-4a29-90e2-c6bc0fd56dab" />


> *Nota:* Agrega aquí las capturas o diagramas adicionales correspondientes a las **Actividades 2, 3 y 4** (funciones escalares y de tabla, ejecución de cursor vs. consulta basada en conjuntos, y pruebas de usuarios, roles y seguridad).

---

## 📚 Conclusiones
- **Automatización confiable con desencadenantes:** El uso de triggers para `INSERT`, `UPDATE` y `DELETE` apoyados en `inserted` y `deleted` permite reaccionar automáticamente ante cambios en las operaciones, mantener coherente el stock y dejar trazabilidad en auditoría desde el lado del servidor.
- **Reutilización y diseño adecuado de funciones:** Las funciones escalares resultan idóneas para devolver un único valor calculado, mientras que las funciones de tipo tabla son apropiadas para encapsular conjuntos de filas reutilizables dentro de consultas.
- **Evaluación crítica de cursores:** Aunque un cursor permite recorrer registros de forma individual, las operaciones basadas en conjuntos suelen ser más eficientes y declarativas en SQL Server; el cursor debe reservarse para escenarios donde el procesamiento fila a fila esté técnicamente justificado.
- **Seguridad basada en el principio de menor privilegio:** Definir perfiles, autenticación adecuada, usuarios y roles restringidos a las tareas de cada rol —junto con la comprensión de claves y certificados— fortalece la protección y gobernabilidad de la base de datos.

---

## 🎥 Video de exposición
Video público de YouTube:
