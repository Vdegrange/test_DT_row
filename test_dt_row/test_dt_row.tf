data "genesyscloud_auth_division_home" "home" {}

data "genesyscloud_business_rules_schema" "matrice_strategie_identification_demande" {
  name = "Schema_MatriceStrategieIdentificationDemande"
}

data "genesyscloud_architect_datatable" "msg_info" {
  name     = "App_MsgInfo"
}

locals {
  csv_matrice_strategie_identification_demande = csvdecode(file("${path.module}/csv/DT_IdentDemande.csv"))
  # csv_app_ent_sup_parametrage_bot_row  = csvdecode(file("${path.module}/csv/DT_App_ENT_SUP_ParametrageBot.csv"))
  # list_app_ent_sup_parametrage_bot_row = { for row in local.csv_app_ent_sup_parametrage_bot : row.EntiteBot => row... }

  # csv_app_ent_sup_stock_distribution_exc_row  = csvdecode(file("${path.module}/csv/DT_App_ENT_SUP_StockDistributionExc.csv"))
  # list_app_ent_sup_stock_distribution_exc_row = { for row in local.csv_app_ent_sup_stock_distribution_exc : row.EntiteIntention=> row... }

  # csv_app_ent_sup_stock_distribution_ouverture_row  = csvdecode(file("${path.module}/csv/DT_App_ENT_SUP_StockDistributionOuverture.csv"))
  # list_app_ent_sup_stock_distribution_ouverture_row = { for row in local.csv_app_ent_sup_stock_distribution_ouverture : row.StockDistribution => row... }


  #   csv_app_intentionclimatique  = csvdecode(file("${path.module}/csv/DT_App_IntentionClimatique.csv"))
  #   list_app_intentionclimatique = { for row in local.csv_app_intentionclimatique : row.Intention => row }

  #   csv_app_lignecollaborateur  = csvdecode(file("${path.module}/csv/DT_App_LigneCollaborateur.csv"))
  #   list_app_lignecollaborateur = { for row in local.csv_app_lignecollaborateur : row.MoyenDeContact => row }

  #   csv_app_menuqualificationintention  = csvdecode(file("${path.module}/csv/DT_App_MenuQualificationIntention.csv"))
  #   list_app_menuqualificationintention = { for row in local.csv_app_menuqualificationintention : row.Menu => row }

  #   csv_app_messageclimatique  = csvdecode(file("${path.module}/csv/DT_App_MsgClimatique.csv"))
  #   list_app_messageclimatique = { for row in local.csv_app_messageclimatique : row.ModeAcquisition => row }

  #   csv_app_messagedynamique  = csvdecode(file("${path.module}/csv/DT_App_MsgDynamique.csv"))
  #   list_app_messagedynamique = { for row in local.csv_app_messagedynamique : row.CodeFlux => row }

    csv_app_messageinfo  = csvdecode(file("${path.module}/csv/DT_App_Msg_Info.csv"))
    list_app_messageinfo = { for row in local.csv_app_messageinfo : row.MoyenDeContact => row }

  #   csv_app_pointdecontact  = csvdecode(file("${path.module}/csv/DT_App_PointDeContact.csv"))
  #   list_app_pointdecontact = { for row in local.csv_app_pointdecontact : row.MoyenDeContact => row }

  #   csv_app_stockdistribution  = csvdecode(file("${path.module}/csv/DT_App_StockDistribution.csv"))
  #   list_app_stockdistribution = { for row in local.csv_app_stockdistribution : row.StockDistribution => row }

  #   csv_app_stockdistributionbot  = csvdecode(file("${path.module}/csv/DT_App_StockDistributionBot.csv"))
  #   list_app_stockdistributionbot = { for row in local.csv_app_stockdistributionbot : row.EntiteIntention => row }

  #   csv_app_strategieacquisitioncontexte  = csvdecode(file("${path.module}/csv/DT_App_StrategieAcquisitionContexte.csv"))
  #   list_app_strategieacquisitioncontexte = { for row in local.csv_app_strategieacquisitioncontexte : row.CodeFlux => row }

  #   csv_app_strategieidentificationclient  = csvdecode(file("${path.module}/csv/DT_App_StrategieIdentificationClient.csv"))
  #   list_app_strategieidentificationclient = { for row in local.csv_app_strategieidentificationclient : row.StrategieIdentification => row }

  #   csv_app_strategieidentificationdemande  = csvdecode(file("${path.module}/csv/DT_App_StrategieIdentificationDemande.csv"))
  #   list_app_strategieidentificationdemande = { for row in local.csv_app_strategieidentificationdemande : row.StrategieIdentification => row }

  #   csv_app_strategiequalificationintention  = csvdecode(file("${path.module}/csv/DT_App_StrategieQualificationIntention.csv"))
  #   list_app_strategiequalificationintention = { for row in local.csv_app_strategiequalificationintention : row.StrategieQualification => row }

  #   test = "mam-jazz"

}

