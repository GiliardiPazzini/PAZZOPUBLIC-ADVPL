
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
Local cTitulo    := "Alterar Grupo de Aprovadores"
Local bOk        := {|| .T.}
Local aButtons   := {}
Local lCentered  := .T.
Local nPosx
Local nPosy

/* Variável Privada */
Private cNewGRP    := Space(06)
Private lIncluir 	:= .F.
Private lAlterar 	:= .F.

/* Abro a empresa TESTE, caso faça uso via debug
Remover para utilizar dentro do Protheus*/
 /*   RpcSetEnv('99','01')*/

If Type("ALTERA") == "U"
       ALTERA := .F.
Endif

IF ALTERA == .T. 
    If Type("PARAMIXB") == "U"
            //EXEMPLO 1 (Manipulando o grupo de aprovação):
            MSGALERT( "DESEJA ALTERAR O GRUPO DE APROVAÇÃO ? ")
                cGrp := M-> SC7_APROV
                
                /* Adiciono a pergunta do Parambox */
                aAdd(aPergs, {1, "Novo GRUPO: " , cNewGRP  , "", ".T.", "", ".T.", 80, .F.})

                /* Se a pergunta for confirmada */
                If ParamBox(aPergs, cTitulo, aRetorn, bOk, aButtons, lCentered, nPosx,nPosy, /*oMainDlg*/ , cLoad, lCanSave, lUserSave)
                cNewGRP := aRetorn[1]
                endif
                cGrp := cNewGRP // 28/11
    Else
            ExpC1 := PARAMIXB[1]
            ExpC2 := PARAMIXB[2]

            //EXEMPLO 2 (Manipulando o saldo do pedido, na alteração do pedido):
            //Manipulando o saldo do pedido pelo usuário, conf. necessidade, atualizando a variável n120TotLib
            If ALTERA
                MSGALERT( "ALTERAR no ponto MT120APV")
            Endif
    Endif

ENDIF  
    MSGALERT( "Passando no ponto MT120APV")

Return cGrp
