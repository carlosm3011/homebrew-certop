# homebrew-certop

Tap de Homebrew para [certop](https://github.com/carlosm3011/certop): una
herramienta de linea de comandos para ver el estado de los certificados TLS de
una flota de servidores.

```sh
brew tap carlosm3011/certop
brew install certop
```

O en un solo paso:

```sh
brew install carlosm3011/certop/certop
```

La formula **compila desde la fuente**, no baja un binario. Eso trae dos cosas:
funciona igual en Apple Silicon y en Mac Intel (el proyecto solo publica binario
`darwin/arm64`), y el resultado nunca pasa por Gatekeeper, asi que no aparece el
aviso de "no se puede verificar el desarrollador" que si da el binario suelto
bajado con el navegador.

Para actualizar la formula cuando sale una release nueva, en el repo de certop:

```sh
scripts/brew-formula.sh v1.3.1
```

y pegar el resultado en `Formula/certop.rb`.