# resource "genesyscloud_architect_datatable_row" "ent_sup_parametrage_bot" {
#   for_each     = local.list_app_ent_sup_parametrage_bot_row
#   datatable_id = genesyscloud_architect_datatable.ent_sup_parametrage_bot[each.value[0].EntiteSup].id
#   key_value    = each.value[length(each.value) - 1].EntiteBot
#   properties_json = jsonencode({
#     "${genesyscloud_architect_datatable.ent_sup_parametrage_bot[each.value[length(each.value) - 1].EntiteSup].properties[1].name}" = each.value[length(each.value) - 1].ActifHO != "" ? tobool(lower("${each.value[length(each.value) - 1].ActifHO}")) : false
#     "${genesyscloud_architect_datatable.ent_sup_parametrage_bot[each.value[length(each.value) - 1].EntiteSup].properties[2].name}" = each.value[length(each.value) - 1].ActifHNO != "" ? tobool(lower("${each.value[length(each.value) - 1].ActifHNO}")) : false
#     "${genesyscloud_architect_datatable.ent_sup_parametrage_bot[each.value[length(each.value) - 1].EntiteSup].properties[3].name}" = each.value[length(each.value) - 1].SeuilEWTHO != "" ? tonumber("${each.value[length(each.value) - 1].SeuilEWTHO}") : 0
#     "${genesyscloud_architect_datatable.ent_sup_parametrage_bot[each.value[length(each.value) - 1].EntiteSup].properties[4].name}" = each.value[length(each.value) - 1].ActivationPropositionBot != "" ? tobool(lower("${each.value[length(each.value) - 1].ActivationPropositionBot}")) : false
#   })
# }

# # resource "genesyscloud_architect_datatable_row" "ent_sup_stock_distribution_exc" {
# #   for_each     = local.list_app_ent_sup_stock_distribution_exc_row
# #   datatable_id = genesyscloud_architect_datatable.ent_sup_stock_distribution_exc[each.value[0].EntiteSup].id
# #   key_value    = each.value[length(each.value) - 1].EntiteIntention
# #   properties_json = jsonencode({
# #     "${genesyscloud_architect_datatable.ent_sup_stock_distribution_exc[each.value[length(each.value) - 1].EntiteSup].properties[1].name}" = each.value[length(each.value) - 1].InterrupteurExceptionnel != "" ? tobool(lower("${each.value[length(each.value) - 1].InterrupteurExceptionnel}")) : false
# #     "${genesyscloud_architect_datatable.ent_sup_stock_distribution_exc[each.value[length(each.value) - 1].EntiteSup].properties[2].name}" = each.value[length(each.value) - 1].QuestionExceptionnelle
# #   })
# # }

# resource "genesyscloud_architect_datatable_row" "ent_sup_stock_distribution_ouverture" {
#   for_each     = local.list_app_ent_sup_stock_distribution_ouverture_row
#   datatable_id = genesyscloud_architect_datatable.ent_sup_stock_distribution_ouverture[each.value[0].EntiteSup].id
#   key_value    = each.value[length(each.value) - 1].StockDistribution
#   properties_json = jsonencode({
#     "${genesyscloud_architect_datatable.ent_sup_stock_distribution_ouverture[each.value[length(each.value) - 1].EntiteSup].properties[1].name}" = each.value[length(each.value) - 1].NumeroCalendrierActif
#     "${genesyscloud_architect_datatable.ent_sup_stock_distribution_ouverture[each.value[length(each.value) - 1].EntiteSup].properties[2].name}" = each.value[length(each.value) - 1].MessageFermeture
#     "${genesyscloud_architect_datatable.ent_sup_stock_distribution_ouverture[each.value[length(each.value) - 1].EntiteSup].properties[3].name}" = each.value[length(each.value) - 1].MessageFermetureExc
#   })
# }

# resource "genesyscloud_architect_datatable_row" "intention_climatique" {
#   for_each = local.list_app_intentionclimatique

#   datatable_id = genesyscloud_architect_datatable.intention_climatique.id
#   key_value    = each.value.Intention
#   properties_json = jsonencode({
#     "${genesyscloud_architect_datatable.intention_climatique.properties[1].name}" = each.value.IntentionClimatique != "" ? tobool(lower("${each.value.IntentionClimatique}")) : false
#   })
# }

# resource "genesyscloud_architect_datatable_row" "ligne_collaborateur" {
#   for_each = local.list_app_lignecollaborateur

#   datatable_id = genesyscloud_architect_datatable.ligne_collaborateur.id
#   key_value    = each.value.MoyenDeContact
#   properties_json = jsonencode({
#     "${genesyscloud_architect_datatable.ligne_collaborateur.properties[1].name}" = each.value.Collaborateur
#   })
# }


# resource "genesyscloud_architect_datatable_row" "menu_qualification_intention" {
#   for_each = local.list_app_menuqualificationintention

