import 'dart:io';

class Articulo {
  int codigo;
  int existencias;
  double costo;
  double precio;
  int unidadesVendidas;

  Articulo(this.codigo, this.existencias, this.costo, this.precio,
      this.unidadesVendidas);

  double getSaldo() {
    return existencias * costo;
  }

  double getValorVenta() {
    return unidadesVendidas * precio;
  }
}

void main() {
  List<Articulo> inventario = [];

  while (true) {
    print("Menú:");
    print("1. Listar Artículos Actuales");
    print("2. Agregar Nuevo Artículo");
    print("0. Salir");

    print("Seleccione una opción: ");
    String opcion = stdin.readLineSync() ?? '';

    switch (opcion) {
      case '1':
        listarArticulos(inventario);
        break;
      case '2':
        agregarArticulo(inventario);
        break;
      case '0':
        return;
      default:
        print("Opción no válida. Intente de nuevo.");
        break;
    }
  }
}

void listarArticulos(List<Articulo> inventario) {
  if (inventario.isEmpty) {
    print("El inventario está vacío.");
  } else {
    print("\nDetalles del Inventario");
    print("------------------------");
    for (var articulo in inventario) {
      double saldo = articulo.getSaldo();
      double valorVenta = articulo.getValorVenta();
      print("Código: ${articulo.codigo}");
      print("Existencias: ${articulo.existencias}");
      print("Costo: \$${articulo.costo}");
      print("Precio de Venta: \$${articulo.precio}");
      print("Unidades Vendidas: ${articulo.unidadesVendidas}");
      print("Saldo: \$${saldo.toStringAsFixed(2)}");
      print("Valor de Venta: \$${valorVenta.toStringAsFixed(2)}");
      print("------------------------");
    }
  }
}

void agregarArticulo(List<Articulo> inventario) {
  print("\nIngrese el código del artículo: ");
  int codigo = int.parse(stdin.readLineSync() ?? '0');

  print("Ingrese las existencias del artículo: ");
  int existencias = int.parse(stdin.readLineSync() ?? '0');

  print("Ingrese el costo del artículo: ");
  double costo = double.parse(stdin.readLineSync() ?? '0');

  print("Ingrese el precio de venta del artículo: ");
  double precio = double.parse(stdin.readLineSync() ?? '0');

  print("Ingrese las unidades vendidas del artículo: ");
  int unidadesVendidas = int.parse(stdin.readLineSync() ?? '0');

  Articulo articulo =
      Articulo(codigo, existencias, costo, precio, unidadesVendidas);
  inventario.add(articulo);
  print("Artículo agregado al inventario.");
}
