data "genesyscloud_auth_division_home" "home" {}

data "genesyscloud_business_rules_schema" "matrice_strategie_identification_demande" {
  name = "Schema_MatriceStrategieIdentificationDemande"
}

locals {
  csv_matrice_strategie_identification_demande = csvdecode(file("${path.module}/csv/DT_IdentDemande.csv"))


}

resource "genesyscloud_business_rules_decision_table" "matrice_identification_demande" {
  name        = "Matrice Strategie Identification Demande"
  description = "Matrice Strategie Identification Demande"
  division_id = data.genesyscloud_auth_division_home.home.id
  schema_id   = data.genesyscloud_business_rules_schema.matrice_strategie_identification_demande.id

  columns {
    inputs {
      defaults_to {
        special = "Wildcard"
      }
      expression {
        contractual {
          schema_property_key = "Domaine"
        }
        comparator = "Equals"
      }
    }
    inputs {
      defaults_to {
        special = "Wildcard"
      }
      expression {
        contractual {
          schema_property_key = "Demande"
        }
        comparator = "Equals"
      }
    }

    dynamic "inputs" {
      for_each = toset(compact(distinct(local.csv_matrice_strategie_identification_demande[*].Operateur_SousDomaine)))
      content {
        defaults_to {
          special = "Wildcard"
        }
        expression {
          contractual {
            schema_property_key = "SousDomaine"
          }
          comparator = inputs.value == "!=" ? "NotEquals" : inputs.value == "Commence Par" ? "StartsWith" : inputs.value == "Contient" ? "Contains" : inputs.value == "=" ? "Equals" : "Equals"
        }
      }
    }

    dynamic "inputs" {
      for_each = toset(compact(distinct(local.csv_matrice_strategie_identification_demande[*].Operateur_SousDemande)))
      content {
        defaults_to {
          special = "Wildcard"
        }
        expression {
          contractual {
            schema_property_key = "SousDemande"
          }
          comparator = inputs.value == "!=" ? "NotEquals" : inputs.value == "Commence Par" ? "StartsWith" : inputs.value == "Contient" ? "Contains" : inputs.value == "=" ? "Equals" : "Equals"
        }
      }
    }

    dynamic "inputs" {
      for_each = toset(compact(distinct(local.csv_matrice_strategie_identification_demande[*].Operateur_Produit)))
      content {
        defaults_to {
          special = "Wildcard"
        }
        expression {
          contractual {
            schema_property_key = "Produit"
          }
          comparator = inputs.value == "!=" ? "NotEquals" : inputs.value == "Commence Par" ? "StartsWith" : inputs.value == "Contient" ? "Contains" : inputs.value == "=" ? "Equals" : "Equals"
        }
      }
    }

    inputs {
      defaults_to {
        special = "Wildcard"
      }
      expression {
        contractual {
          schema_property_key = "CanalOrigine"
        }
        comparator = "Equals"
      }
    }

    inputs {
      defaults_to {
        special = "Wildcard"
      }
      expression {
        contractual {
          schema_property_key = "CanalContact"
        }
        comparator = "Equals"
      }
    }

    inputs {
      defaults_to {
        special = "Wildcard"
      }
      expression {
        contractual {
          schema_property_key = "CanalSource"
        }
        comparator = "Equals"
      }
    }

    inputs {
      defaults_to {
        special = "Wildcard"
      }
      expression {
        contractual {
          schema_property_key = "CodeFlux"
        }
        comparator = "Equals"
      }
    }

    inputs {
      defaults_to {
        special = "Wildcard"
      }
      expression {
        contractual {
          schema_property_key = "MarqueDistributrice"
        }
        comparator = "Equals"
      }
    }

    inputs {
      defaults_to {
        special = "Wildcard"
      }
      expression {
        contractual {
          schema_property_key = "TypeInterlocuteur"
        }
        comparator = "Equals"
      }

    }

    dynamic "inputs" {
      for_each = toset(compact(distinct(local.csv_matrice_strategie_identification_demande[*].Operateur_Marche)))
      content {
        defaults_to {
          special = "Wildcard"
        }
        expression {
          contractual {
            schema_property_key = "Marche"
          }
          comparator = inputs.value == "!=" ? "NotEquals" : inputs.value == "Commence Par" ? "StartsWith" : inputs.value == "Contient" ? "Contains" : inputs.value == "=" ? "Equals" : "Equals"
        }
      }
    }

    inputs {
      defaults_to {
        special = "Wildcard"
      }
      expression {
        contractual {
          schema_property_key = "TypeClient"
        }
        comparator = "Equals"
      }
    }

    dynamic "inputs" {
      for_each = toset(compact(distinct(local.csv_matrice_strategie_identification_demande[*].Operateur_Mode_Acquisition)))
      content {
        defaults_to {
          special = "Wildcard"
        }
        expression {
          contractual {
            schema_property_key = "ModeAcquisition"
          }
          comparator = inputs.value == "!=" ? "NotEquals" : inputs.value == "Commence Par" ? "StartsWith" : inputs.value == "Contient" ? "Contains" : inputs.value == "=" ? "Equals" : "Equals"
        }
      }
    }

    inputs {
      defaults_to {
        special = "Wildcard"
      }
      expression {
        contractual {
          schema_property_key = "ModuleIdentificationClient"
        }
        comparator = "Equals"
      }
    }
    outputs {
      defaults_to {
        special = "Null"
      }
      value {
        schema_property_key = "StrategieIdentification"
      }
    }
  }

  dynamic "rows" {
    for_each = local.csv_matrice_strategie_identification_demande
    content {
      inputs {
        literal {
          value = !strcontains(rows.value["Domaine"], "(*)") ? rows.value["Domaine"] : ""
          type  = !strcontains(rows.value["Domaine"], "(*)") && rows.value["Domaine"] != "" ? "string" : ""
        }
      }
      inputs {
        literal {
          value = !strcontains(rows.value["Demande"], "(*)") ? rows.value["Demande"] : ""
          type  = !strcontains(rows.value["Demande"], "(*)") && rows.value["Demande"] != "" ? "string" : ""
        }
      }
      dynamic "inputs" {
        for_each = toset(compact(distinct(local.csv_matrice_strategie_identification_demande[*].Operateur_SousDomaine)))
        content {
          literal {
            value = inputs.value == rows.value["Operateur_SousDomaine"] && !strcontains(rows.value["SousDomaine"], "(*)") ? rows.value["SousDomaine"] : ""
            type  = inputs.value == rows.value["Operateur_SousDomaine"] && !strcontains(rows.value["SousDomaine"], "(*)") && rows.value["SousDomaine"] != "" ? "string" : ""
          }
        }
      }
      dynamic "inputs" {
        for_each = toset(compact(distinct(local.csv_matrice_strategie_identification_demande[*].Operateur_SousDemande)))
        content {
          literal {
            value = inputs.value == rows.value["Operateur_SousDemande"] && !strcontains(rows.value["SousDemande"], "(*)") ? rows.value["SousDemande"] : ""
            type  = inputs.value == rows.value["Operateur_SousDemande"] && !strcontains(rows.value["SousDemande"], "(*)") && rows.value["SousDemande"] != "" ? "string" : ""
          }
        }
      }
      dynamic "inputs" {
        for_each = toset(compact(distinct(local.csv_matrice_strategie_identification_demande[*].Operateur_Produit)))
        content {
          literal {
            value = inputs.value == rows.value["Operateur_Produit"] && !strcontains(rows.value["Produit"], "(*)") ? rows.value["Produit"] : ""
            type  = inputs.value == rows.value["Operateur_Produit"] && !strcontains(rows.value["Produit"], "(*)") && rows.value["Produit"] != "" ? "string" : ""
          }
        }
      }
      inputs {
        literal {
          value = !strcontains(rows.value["canal origine"], "(*)") ? rows.value["canal origine"] : ""
          type  = rows.value["canal origine"] != "" && !strcontains(rows.value["canal origine"], "(*)") ? "string" : ""
        }
      }
      inputs {
        literal {
          value = !strcontains(rows.value["canal contact"], "(*)") ? rows.value["canal contact"] : ""
          type  = rows.value["canal contact"] != "" && !strcontains(rows.value["canal contact"], "(*)") ? "string" : ""
        }
      }
      inputs {
        literal {
          value = !strcontains(rows.value["canal source"], "(*)") ? rows.value["canal source"] : ""
          type  = rows.value["canal source"] != "" && !strcontains(rows.value["canal source"], "(*)") ? "string" : ""
        }
      }
      inputs {
        literal {
          value = !strcontains(rows.value["code flux"], "(*)") ? rows.value["code flux"] : ""
          type  = rows.value["code flux"] != "" && !strcontains(rows.value["code flux"], "(*)") ? "string" : ""
        }
      }
      inputs {
        literal {
          value = !strcontains(rows.value["Marque distributrice"], "(*)") ? rows.value["Marque distributrice"] : ""
          type  = !strcontains(rows.value["Marque distributrice"], "(*)") && rows.value["Marque distributrice"] != "" ? "string" : ""
        }
      }
      inputs {
        literal {
          value = !strcontains(rows.value["Type interlocuteur"], "(*)") ? rows.value["Type interlocuteur"] : ""
          type  = !strcontains(rows.value["Type interlocuteur"], "(*)") && rows.value["Type interlocuteur"] != "" ? "string" : ""
        }
      }
      dynamic "inputs" {
        for_each = toset(compact(distinct(local.csv_matrice_strategie_identification_demande[*].Operateur_Marche)))
        content {
          literal {
            value = inputs.value == rows.value["Operateur_Marche"] && !strcontains(rows.value["Marche"], "(*)") ? rows.value["Marche"] : ""
            type  = inputs.value == rows.value["Operateur_Marche"] && !strcontains(rows.value["Marche"], "(*)") && rows.value["Marche"] != "" ? "string" : ""
          }
        }
      }
      inputs {
        literal {
          value = !strcontains(rows.value["Type de client"], "(*)") ? rows.value["Type de client"] : ""
          type  = rows.value["Type de client"] != "" && !strcontains(rows.value["Type de client"], "(*)") ? "string" : ""
        }
      }
      dynamic "inputs" {
        for_each = toset(compact(distinct(local.csv_matrice_strategie_identification_demande[*].Operateur_Mode_Acquisition)))
        content {
          literal {
            value = inputs.value == rows.value["Operateur_Mode_Acquisition"] && !strcontains(rows.value["Mode Acquisition"], "(*)") ? rows.value["Mode Acquisition"] : ""
            type  = inputs.value == rows.value["Operateur_Mode_Acquisition"] && !strcontains(rows.value["Mode Acquisition"], "(*)") && rows.value["Mode Acquisition"] != "" ? "string" : ""
          }
        }
      }
      inputs {
        literal {
          value = !strcontains(rows.value["Module identification du client"], "(*)") ? rows.value["Module identification du client"] : ""
          type  = rows.value["Module identification du client"] != "" && !strcontains(rows.value["Module identification du client"], "(*)") ? "string" : ""
        }
      }
      outputs {
        literal {
          value = rows.value["Strategie Ident Demande"]
          type  = rows.value["Strategie Ident Demande"] != "" ? "string" : ""
        }
      }
    }
  }
}