#   datatable_id = genesyscloud_architect_datatable.menu_qualification_intention.id
#   key_value    = each.value.Menu
#   properties_json = jsonencode({
#     "${genesyscloud_architect_datatable.menu_qualification_intention.properties[1].name}"  = each.value.MsgMenu
#     "${genesyscloud_architect_datatable.menu_qualification_intention.properties[2].name}"  = each.value.ActivationChoix0 != "" ? tobool(lower("${each.value.ActivationChoix0}")) : false
#     "${genesyscloud_architect_datatable.menu_qualification_intention.properties[3].name}"  = each.value.ListeMotsChoix0
#     "${genesyscloud_architect_datatable.menu_qualification_intention.properties[4].name}"  = each.value.ActionChoix0
#     "${genesyscloud_architect_datatable.menu_qualification_intention.properties[5].name}"  = each.value.MenuChoix0
#     "${genesyscloud_architect_datatable.menu_qualification_intention.properties[6].name}"  = each.value.IntentionChoix0
#     "${genesyscloud_architect_datatable.menu_qualification_intention.properties[7].name}"  = each.value.ActivationChoix1 != "" ? tobool(lower("${each.value.ActivationChoix1}")) : false
#     "${genesyscloud_architect_datatable.menu_qualification_intention.properties[8].name}"  = each.value.ListeMotsChoix1
#     "${genesyscloud_architect_datatable.menu_qualification_intention.properties[9].name}"  = each.value.ActionChoix1
#     "${genesyscloud_architect_datatable.menu_qualification_intention.properties[10].name}" = each.value.MenuChoix1
#     "${genesyscloud_architect_datatable.menu_qualification_intention.properties[11].name}" = each.value.IntentionChoix1
#     "${genesyscloud_architect_datatable.menu_qualification_intention.properties[12].name}" = each.value.ActivationChoix2 != "" ? tobool(lower("${each.value.ActivationChoix2}")) : false
#     "${genesyscloud_architect_datatable.menu_qualification_intention.properties[13].name}" = each.value.ListeMotsChoix2
#     "${genesyscloud_architect_datatable.menu_qualification_intention.properties[14].name}" = each.value.ActionChoix2
#     "${genesyscloud_architect_datatable.menu_qualification_intention.properties[15].name}" = each.value.MenuChoix2
#     "${genesyscloud_architect_datatable.menu_qualification_intention.properties[16].name}" = each.value.IntentionChoix2
#     "${genesyscloud_architect_datatable.menu_qualification_intention.properties[17].name}" = each.value.ActivationChoix3 != "" ? tobool(lower("${each.value.ActivationChoix3}")) : false
#     "${genesyscloud_architect_datatable.menu_qualification_intention.properties[18].name}" = each.value.ListeMotsChoix3
#     "${genesyscloud_architect_datatable.menu_qualification_intention.properties[19].name}" = each.value.ActionChoix3
#     "${genesyscloud_architect_datatable.menu_qualification_intention.properties[20].name}" = each.value.MenuChoix3
#     "${genesyscloud_architect_datatable.menu_qualification_intention.properties[21].name}" = each.value.IntentionChoix3
#     "${genesyscloud_architect_datatable.menu_qualification_intention.properties[22].name}" = each.value.ActivationChoix4 != "" ? tobool(lower("${each.value.ActivationChoix4}")) : false
#     "${genesyscloud_architect_datatable.menu_qualification_intention.properties[23].name}" = each.value.ListeMotsChoix4
#     "${genesyscloud_architect_datatable.menu_qualification_intention.properties[24].name}" = each.value.ActionChoix4
#     "${genesyscloud_architect_datatable.menu_qualification_intention.properties[25].name}" = each.value.MenuChoix4
#     "${genesyscloud_architect_datatable.menu_qualification_intention.properties[26].name}" = each.value.IntentionChoix4
#     "${genesyscloud_architect_datatable.menu_qualification_intention.properties[27].name}" = each.value.ActivationChoix5 != "" ? tobool(lower("${each.value.ActivationChoix5}")) : false
#     "${genesyscloud_architect_datatable.menu_qualification_intention.properties[28].name}" = each.value.ListeMotsChoix5
#     "${genesyscloud_architect_datatable.menu_qualification_intention.properties[29].name}" = each.value.ActionChoix5
#     "${genesyscloud_architect_datatable.menu_qualification_intention.properties[30].name}" = each.value.MenuChoix5
#     "${genesyscloud_architect_datatable.menu_qualification_intention.properties[31].name}" = each.value.IntentionChoix5
#   })
# }

# resource "genesyscloud_architect_datatable_row" "message_climatique" {
#   for_each = local.list_app_messageclimatique

#   datatable_id = genesyscloud_architect_datatable.message_climatique.id
#   key_value    = each.value.ModeAcquisition
#   properties_json = jsonencode({
#     "${genesyscloud_architect_datatable.message_climatique.properties[1].name}" = each.value.Message
#   })
# }

# resource "genesyscloud_architect_datatable_row" "message_dynamique" {
#   for_each = local.list_app_messagedynamique

#   datatable_id = genesyscloud_architect_datatable.message_dynamique.id
#   key_value    = each.value.CodeFlux
#   properties_json = jsonencode({
#     "${genesyscloud_architect_datatable.message_dynamique.properties[1].name}" = each.value.MessageAccueilDynamique
#     "${genesyscloud_architect_datatable.message_dynamique.properties[2].name}" = each.value.MessageAccueilDynamiqueHNO
#     "${genesyscloud_architect_datatable.message_dynamique.properties[3].name}" = each.value.MessageAccueilDynamiqueFermetureExc
#     "${genesyscloud_architect_datatable.message_dynamique.properties[4].name}" = each.value.MessageAccueilDynamiqueClimatique
#     "${genesyscloud_architect_datatable.message_dynamique.properties[5].name}" = each.value.MessageAccueilDynamiqueUrgClimatiqueHO
#     "${genesyscloud_architect_datatable.message_dynamique.properties[6].name}" = each.value.MessageAccueilDynamiqueUrgClimatiqueHNO
#     "${genesyscloud_architect_datatable.message_dynamique.properties[7].name}" = each.value.MessageAccueilDynamiqueSecours
#   })
# }

