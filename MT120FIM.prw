#INCLUDE "TOTVS.CH"
#Include 'FWMVCDef.ch'
#INCLUDE "PROTHEUS.CH"
#INCLUDE "TOPCONN.CH"
#INCLUDE "TBICONN.CH"
#INCLUDE "RPTDEF.CH"

/*/{Protheus.doc} MT120FIM
@description Ponto de entrada no final da gravacao do pedido
@author..: PAZZINI
@since...: 2023-04-19
@version.: 1.0
@type....: User function
/*/
User Function MT120FIM()
/************************************************************************************************************************
*
*
****/
Local aArea := GetArea()
Local cA120Num := ParamIxb[2]
Local cSC7Filial := xFilial("SC7")
Local cQuery := ""

    // Att C7_XNOMESC = C1_SOLICIT 
    cQuery := " UPDATE " + RetSqlName("SC7")
    cQuery += "   SET C7_XNOMESC = C1_SOLICIT
    cQuery += "   	FROM 					
    cQuery += "   		"+RetSqlName("SC7")+" SC7 WITH(NOLOCK) INNER JOIN "+RetSqlName("SC1")+"  SC1 WITH(NOLOCK)  						
    cQuery += "   		             ON(SC1.C1_FILIAL+SC1.C1_PEDIDO+C1_ITEMPED) = (C7_FILIAL+C7_NUM+C7_ITEMSC)    														
    cQuery += "   	WHERE SC7.D_E_L_E_T_ = '' 
    cQuery += "   	  AND   SC1.D_E_L_E_T_ = ''
    cQuery += "   	  AND C7_NUM    = '"+cA120Num+"' 
    cQuery += "   	  AND C7_FILIAL = '"+cSC7Filial+"'

    TcSQLExec(cQuery)

    // Att C7_NOMEPC = C7_OBS
    cQuery := " UPDATE " + RetSqlName("SC7")
    cQuery += "   SET C7_XMOTPC = C7_OBS
    cQuery += "   	FROM 					
    cQuery += "   		"+RetSqlName("SC7")+" SC7 WITH(NOLOCK)   														
    cQuery += "   	WHERE SC7.D_E_L_E_T_ = '' 
    cQuery += "   	  AND C7_NUM    = '"+cA120Num+"' 
    cQuery += "   	  AND C7_FILIAL = '"+cSC7Filial+"'

    TcSQLExec(cQuery)

    // Att C7_NOMEPC = USR_NOME
    cQuery := " UPDATE " + RetSqlName("SC7")
    cQuery += "   SET C7_NOMEPC = SYS_USR.USR_NOME
    cQuery += "   	FROM 					
    cQuery += "   		"+RetSqlName("SC7")+" SC7 WITH(NOLOCK) LEFT JOIN SYS_USR WITH(NOLOCK)  						
    cQuery += "   		             ON(C7_USER) =(SYS_USR.USR_ID)   														
    cQuery += "   	WHERE SC7.D_E_L_E_T_ = '' 
    cQuery += "   	  AND C7_NUM    = '"+cA120Num+"' 
    cQuery += "   	  AND C7_FILIAL = '"+cSC7Filial+"'

    TcSQLExec(cQuery)
                    
RestArea(aArea)

Return()

