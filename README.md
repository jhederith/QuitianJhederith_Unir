<!-- Refencias en el trabajo escrito -->
<h1 align="center">⚡️ Simulación y Optimización en un Procesador Escalar Segmentado ⚡️</h1>

<p align="center">
  <img src="https://img.shields.io/badge/Assembler-MIPS-blue?style=for-the-badge&logo=assemblyscript" alt="MIPS">
  <img src="https://img.shields.io/badge/Simulator-MARS-orange?style=for-the-badge" alt="MARS">
  <img src="https://img.shields.io/badge/Language-Assembly-green?style=for-the-badge&logo=gnu" alt="Assembly">
</p>

---

## 📖 Descripción

Este repositorio contiene programas en **Lenguaje Ensamblador MIPS**, desarrollados para **simular y optimizar** la ejecución en un **procesador escalar segmentado**.  
Su propósito es apoyar el aprendizaje en arquitectura de computadores y optimización de bajo nivel.

---

## 📂 Scripts incluidos

🔹 **`QuitianJhederith_Mayor.asm`** → Encuentra el **número mayor** en una lista de 3 a 5 números ingresados por el usuario.  

🔹 **`QuitianJhederith_Menor.asm`** → Encuentra el **número menor** en una lista de 3 a 5 números ingresados por el usuario.  

🔹 **`QuitianJhederith_Fibonacci.asm`** → Genera la **serie de Fibonacci** hasta *n* términos y calcula la **suma total** de dichos términos.  

---

## 🛠️ Herramientas utilizadas

- **[MARS]([http://courses.missouristate.edu/KenVollmar/MARS/](https://computerscience.missouristate.edu/mars-mips-simulator.htm))** → Simulador para escribir, ensamblar y ejecutar código **MIPS**.  
- **Java (8 o superior)** → Requerido para ejecutar **MARS**.  

---

## 📁 Estructura del repositorio  

```bash
/
├── QuitianJhederith_Mayor.asm
├── QuitianJhederith_Menor.asm
├── QuitianJhederith_Fibonacci.asm
└── README.md

---

## 📝 Test Report

This report summarizes the tests performed on the MIPS assembly programs in this repository.

**Testing Environment:**
*   Simulator: MARS 4.5
*   Java Version: OpenJDK 21.0.8

**Test Results:**

All tests passed successfully. The programs behave as expected.

### 1. `QuitianJhederith_Mayor.asm`

This program finds the largest number in a list of 3 to 5 numbers.

| Test Case                      | Input                               | Expected Output            | Actual Output              | Result |
| ------------------------------ | ----------------------------------- | -------------------------- | -------------------------- | ------ |
| 3 numbers, positive            | 3, 5, 10, 2                         | "El número mayor es: 10"   | "El número mayor es: 10"   | Pass   |
| 4 numbers, negative and zero   | 4, -1, -5, 0, -2                    | "El número mayor es: 0"    | "El número mayor es: 0"    | Pass   |
| 5 numbers, positive            | 5, 100, 50, 200, 10, 150            | "El número mayor es: 200"  | "El número mayor es: 200"  | Pass   |

### 2. `QuitianJhederith_Menor.asm`

This program finds the smallest number in a list of 3 to 5 numbers.

| Test Case                      | Input                               | Expected Output            | Actual Output              | Result |
| ------------------------------ | ----------------------------------- | -------------------------- | -------------------------- | ------ |
| 3 numbers, positive            | 3, 5, 10, 2                         | "El número menor es: 2"    | "El número menor es: 2"    | Pass   |
| 4 numbers, negative and zero   | 4, -1, -5, 0, -2                    | "El número menor es: -5"   | "El número menor es: -5"   | Pass   |
| 5 numbers, positive            | 5, 100, 50, 200, 10, 150            | "El número menor es: 10"   | "El número menor es: 10"   | Pass   |

### 3. `QuitianJhederith_Fibonacci.asm`

This program generates the Fibonacci series and calculates the sum of its terms.

| Test Case | Input | Expected Output                                        | Actual Output                                          | Result |
| --------- | ----- | ------------------------------------------------------ | ------------------------------------------------------ | ------ |
| n = 5     | 5     | "Serie Fibonacci: 0 1 1 2 3\nSuma total: 7"            | "Serie Fibonacci: 0 1 1 2 3\nSuma total: 7"            | Pass   |
| n = 10    | 10    | "Serie Fibonacci: 0 1 1 2 3 5 8 13 21 34\nSuma total: 88" | "Serie Fibonacci: 0 1 1 2 3 5 8 13 21 34\nSuma total: 88" | Pass   |
| n = 1     | 1     | "Serie Fibonacci: 0\nSuma total: 0"                      | "Serie Fibonacci: 0\nSuma total: 0"                      | Pass   |