resource "genesyscloud_architect_datatable_row" "message_info" {
  for_each = local.list_app_messageinfo

  datatable_id = data.genesyscloud_architect_datatable.msg_info.id
  key_value    = each.value.MoyenDeContact
  properties_json = jsonencode({
    "MessageInfo" = each.value.MessageInfo
  })
}

# resource "genesyscloud_architect_datatable_row" "point_de_contact" {
#   for_each = local.list_app_pointdecontact

#   datatable_id = genesyscloud_architect_datatable.point_de_contact.id
#   key_value    = substr(each.value.MoyenDeContact, 0, 1) == "0" ? replace(each.value.MoyenDeContact, "/^0/", "+33") : each.value.MoyenDeContact
#   properties_json = jsonencode({
#     "${genesyscloud_architect_datatable.point_de_contact.properties[1].name}" = each.value.CodeFlux
#     "${genesyscloud_architect_datatable.point_de_contact.properties[2].name}" = each.value.ActivationMsgInfo != "" ? tobool(lower("${each.value.ActivationMsgInfo}")) : false
#     "${genesyscloud_architect_datatable.point_de_contact.properties[3].name}" = each.value.LigneCollaborateur != "" ? tobool(lower("${each.value.LigneCollaborateur}")) : false
#     # "${genesyscloud_architect_datatable.point_de_contact.properties[1].name}" = each.value[0].Code_flux
#     # "${genesyscloud_architect_datatable.point_de_contact.properties[2].name}" = each.value[1].Msg_info != "" ? true : false
#     # "${genesyscloud_architect_datatable.point_de_contact.properties[3].name}" = each.value[2].Collaborateur != "" ? true : false
#   })
# }

# resource "genesyscloud_architect_datatable_row" "stock_distribution" {
#   for_each = local.list_app_stockdistribution

#   datatable_id = genesyscloud_architect_datatable.stock_distribution.id
#   key_value    = each.value.StockDistribution
#   properties_json = jsonencode({
#     "${genesyscloud_architect_datatable.stock_distribution.properties[1].name}"  = each.value.EntiteSupervision
#     "${genesyscloud_architect_datatable.stock_distribution.properties[2].name}"  = each.value.EntiteProprietaire
#     "${genesyscloud_architect_datatable.stock_distribution.properties[3].name}"  = each.value["TypeDistribution_${local.test}"] // each.value["TypeDistribution_${var.environment_name}"]
#     "${genesyscloud_architect_datatable.stock_distribution.properties[4].name}"  = each.value["NumeroExterne_${local.test}"]    // each.value["NumeroExterne_${var.environment_name}"]
#     "${genesyscloud_architect_datatable.stock_distribution.properties[5].name}"  = each.value.CalendrierStock
#     "${genesyscloud_architect_datatable.stock_distribution.properties[6].name}"  = each.value.MessageRoutageStock
#     "${genesyscloud_architect_datatable.stock_distribution.properties[7].name}"  = each.value.MessageFermetureStock
#     "${genesyscloud_architect_datatable.stock_distribution.properties[8].name}"  = each.value.MessageFermetureExcStock
#     "${genesyscloud_architect_datatable.stock_distribution.properties[9].name}"  = each.value.InterrupteurStock != "" ? tobool(lower("${each.value.InterrupteurStock}")) : false
#     "${genesyscloud_architect_datatable.stock_distribution.properties[10].name}" = each.value.DureePreCiblage != "" ? tonumber(each.value.DureePreCiblage) : 0
#     "${genesyscloud_architect_datatable.stock_distribution.properties[11].name}" = each.value.CalendrierPermanence
#     "${genesyscloud_architect_datatable.stock_distribution.properties[12].name}" = each.value.InterrupteurPermanence
#     "${genesyscloud_architect_datatable.stock_distribution.properties[13].name}" = each.value.CalendrierElargissement1
#     "${genesyscloud_architect_datatable.stock_distribution.properties[14].name}" = each.value.InterrupteurElargissement1
#     "${genesyscloud_architect_datatable.stock_distribution.properties[15].name}" = each.value.CalendrierElargissement2
#     "${genesyscloud_architect_datatable.stock_distribution.properties[16].name}" = each.value.InterrupteurElargissement2
#     "${genesyscloud_architect_datatable.stock_distribution.properties[17].name}" = each.value.ActivationCallBackPreCiblage != "" ? tobool(lower("${each.value.ActivationCallBackPreCiblage}")) : false
#     "${genesyscloud_architect_datatable.stock_distribution.properties[18].name}" = each.value.ActivationCallBackNominal != "" ? tobool(lower("${each.value.ActivationCallBackNominal}")) : false
#     "${genesyscloud_architect_datatable.stock_distribution.properties[19].name}" = each.value.DureeCallbackNominal != "" ? tonumber(each.value.DureeCallbackNominal) : 0
#     "${genesyscloud_architect_datatable.stock_distribution.properties[20].name}" = each.value.ModeleAttente
#   })
# }

