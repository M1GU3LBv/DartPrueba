import 'dart:io';

class Candidato {
  String nombre;
  Map<String, int> votosPorZona;

  Candidato(this.nombre)
      : votosPorZona = {'Zona A': 0, 'Zona B': 0, 'Zona C': 0, 'Zona D': 0};

  int get totalVotos {
    return votosPorZona.values.reduce((sum, votes) => sum + votes);
  }

  @override
  String toString() {
    return 'Nombre: $nombre, Votos por Zona: $votosPorZona, Total de Votos: $totalVotos';
  }
}

void main() {
  Candidato candidato1 = Candidato('Juan Pérez');
  Candidato candidato2 = Candidato('María López');

  Map<int, Candidato> candidatos = {
    1: candidato1,
    2: candidato2,
  };

  while (true) {
    print("Candidatos:");
    print("------------------------------------------");
    for (var entry in candidatos.entries) {
      print("${entry.key}. ${entry.value.nombre}");
    }

    print("\nIngrese el número del candidato (1 o 2) o '0' para salir:");
    String? input = stdin.readLineSync();

    if (input == '0') {
      break;
    }

    int? numeroCandidato = int.tryParse(input ?? '');

    if (numeroCandidato != null && candidatos.containsKey(numeroCandidato)) {
      print("Seleccione la zona (A, B, C o D):");
      String? zona = stdin.readLineSync()?.toUpperCase() ?? '';
      if (candidatos[numeroCandidato]!.votosPorZona.containsKey('Zona $zona')) {
        candidatos[numeroCandidato]!.votosPorZona['Zona $zona'] = 1;
        print(
            "Voto registrado para ${candidatos[numeroCandidato]!.nombre} en la Zona $zona.");
      } else {
        print("Zona no válida.");
      }
    } else {
      print("Número de candidato no válido. Intente de nuevo.");
    }

    print("\nResultados actuales:");
    print("------------------------------------------");
    for (var candidato in candidatos.values) {
      print(candidato);
    }
  }
}
