# PA4 - Programación Avanzada de Base de Datos

## 📌 Nombre del proyecto o evaluación
* **Evaluación:** PA4 - Proceso de Aprendizaje 4[cite: 1, 2]
* **Curso:** Programación Avanzada de Base de Datos (Código: `30627`)[cite: 1]
* **Institución / Periodo / Corte:** ISIL | Periodo `202620` | Sesión 13 (Ponderación: 15%)[cite: 1, 2]
* **Caso trabajado:** Gestión de clientes, productos y operaciones en una tienda tecnológica (**NovaMarket**)[cite: 4]

---

## 👥 Integrantes
1. **Percy Astocahuana Buendía** — *Rol / Participación:* Gestión y diseño de la base de datos y desarrollo de la **Actividad 1** (automatización mediante desencadenantes para `INSERT`, `UPDATE` y `DELETE` utilizando `inserted` y `deleted`, pruebas de modificación y auditoría)[cite: 2, 4, 7]
2. **Nelson Amado Del Portal Neyra** — *Rol / Participación:* [Completa su rol o participación en el proyecto y la exposición][cite: 2, 5]
3. **Luis Ángel Chávez Quispe** — *Rol / Participación:* [Completa su rol o participación en el proyecto y la exposición][cite: 2, 5]
4. **Diego Fernando Martinez del Carpio** — *Rol / Participación:* [Completa su rol o participación en el proyecto y la exposición][cite: 2, 5]

---

## 📝 Descripción
Una organización dedicada a la comercialización de productos tecnológicos (**NovaMarket**) necesita administrar sus clientes, productos y operaciones mediante una base de datos en **Microsoft SQL Server**[cite: 4, 6]. A medida que crecen las transacciones y los perfiles de trabajo, resulta indispensable automatizar respuestas ante cambios en los datos (`INSERT`, `UPDATE`, `DELETE`), reutilizar cálculos y conjuntos de resultados, evaluar críticamente el recorrido fila por fila frente a operaciones basadas en conjuntos y establecer controles de acceso diferenciados y seguros en el servidor[cite: 2, 4].

---

## 🎯 Objetivo
Construir una solución administrable y segura en **Microsoft SQL Server** sobre la base de datos de la tienda tecnológica, aplicando exclusivamente los contenidos de las **Sesiones 11 a 13** del curso[cite: 2, 4]:

* **Sesión 11 (Desencadenantes):** Automatizar respuestas verificables ante operaciones `INSERT`, `UPDATE` y `DELETE` utilizando las pseudotablas `inserted` y `deleted`[cite: 2, 4].
* **Sesión 12 (Funciones y cursores):** Implementar funciones escalares y funciones de tipo tabla para reutilizar lógica, además de crear y consumir un cursor sencillo evaluando críticamente sus ventajas, desventajas e implicancias frente a alternativas basadas en conjuntos[cite: 2, 4].
* **Sesión 13 (Seguridad y control de acceso):** Definir perfiles de acceso, configurar autenticación, usuarios y roles en SQL Server según responsabilidades, validar permisos y explicar el propósito de claves y certificados[cite: 2, 4].

---

## ⚙️ Desarrollo
1. **Contexto y base de datos (Percy Astocahuana Buendía):** Se trabajó sobre el caso de gestión de clientes, productos y operaciones en SQL Server (incluyendo entidades como clientes, productos y operaciones de venta)[cite: 4, 6].
2. **Actividad 1 — Automatización mediante desencadenantes (Percy Astocahuana Buendía):** Se diseñaron desencadenantes para las acciones `INSERT`, `UPDATE` y `DELETE`, empleando `inserted` y `deleted` para detectar los cambios realizados, actualizar/reponer existencias de productos y registrar el historial en auditoría con justificación técnica del uso de triggers[cite: 2, 4, 7].
3. **Actividad 2 — Funciones escalares y de tipo tabla:** Se desarrollaron funciones escalares y de tipo tabla orientadas a cálculos y consultas reutilizables del caso, documentando sus diferencias operativas y criterios de elección[cite: 2, 4].
4. **Actividad 3 — Cursor y evaluación crítica de alternativas:** Se implementó y consumió un cursor sencillo sobre registros del proyecto y se contrastó su comportamiento frente a una alternativa basada en conjuntos, sustentando técnicamente cuándo conviene o no utilizarlo[cite: 2, 4].
5. **Actividad 4 — Autenticación, usuarios, roles y seguridad:** Se definieron perfiles de acceso diferenciados, se configuró la autenticación pertinente y se crearon usuarios y roles acordes con las funciones de cada perfil, comprobando los permisos y explicando el rol de claves y certificados[cite: 2, 4].
6. **Validación y entrega:** Se verificaron las pruebas en SQL Server, se organizó el repositorio en GitHub sin exponer contraseñas ni datos sensibles, y se preparó la exposición grupal en YouTube con cámaras encendidas[cite: 3, 5].

---

## 💡 Solución propuesta
La solución organiza los scripts y artefactos correspondientes a las actividades del **PA4** (Sesiones 11 a 13)[cite: 2, 4, 5]:

* **Base de datos y carga inicial (Percy Astocahuana Buendía):** Script de estructura y datos base (clientes, productos y operaciones) en Microsoft SQL Server[cite: 4, 6].
* **Actividad 1 (`Actividad1_Triggers.sql` — Percy Astocahuana Buendía):** Desencadenantes para `INSERT`, `UPDATE` y `DELETE` usando `inserted` y `deleted` para reflejar variaciones de cantidad/stock y registrar eventos de auditoría, acompañados de pruebas de modificación y verificación de resultados[cite: 4, 7].
* **Actividad 2 (`Actividad2_Funciones.sql`):** Definición y consumo de función(es) escalar(es) y función(es) de tipo tabla aplicables al negocio, junto con la comparación funcional entre ambos tipos de objeto[cite: 4].
* **Actividad 3 (`Actividad3_Cursor_y_Comparativa.sql`):** Script de declaración, apertura, lectura (`FETCH`), procesamiento y cierre/liberación de un cursor sencillo, contrastado con una consulta/operación basada en conjuntos y una conclusión técnica[cite: 4].
* **Actividad 4 (`Actividad4_Seguridad_Roles.sql`):** Matriz de perfiles de acceso, configuración de autenticación, creación de usuarios y roles con privilegios delimitados, pruebas de acceso (permitidos/denegados) y explicación técnica del uso de claves y certificados[cite: 4].

---

## ▶️ Cómo ejecutar o revisar el proyecto
1. **Requisitos previos:** Contar con una instancia activa de **Microsoft SQL Server** y **SQL Server Management Studio (SSMS)** con permisos administrativos suficientes para crear objetos y gestionar seguridad durante las pruebas (sin utilizar credenciales reales o sensibles)[cite: 3, 4].
2. **Preparar la base de datos:** Abrir SSMS y ejecutar el script base de creación de tablas y datos iniciales del caso[cite: 4, 6].
3. **Ejecutar las actividades en orden:**
   1. Script de **Actividad 1** (desencadenantes `INSERT`, `UPDATE`, `DELETE` y pruebas de modificación)[cite: 4, 7].
   2. Script de **Actividad 2** (funciones escalares y de tipo tabla + consultas de consumo)[cite: 4].
   3. Script de **Actividad 3** (cursor sencillo y alternativa basada en conjuntos)[cite: 4].
   4. Script de **Actividad 4** (perfiles, autenticación, usuarios, roles, pruebas de acceso y documentación de claves/certificados)[cite: 4].
4. **Revisar evidencias:** Contrastar las salidas en las pestañas *Resultados* y *Mensajes* de SSMS con las capturas y comprobaciones registradas en el repositorio[cite: 3, 6, 7].

---

## 📷 Evidencias

### 1. Datos base de clientes, productos y operaciones en SQL Server
Consulta inicial de registros en las tablas de clientes (`ClienteID`, `NombreCompleto`, `Correo`, `EstadoActive`/`EstadoActivo`), productos (`ProductoID`, `NombreProducto`, `PrecioUnitario`, `StockActual`) y operaciones (`OperacionID`, `ClienteID`, `ProductoID`, `Cantidad`, `TotalOperacion`, `FechaOperacion`)[cite: 6]:

<img width="758" height="738" alt="Datos base de clientes, productos y operaciones en SQL Server" src="https://github.com/user-attachments/assets/a637e552-bc79-4b43-9072-8f1a56a1aafa" />

### 2. Pruebas de desencadenantes (`INSERT`, `UPDATE`, `DELETE`) y tabla de auditoría
Ejecución de operaciones sobre `ProductoID = 3` (*Monitor 24 Pulgadas*) mostrando la actualización del `StockActual` y el registro automático en la tabla de auditoría (`TipoCambio`: `INSERT`, `UPDATE`, `DELETE`, `CantidadAnterior`, `CantidadNueva`, `DescripcionCambio`, `FechaCambio`)[cite: 7]:

<img width="212" height="95" alt="Pruebas de desencadenantes INSERT, UPDATE y DELETE con auditoría" src="https://github.com/user-attachments/assets/c6180bd1-61e3-4703-91be-b57004082a67" />

> *Nota:* Agrega aquí las capturas o diagramas adicionales correspondientes a las **Actividades 2, 3 y 4** (funciones escalares y de tabla, ejecución de cursor vs. consulta basada en conjuntos, y pruebas de usuarios, roles y seguridad)[cite: 3, 4, 5].

---

## 📚 Conclusiones
* **Automatización confiable con desencadenantes:** El uso de triggers para `INSERT`, `UPDATE` y `DELETE` apoyados en `inserted` y `deleted` permite reaccionar automáticamente ante cambios en las operaciones, mantener coherente el stock y dejar trazabilidad en auditoría desde el lado del servidor[cite: 2, 4, 7].
* **Reutilización y diseño adecuado de funciones:** Las funciones escalares resultan idóneas para devolver un único valor calculado, mientras que las funciones de tipo tabla son apropiadas para encapsular conjuntos de filas reutilizables dentro de consultas[cite: 2, 4].
* **Evaluación crítica de cursores:** Aunque un cursor permite recorrer registros de forma individual, las operaciones basadas en conjuntos suelen ser más eficientes y declarativas en SQL Server; el cursor debe reservarse para escenarios donde el procesamiento fila a fila esté técnicamente justificado[cite: 2, 4].
* **Seguridad basada en el principio de menor privilegio:** Definir perfiles, autenticación adecuada, usuarios y roles restringidos a las tareas de cada rol —junto con la comprensión de claves y certificados— fortalece la protección y gobernabilidad de la base de datos[cite: 2, 4].

---

## 🎥 Video de exposición
Video público de YouTube: https://www.youtube.com/watch?v=yU1Ku83QVlw[cite: 3, 5]