# resource "genesyscloud_architect_datatable_row" "stock_distribution_bot" {
#   for_each = local.list_app_stockdistributionbot

#   datatable_id = genesyscloud_architect_datatable.stock_distribution_bot.id
#   key_value    = each.value.EntiteIntention
#   properties_json = jsonencode({
#     "${genesyscloud_architect_datatable.stock_distribution_bot.properties[1].name}" = each.value.Bot
#     "${genesyscloud_architect_datatable.stock_distribution_bot.properties[2].name}" = each.value.ActivationDissuasionBotHO != "" ? tobool(lower("${each.value.ActivationDissuasionBotHO}")) : false
#     "${genesyscloud_architect_datatable.stock_distribution_bot.properties[3].name}" = each.value.MessageDissuasionBotHO
#     "${genesyscloud_architect_datatable.stock_distribution_bot.properties[4].name}" = each.value.MessageProposition
#     "${genesyscloud_architect_datatable.stock_distribution_bot.properties[5].name}" = each.value.MessageSansProposition
#   })
# }

# resource "genesyscloud_architect_datatable_row" "strategie_acquisition_contexte" {
#   for_each = local.list_app_strategieacquisitioncontexte

#   datatable_id = genesyscloud_architect_datatable.strategie_acquisition_contexte.id
#   key_value    = each.value.CodeFlux
#   properties_json = jsonencode({
#     "${genesyscloud_architect_datatable.strategie_acquisition_contexte.properties[1].name}"  = each.value.StrategieAcquisition
#     "${genesyscloud_architect_datatable.strategie_acquisition_contexte.properties[2].name}"  = each.value.Calendrier
#     "${genesyscloud_architect_datatable.strategie_acquisition_contexte.properties[3].name}"  = each.value.CalendrierClimatique
#     "${genesyscloud_architect_datatable.strategie_acquisition_contexte.properties[4].name}"  = each.value.CalendrierUrgClimatique
#     "${genesyscloud_architect_datatable.strategie_acquisition_contexte.properties[5].name}"  = each.value.InterrupteurClimatique
#     "${genesyscloud_architect_datatable.strategie_acquisition_contexte.properties[7].name}"  = each.value.InterrupteurSecours
#     "${genesyscloud_architect_datatable.strategie_acquisition_contexte.properties[8].name}"  = each.value.InterrupteurUrgClimatique
#     "${genesyscloud_architect_datatable.strategie_acquisition_contexte.properties[9].name}"  = each.value.stratQualification
#     "${genesyscloud_architect_datatable.strategie_acquisition_contexte.properties[10].name}" = each.value.stratQualificationHNO
#     "${genesyscloud_architect_datatable.strategie_acquisition_contexte.properties[11].name}" = each.value.stratQualificationFermetureExc
#     "${genesyscloud_architect_datatable.strategie_acquisition_contexte.properties[12].name}" = each.value.MessageAccueilStatique
#     "${genesyscloud_architect_datatable.strategie_acquisition_contexte.properties[13].name}" = each.value.MessageAccueilStatiqueHNO
#     "${genesyscloud_architect_datatable.strategie_acquisition_contexte.properties[14].name}" = each.value.MessageAccueilStatiqueClimatique
#     "${genesyscloud_architect_datatable.strategie_acquisition_contexte.properties[15].name}" = each.value.MessageAccueilStatiqueSecours
#     "${genesyscloud_architect_datatable.strategie_acquisition_contexte.properties[16].name}" = each.value.MessageAccueilStatiqueUrgClimatique
#     "${genesyscloud_architect_datatable.strategie_acquisition_contexte.properties[17].name}" = each.value.MessageAccueilStatiqueUrgClimatiqueHNO
#     "${genesyscloud_architect_datatable.strategie_acquisition_contexte.properties[18].name}" = each.value.MessageFermetureSecours
#     "${genesyscloud_architect_datatable.strategie_acquisition_contexte.properties[19].name}" = each.value.CanalOrigine
#     "${genesyscloud_architect_datatable.strategie_acquisition_contexte.properties[20].name}" = each.value.CanalContact
#     "${genesyscloud_architect_datatable.strategie_acquisition_contexte.properties[21].name}" = each.value.CanalSource
#     "${genesyscloud_architect_datatable.strategie_acquisition_contexte.properties[22].name}" = each.value.MarqueDistributrice
#     "${genesyscloud_architect_datatable.strategie_acquisition_contexte.properties[23].name}" = each.value.Intention
#     "${genesyscloud_architect_datatable.strategie_acquisition_contexte.properties[24].name}" = each.value.TypeInterlocuteur
#     "${genesyscloud_architect_datatable.strategie_acquisition_contexte.properties[25].name}" = each.value.TypeClient
#     "${genesyscloud_architect_datatable.strategie_acquisition_contexte.properties[26].name}" = each.value.Marche
#   })
# }

