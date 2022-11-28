#INCLUDE "Protheus.ch"
#INCLUDE "RwMake.ch"
#INCLUDE "topconn.ch" 
#INCLUDE "Colors.ch" 
#INCLUDE "JPEG.CH"

/*
Programa        : Programa MT103TOK.prw
Objetivo        : P.Entrada verificar valor digitado no campo numero dentro do documento de entrada. 
Autor           : Por Giliard Pazzini teste 	
Data/Hora       : 20/10/2022 16:36
Obs.            : 
*/

User Function MT103TOK()
/*****************************************************************************************
* Programa principal 
*
***/  
Local lRet		:= Paramixb[1]

If l103Inclui
	If Len(Alltrim(cNFiscal)) <> 9 .or. cNFiscal == "000000000"
		MsgBox("Problema com a numeração do documento fiscal. Favor verificar!!!","MT103TOK","STOP")
		lRet := .F.
	EndIf
EndIf

Return  lRet
