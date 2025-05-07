# 🚀 Auto Git: Automatiza tus subidas a GitHub

Desarrollando mis scripts de **ciberseguridad**, me di cuenta de que el proceso de subirlos a GitHub podía volverse **tedioso y repetitivo**. Cada vez que quería guardar mis avances o compartir un proyecto, tenía que seguir una serie de pasos manuales: crear el repositorio, inicializar Git, hacer el primer commit, configurar el remoto y finalmente hacer el push. Todo eso me hacía perder tiempo que podría haber invertido en el desarrollo de nuevas herramientas o soluciones.

Por eso nace **auto_git.sh**, un script en Bash que te permite automatizar todo el proceso de subida de tus proyectos a GitHub con un solo comando.

---

## 🛠️ ¿Qué hace este script?

- Crea un nuevo repositorio local con Git.
- Añade tu script automáticamente y lo prepara para el primer commit.
- Te pregunta si deseas incluir un `README.md` y/o una licencia MIT.
- Te permite elegir si el repositorio será público o privado.
- Crea automáticamente el repositorio remoto en GitHub usando tu token.
- Realiza el push inicial con tu código ya subido.
- Elimina el archivo original si deseas evitar duplicados.

---

## ⚙️ Uso

```bash
./auto_git.sh <archivo_script.sh>
```

El script te irá guiando paso a paso:

1. Introduce el nombre del repositorio.
2. Escribe una descripción opcional.
3. Selecciona la visibilidad (público o privado).
4. Decide si deseas incluir un `README.md` o una licencia MIT.
5. El script crea todo y sube el código por ti.

---

## 🧪 Requisitos

- Tener Git instalado y configurado.
- Tener `curl` disponible.
- Haber generado un **GitHub Personal Access Token (PAT)** con permisos para crear repositorios.

---

## 🛡️ Aviso

Este script es solo para fines educativos y de productividad. Asegúrate de usarlo con tus propios archivos y respetar siempre las políticas de GitHub.

---

## 📎 Enlaces

- 🐈‍⬛ GitHub: [https://github.com/manu7l/auto_git](https://github.com/manu7l/auto_git)
- 📸 Instagram: [https://lnkd.in/guQiXy6G](https://lnkd.in/guQiXy6G)

---

## 🤝 Contribuye

Si tienes ideas para mejorar este script o quieres adaptarlo a tu flujo de trabajo, ¡haz un fork y envía tu pull request!

---

## 📢 Comparte

¿Te ha sido útil? ¡Compártelo con tu red y ayuda a otros desarrolladores a automatizar su flujo de trabajo!

---

#Ciberseguridad #Automatización #Git #GitHub #Bash #Productividad #HackingEtico