# resource "genesyscloud_architect_datatable_row" "strategie_identification_client" {
#   for_each = local.list_app_strategieidentificationclient

#   datatable_id = genesyscloud_architect_datatable.strategie_identification_client.id
#   key_value    = each.value.StrategieIdentification
#   properties_json = jsonencode({
#     "${genesyscloud_architect_datatable.strategie_identification_client.properties[1].name}"  = each.value.Module1
#     "${genesyscloud_architect_datatable.strategie_identification_client.properties[2].name}"  = each.value.Module2
#     "${genesyscloud_architect_datatable.strategie_identification_client.properties[3].name}"  = each.value.Condition2
#     "${genesyscloud_architect_datatable.strategie_identification_client.properties[4].name}"  = each.value.Module3
#     "${genesyscloud_architect_datatable.strategie_identification_client.properties[5].name}"  = each.value.Condition3
#     "${genesyscloud_architect_datatable.strategie_identification_client.properties[6].name}"  = each.value.Module4
#     "${genesyscloud_architect_datatable.strategie_identification_client.properties[7].name}"  = each.value.Condition4
#     "${genesyscloud_architect_datatable.strategie_identification_client.properties[8].name}"  = each.value.Module5
#     "${genesyscloud_architect_datatable.strategie_identification_client.properties[9].name}"  = each.value.Condition5
#     "${genesyscloud_architect_datatable.strategie_identification_client.properties[10].name}" = each.value.Module6
#     "${genesyscloud_architect_datatable.strategie_identification_client.properties[11].name}" = each.value.Condition6
#   })
# }

# resource "genesyscloud_architect_datatable_row" "strategie_identification_demande" {
#   for_each = local.list_app_strategieidentificationdemande

#   datatable_id = genesyscloud_architect_datatable.strategie_identification_demande.id
#   key_value    = each.value.StrategieIdentification
#   properties_json = jsonencode({
#     "${genesyscloud_architect_datatable.strategie_identification_demande.properties[1].name}"  = each.value.Module1
#     "${genesyscloud_architect_datatable.strategie_identification_demande.properties[2].name}"  = each.value.CollecteModule1
#     "${genesyscloud_architect_datatable.strategie_identification_demande.properties[3].name}"  = each.value.ValidationSaisie1 != "" ? tobool(lower("${each.value.ValidationSaisie1}")) : false
#     "${genesyscloud_architect_datatable.strategie_identification_demande.properties[4].name}"  = each.value.FiltreDomaineModule1
#     "${genesyscloud_architect_datatable.strategie_identification_demande.properties[5].name}"  = each.value.FiltreSousDomaineModule1
#     "${genesyscloud_architect_datatable.strategie_identification_demande.properties[6].name}"  = each.value.FiltreSousDemandeModule1
#     "${genesyscloud_architect_datatable.strategie_identification_demande.properties[7].name}"  = each.value.PlusRecentModule1 != "" ? tobool(lower("${each.value.PlusRecentModule1}")) : false
#     "${genesyscloud_architect_datatable.strategie_identification_demande.properties[8].name}"  = each.value.Module2
#     "${genesyscloud_architect_datatable.strategie_identification_demande.properties[9].name}"  = each.value.CollecteModule2
#     "${genesyscloud_architect_datatable.strategie_identification_demande.properties[10].name}" = each.value.ValidationSaisie2 != "" ? tobool(lower("${each.value.ValidationSaisie2}")) : false
#     "${genesyscloud_architect_datatable.strategie_identification_demande.properties[11].name}" = each.value.FiltreDomaineModule2
#     "${genesyscloud_architect_datatable.strategie_identification_demande.properties[12].name}" = each.value.FiltreSousDomaineModule2
#     "${genesyscloud_architect_datatable.strategie_identification_demande.properties[13].name}" = each.value.FiltreSousDemandeModule2
#     "${genesyscloud_architect_datatable.strategie_identification_demande.properties[14].name}" = each.value.PlusRecentModule2 != "" ? tobool(lower("${each.value.PlusRecentModule2}")) : false
#     "${genesyscloud_architect_datatable.strategie_identification_demande.properties[15].name}" = each.value.Module3
#     "${genesyscloud_architect_datatable.strategie_identification_demande.properties[16].name}" = each.value.CollecteModule3
#     "${genesyscloud_architect_datatable.strategie_identification_demande.properties[17].name}" = each.value.ValidationSaisie3 != "" ? tobool(lower("${each.value.ValidationSaisie3}")) : false
#     "${genesyscloud_architect_datatable.strategie_identification_demande.properties[18].name}" = each.value.FiltreDomaineModule3
#     "${genesyscloud_architect_datatable.strategie_identification_demande.properties[19].name}" = each.value.FiltreSousDomaineModule3
#     "${genesyscloud_architect_datatable.strategie_identification_demande.properties[20].name}" = each.value.FiltreSousDemandeModule3
#     "${genesyscloud_architect_datatable.strategie_identification_demande.properties[21].name}" = each.value.PlusRecentModule3 != "" ? tobool(lower("${each.value.PlusRecentModule3}")) : false
#     "${genesyscloud_architect_datatable.strategie_identification_demande.properties[22].name}" = each.value.Module4
#     "${genesyscloud_architect_datatable.strategie_identification_demande.properties[23].name}" = each.value.CollecteModule4
#     "${genesyscloud_architect_datatable.strategie_identification_demande.properties[24].name}" = each.value.ValidationSaisie4 != "" ? tobool(lower("${each.value.ValidationSaisie4}")) : false
#     "${genesyscloud_architect_datatable.strategie_identification_demande.properties[25].name}" = each.value.FiltreDomaineModule4
#     "${genesyscloud_architect_datatable.strategie_identification_demande.properties[26].name}" = each.value.FiltreSousDomaineModule4
#     "${genesyscloud_architect_datatable.strategie_identification_demande.properties[27].name}" = each.value.FiltreSousDemandeModule4
#     "${genesyscloud_architect_datatable.strategie_identification_demande.properties[28].name}" = each.value.PlusRecentModule4 != "" ? tobool(lower("${each.value.PlusRecentModule4}")) : false
#     "${genesyscloud_architect_datatable.strategie_identification_demande.properties[29].name}" = each.value.Module5
#     "${genesyscloud_architect_datatable.strategie_identification_demande.properties[30].name}" = each.value.CollecteModule5
#     "${genesyscloud_architect_datatable.strategie_identification_demande.properties[31].name}" = each.value.ValidationSaisie5 != "" ? tobool(lower("${each.value.ValidationSaisie5}")) : false
#     "${genesyscloud_architect_datatable.strategie_identification_demande.properties[32].name}" = each.value.FiltreDomaineModule5
#     "${genesyscloud_architect_datatable.strategie_identification_demande.properties[33].name}" = each.value.FiltreSousDomaineModule5
#     "${genesyscloud_architect_datatable.strategie_identification_demande.properties[34].name}" = each.value.FiltreSousDemandeModule5
#     "${genesyscloud_architect_datatable.strategie_identification_demande.properties[35].name}" = each.value.PlusRecentModule5 != "" ? tobool(lower("${each.value.PlusRecentModule5}")) : false
#     "${genesyscloud_architect_datatable.strategie_identification_demande.properties[36].name}" = each.value.Module6
#     "${genesyscloud_architect_datatable.strategie_identification_demande.properties[37].name}" = each.value.CollecteModule6
#     "${genesyscloud_architect_datatable.strategie_identification_demande.properties[38].name}" = each.value.ValidationSaisie6 != "" ? tobool(lower("${each.value.ValidationSaisie6}")) : false
#     "${genesyscloud_architect_datatable.strategie_identification_demande.properties[39].name}" = each.value.FiltreDomaineModule6
#     "${genesyscloud_architect_datatable.strategie_identification_demande.properties[40].name}" = each.value.FiltreSousDomaineModule6
#     "${genesyscloud_architect_datatable.strategie_identification_demande.properties[41].name}" = each.value.FiltreSousDemandeModule6
#     "${genesyscloud_architect_datatable.strategie_identification_demande.properties[42].name}" = each.value.PlusRecentModule6 != "" ? tobool(lower("${each.value.PlusRecentModule6}")) : false
#   })
# }

