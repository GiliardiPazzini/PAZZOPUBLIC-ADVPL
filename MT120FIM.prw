#INCLUDE "TOTVS.CH"
#Include 'FWMVCDef.ch'
#INCLUDE "PROTHEUS.CH"
#INCLUDE "TOPCONN.CH"
#INCLUDE "TBICONN.CH"
#INCLUDE "RPTDEF.CH"

/*/{Protheus.doc} MT120FIM
@description Ponto de entrada no final da gravacao do pedido
@author PAZZINI
@since 07/03/16
@version 1.0
@type function
/*/
User Function MT120FIM()

	Local aArea := GetArea()
	//Local nOpc := ParamIxb[1]
	Local cA120Num := ParamIxb[2]
	//Local nOpcA	:= ParamIxb[3]
	Local cSC7Filial := xFilial("SC7")
	//Local cSC7KeySeek	:= (cSC7Filial + cA120Num)
	//Local nSC7Order := RetOrder("SC7", "C7_FILIAL+C7_NUM+C7_ITEM")

	Local cQuery := ""


		cQuery := " UPDATE " + RetSqlName("SC7")
		cQuery += "    SET C7_XNOMESC = C1_SOLICIT ,  C7_XMOTPC = C7_NOMEPC, C7_OBS = USR_NOME 
		cQuery += "   	FROM 					
		cQuery += "   		"+RetSqlName("SC7")+" SC7 WITH(NOLOCK) INNER JOIN "+RetSqlName("SC1")+"  SC1 WITH(NOLOCK)  						
		cQuery += "   		             ON(SC1.C1_FILIAL+SC1.C1_PEDIDO+C1_ITEMPED) = (C7_FILIAL+C7_NUM+C7_ITEMSC)    														
		cQuery += "   	WHERE SC7.D_E_L_E_T_ = '' 
		cQuery += "   	  AND   SC1.D_E_L_E_T_ = ''
		cQuery += "   	  AND C7_NUM    = '"+cA120Num+"' 
		cQuery += "   	  AND C7_FILIAL = '"+cSC7Filial+"'

		TcSQLExec(cQuery)
				
	RestArea(aArea)

Return()

