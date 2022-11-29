
#Include "Protheus.ch"
#Include "RwMake.ch"
#Include "TbiConn.ch"
#INCLUDE "TOTVS.CH"
#INCLUDE "TOPCONN.CH"

//Pazzini
User Function MT120APV()

Local ExpC1 := Nil
Local ExpC2 := Nil
Local cGrp := "" //Grupo de aprovação

Local aPergs     := {}
Local aRetorn    := {}
Local cLoad      := "00001"
Local lCanSave   := .T.
Local lUserSave  := .T.
Local cTitulo    := "GRUPO DE APROVADORES"
Local bOk        := {|| .T.}
Local aButtons   := {}
Local lCentered  := .T.
Local nPosx
Local nPosy
Local cMSG :=""

/* Variável Privada */
Private cNewGRP    := Space(06)
//Private lIncluir 	:= .F.
//Private lAlterar 	:= .F.

/* Abro a empresa TESTE, caso faça uso via debug
Remover para utilizar dentro do Protheus*/
 /*   RpcSetEnv('99','01')*/
IF !IsBlind()  

    If  !Type("ALTERA") == "U"
        ALTERA := .F.
        INCLUIR := .T.
    Endif

    If !Type("INCLUIR") == "U"
        ALTERA := .T.
        INCLUIR := .F.
    Endif

    If (ALTERA .OR. INCLUIR ) == .T.
        If Type("PARAMIXB") == "U"
        
            IF EMPTY(cMSG)
                cMSG := AllTrim(cMSG) + "ALTERAR GRUPO DE APROVADORES ! " + chr(13)+chr(10)
                If !IsBlind()  
                    If MsgYesNo(cMSG + chr(13)+chr(10)+ "Deseja continuar?" )
                        lRet := .t.
                    Else
                        lRet := .F.
                        IF lRet == .F. .and. !IsBlind()  
                            Return(lRet)
                        EndIf 
                    EndIf
                EndIf

            EndIf
                /* Adiciono a pergunta do Parambox */
                aAdd(aPergs, {1, "NOVO GRUPO : " , cNewGRP  , "", ".T.", "", ".T.", 80, .F.})

                /* Se a pergunta for confirmada */
                If ParamBox(aPergs, cTitulo, aRetorn, bOk, aButtons, lCentered, nPosx,nPosy, /*oMainDlg*/ , cLoad, lCanSave, lUserSave)
                cNewGRP := aRetorn[1]
                endif
                cGrp := cNewGRP // 28/11
                MSGALERT( "Grupo alterado com sucesso ! ")
        Else
                ExpC1 := PARAMIXB[1]
                ExpC2 := PARAMIXB[2]

                //EXEMPLO 2 (Manipulando o saldo do pedido, na alteração do pedido):
                //Manipulando o saldo do pedido pelo usuário, conf. necessidade, atualizando a variável n120TotLib
                /*If ALTERA
                    MSGALERT( "ALTERAR no ponto MT120APV")
                Endif
                
                If INCLUIR
                    MSGALERT( "INCLUIR no ponto MT120APV")
                Endif
                */  
        EndIf

    EndIf 
        MSGALERT( "Saindo do ponto de entrada MT120APV")
ENDIF

Return cGrp