# resource "genesyscloud_architect_datatable_row" "strategie_qualification_intention" {
#   for_each = local.list_app_strategiequalificationintention

#   datatable_id = genesyscloud_architect_datatable.strategie_qualification_intention.id
#   key_value    = each.value.StrategieQualification
#   properties_json = jsonencode({
#     "${genesyscloud_architect_datatable.strategie_qualification_intention.properties[1].name}" = each.value.LanguageNaturel
#     "${genesyscloud_architect_datatable.strategie_qualification_intention.properties[2].name}" = each.value.MessageAccueilBotLN
#     "${genesyscloud_architect_datatable.strategie_qualification_intention.properties[3].name}" = each.value.DTMF_ASR
#   })
# }


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

  # dynamic "rows" {
  #   for_each = local.csv_matrice_strategie_identification_demande
  #   content {
  #     inputs {
  #       literal {
  #         value = !strcontains(rows.value["Domaine"], "(*)") ? rows.value["Domaine"] : ""
  #         type  = !strcontains(rows.value["Domaine"], "(*)") && rows.value["Domaine"] != "" ? "string" : ""
  #       }
  #     }
  #     inputs {
  #       literal {
  #         value = !strcontains(rows.value["Demande"], "(*)") ? rows.value["Demande"] : ""
  #         type  = !strcontains(rows.value["Demande"], "(*)") && rows.value["Demande"] != "" ? "string" : ""
  #       }
  #     }
  #     dynamic "inputs" {
  #       for_each = toset(compact(distinct(local.csv_matrice_strategie_identification_demande[*].Operateur_SousDomaine)))
  #       content {
  #         literal {
  #           value = inputs.value == rows.value["Operateur_SousDomaine"] && !strcontains(rows.value["SousDomaine"], "(*)") ? rows.value["SousDomaine"] : ""
  #           type  = inputs.value == rows.value["Operateur_SousDomaine"] && !strcontains(rows.value["SousDomaine"], "(*)") && rows.value["SousDomaine"] != "" ? "string" : ""
  #         }
  #       }
  #     }
  #     dynamic "inputs" {
  #       for_each = toset(compact(distinct(local.csv_matrice_strategie_identification_demande[*].Operateur_SousDemande)))
  #       content {
  #         literal {
  #           value = inputs.value == rows.value["Operateur_SousDemande"] && !strcontains(rows.value["SousDemande"], "(*)") ? rows.value["SousDemande"] : ""
  #           type  = inputs.value == rows.value["Operateur_SousDemande"] && !strcontains(rows.value["SousDemande"], "(*)") && rows.value["SousDemande"] != "" ? "string" : ""
  #         }
  #       }
  #     }
  #     dynamic "inputs" {
  #       for_each = toset(compact(distinct(local.csv_matrice_strategie_identification_demande[*].Operateur_Produit)))
  #       content {
  #         literal {
  #           value = inputs.value == rows.value["Operateur_Produit"] && !strcontains(rows.value["Produit"], "(*)") ? rows.value["Produit"] : ""
  #           type  = inputs.value == rows.value["Operateur_Produit"] && !strcontains(rows.value["Produit"], "(*)") && rows.value["Produit"] != "" ? "string" : ""
  #         }
  #       }
  #     }
  #     inputs {
  #       literal {
  #         value = !strcontains(rows.value["canal origine"], "(*)") ? rows.value["canal origine"] : ""
  #         type  = rows.value["canal origine"] != "" && !strcontains(rows.value["canal origine"], "(*)") ? "string" : ""
  #       }
  #     }
  #     inputs {
  #       literal {
  #         value = !strcontains(rows.value["canal contact"], "(*)") ? rows.value["canal contact"] : ""
  #         type  = rows.value["canal contact"] != "" && !strcontains(rows.value["canal contact"], "(*)") ? "string" : ""
  #       }
  #     }
  #     inputs {
  #       literal {
  #         value = !strcontains(rows.value["canal source"], "(*)") ? rows.value["canal source"] : ""
  #         type  = rows.value["canal source"] != "" && !strcontains(rows.value["canal source"], "(*)") ? "string" : ""
  #       }
  #     }
  #     inputs {
  #       literal {
  #         value = !strcontains(rows.value["code flux"], "(*)") ? rows.value["code flux"] : ""
  #         type  = rows.value["code flux"] != "" && !strcontains(rows.value["code flux"], "(*)") ? "string" : ""
  #       }
  #     }
  #     inputs {
  #       literal {
  #         value = !strcontains(rows.value["Marque distributrice"], "(*)") ? rows.value["Marque distributrice"] : ""
  #         type  = !strcontains(rows.value["Marque distributrice"], "(*)") && rows.value["Marque distributrice"] != "" ? "string" : ""
  #       }
  #     }
  #     inputs {
  #       literal {
  #         value = !strcontains(rows.value["Type interlocuteur"], "(*)") ? rows.value["Type interlocuteur"] : ""
  #         type  = !strcontains(rows.value["Type interlocuteur"], "(*)") && rows.value["Type interlocuteur"] != "" ? "string" : ""
  #       }
  #     }
  #     dynamic "inputs" {
  #       for_each = toset(compact(distinct(local.csv_matrice_strategie_identification_demande[*].Operateur_Marche)))
  #       content {
  #         literal {
  #           value = inputs.value == rows.value["Operateur_Marche"] && !strcontains(rows.value["Marche"], "(*)") ? rows.value["Marche"] : ""
  #           type  = inputs.value == rows.value["Operateur_Marche"] && !strcontains(rows.value["Marche"], "(*)") && rows.value["Marche"] != "" ? "string" : ""
  #         }
  #       }
  #     }
  #     inputs {
  #       literal {
  #         value = !strcontains(rows.value["Type de client"], "(*)") ? rows.value["Type de client"] : ""
  #         type  = rows.value["Type de client"] != "" && !strcontains(rows.value["Type de client"], "(*)") ? "string" : ""
  #       }
  #     }
  #     dynamic "inputs" {
  #       for_each = toset(compact(distinct(local.csv_matrice_strategie_identification_demande[*].Operateur_Mode_Acquisition)))
  #       content {
  #         literal {
  #           value = inputs.value == rows.value["Operateur_Mode_Acquisition"] && !strcontains(rows.value["Mode Acquisition"], "(*)") ? rows.value["Mode Acquisition"] : ""
  #           type  = inputs.value == rows.value["Operateur_Mode_Acquisition"] && !strcontains(rows.value["Mode Acquisition"], "(*)") && rows.value["Mode Acquisition"] != "" ? "string" : ""
  #         }
  #       }
  #     }
  #     inputs {
  #       literal {
  #         value = !strcontains(rows.value["Module identification du client"], "(*)") ? rows.value["Module identification du client"] : ""
  #         type  = rows.value["Module identification du client"] != "" && !strcontains(rows.value["Module identification du client"], "(*)") ? "string" : ""
  #       }
  #     }
  #     outputs {
  #       literal {
  #         value = rows.value["Strategie Ident Demande"]
  #         type  = rows.value["Strategie Ident Demande"] != "" ? "string" : ""
  #       }
  #     }
  #   }
  # }
  rows_csv_filepath = "${path.module}/csv/DT_IdentDemande.csv"
}
