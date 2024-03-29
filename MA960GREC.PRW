#include "protheus.ch" 
 
 
//-------------------------------------------------------------------
/*/{Protheus.doc} GREC
Ponto de Entrada para preenchimento dos campos F6_TIPOGNU, F6_DOCORIG, F6_DETRECE e F6_CODPROD de acordo com o c�digo de receita e UF.
 
@author [Pazzini]
@since 
/*/
//-------------------------------------------------------------------
User Function MA960GREC()
 
    Local aParam   := {0, '', '', 0, ''} //Par�metros de retorno default
    Local cReceita := PARAMIXB[1]    //C�digo de Receita da guia atual
    Local cUF      := PARAMIXB[2]    //Sigla da UF da guia atual
 
    If Alltrim(cReceita) $ '100099' .And. cUF $ 'RJ' //Valida o C�digo de Receita e sigla da UF da guia atual
        aParam := {24, '2', '',0, ''}          //Retorna os campos F6_TIPOGNU, F6_DOCORIG, F6_DETRECE, F6_CODPROD e STE de acordo com o c�digo de receita e sigla da UF da guia atual.
    EndIf

    If Alltrim(cReceita) $ '100099' .And. cUF $ 'RJ' //Valida o C�digo de Receita e sigla da UF da guia atual
        aParam := {24, '2', '',0, ''}          //Retorna os campos F6_TIPOGNU, F6_DOCORIG, F6_DETRECE, F6_CODPROD e STE de acordo com o c�digo de receita e sigla da UF da guia atual.
    EndIf
 
    If Alltrim(cReceita) $ '1260' .And. cUF $ 'ES' //Valida o C�digo de Receita e sigla da UF da guia atual
        aParam := {24, '2', '',0, '5'}          //Retorna os campos F6_TIPOGNU, F6_DOCORIG, F6_DETRECE, F6_CODPROD e F6_CODAREA de acordo com o c�digo de receita e sigla da UF da guia atual.
    EndIf

    //pzzn 
    If Alltrim(cReceita) $ '100099' .And. cUF $ 'CE' //Valida o C�digo de Receita e sigla da UF da guia atual
        aParam := {10, '1', '',0, ''}          //Retorna os campos F6_TIPOGNU, F6_DOCORIG, F6_DETRECE, F6_CODPROD e F6_CODAREA de acordo com o c�digo de receita e sigla da UF da guia atual.
    EndIf

    If Alltrim(cReceita) $ '100102' .And. cUF $ 'CE' //Valida o C�digo de Receita e sigla da UF da guia atual
        aParam := {10, '1', '',0, ''}          //Retorna os campos F6_TIPOGNU, F6_DOCORIG, F6_DETRECE, F6_CODPROD e F6_CODAREA de acordo com o c�digo de receita e sigla da UF da guia atual.
    EndIf

    //Validar informa��es da NF
    If Alltrim(cReceita) $ '100099' .And. cUF $ 'RS' //Valida o C�digo de Receita e sigla da UF da guia atual
        aParam := {22, '2', '',, ''}          //Retorna os campos F6_TIPOGNU, F6_DOCORIG, F6_DETRECE, F6_CODPROD e F6_CODAREA de acordo com o c�digo de receita e sigla da UF da guia atual.
    EndIf

    If Alltrim(cReceita) $ '100102' .And. cUF $ 'RS' //Valida o C�digo de Receita e sigla da UF da guia atual
        aParam := {22, '2', '',, ''}          //Retorna os campos F6_TIPOGNU, F6_DOCORIG, F6_DETRECE, F6_CODPROD e F6_CODAREA de acordo com o c�digo de receita e sigla da UF da guia atual.
    EndIf
    

    If Alltrim(cReceita) $ '100099' .And. cUF $ 'TO' //Valida o C�digo de Receita e sigla da UF da guia atual
        aParam := {10, '1', '',0, ''}          //Retorna os campos F6_TIPOGNU, F6_DOCORIG, F6_DETRECE, F6_CODPROD e F6_CODAREA de acordo com o c�digo de receita e sigla da UF da guia atual.
    EndIf

    If Alltrim(cReceita) $ '100102' .And. cUF $ 'TO' //Valida o C�digo de Receita e sigla da UF da guia atual
        aParam := {10, '1', '',0, ''}          //Retorna os campos F6_TIPOGNU, F6_DOCORIG, F6_DETRECE, F6_CODPROD e F6_CODAREA de acordo com o c�digo de receita e sigla da UF da guia atual.
    EndIf


    If Alltrim(cReceita) $ '100099' .And. cUF $ 'AM' //Valida o C�digo de Receita e sigla da UF da guia atual
        aParam := {22, '1', '',0, ''}          //Retorna os campos F6_TIPOGNU, F6_DOCORIG, F6_DETRECE, F6_CODPROD e F6_CODAREA de acordo com o c�digo de receita e sigla da UF da guia atual.
    EndIf

    If Alltrim(cReceita) $ '100102' .And. cUF $ 'AM' //Valida o C�digo de Receita e sigla da UF da guia atual
        aParam := {22, '1', '',0, ''}          //Retorna os campos F6_TIPOGNU, F6_DOCORIG, F6_DETRECE, F6_CODPROD e F6_CODAREA de acordo com o c�digo de receita e sigla da UF da guia atual.
    EndIf

    If Alltrim(cReceita) $ '100099' .And. cUF $ 'AP' //Valida o C�digo de Receita e sigla da UF da guia atual
        aParam := {10, '1', '',0, ''}          //Retorna os campos F6_TIPOGNU, F6_DOCORIG, F6_DETRECE, F6_CODPROD e F6_CODAREA de acordo com o c�digo de receita e sigla da UF da guia atual.
    EndIf

    If Alltrim(cReceita) $ '100102' .And. cUF $ 'AP' //Valida o C�digo de Receita e sigla da UF da guia atual
        aParam := {10, '1', '',0, ''}          //Retorna os campos F6_TIPOGNU, F6_DOCORIG, F6_DETRECE, F6_CODPROD e F6_CODAREA de acordo com o c�digo de receita e sigla da UF da guia atual.
    EndIf

    If Alltrim(cReceita) $ '100099' .And. cUF $ 'BA' //Valida o C�digo de Receita e sigla da UF da guia atual
        aParam := {10, '1', '',0, ''}          //Retorna os campos F6_TIPOGNU, F6_DOCORIG, F6_DETRECE, F6_CODPROD e F6_CODAREA de acordo com o c�digo de receita e sigla da UF da guia atual.
    EndIf

   // If Alltrim(cReceita) $ '100102' .And. cUF $ 'BA' //Valida o C�digo de Receita e sigla da UF da guia atual
   //     aParam := {10, '1', '',0, ''}          //Retorna os campos F6_TIPOGNU, F6_DOCORIG, F6_DETRECE, F6_CODPROD e F6_CODAREA de acordo com o c�digo de receita e sigla da UF da guia atual.
   // EndIf

    If Alltrim(cReceita) $ '100099' .And. cUF $ 'AL' //Valida o C�digo de Receita e sigla da UF da guia atual
        aParam := {10, '1', '',0, ''}          //Retorna os campos F6_TIPOGNU, F6_DOCORIG, F6_DETRECE, F6_CODPROD e F6_CODAREA de acordo com o c�digo de receita e sigla da UF da guia atual.
    EndIf

  /*  If Alltrim(cReceita) $ '100102' .And. cUF $ 'AL' //Valida o C�digo de Receita e sigla da UF da guia atual
        aParam := {10, '1', '',0, ''}          //Retorna os campos F6_TIPOGNU, F6_DOCORIG, F6_DETRECE, F6_CODPROD e F6_CODAREA de acordo com o c�digo de receita e sigla da UF da guia atual.
    EndIf
  */  

    If Alltrim(cReceita) $ '100102' .And. cUF $ 'AC' //Valida o C�digo de Receita e sigla da UF da guia atual
        aParam := {10, '1', '',0, ''}          //Retorna os campos F6_TIPOGNU, F6_DOCORIG, F6_DETRECE, F6_CODPROD e F6_CODAREA de acordo com o c�digo de receita e sigla da UF da guia atual.
    EndIf

    If Alltrim(cReceita) $ '100099' .And. cUF $ 'AC' //Valida o C�digo de Receita e sigla da UF da guia atual
        aParam := {10, '1', '',0, ''}          //Retorna os campos F6_TIPOGNU, F6_DOCORIG, F6_DETRECE, F6_CODPROD e F6_CODAREA de acordo com o c�digo de receita e sigla da UF da guia atual.
    EndIf

    If Alltrim(cReceita) $ '100099' .And. cUF $ 'GO' //Valida o C�digo de Receita e sigla da UF da guia atual
        aParam := {10, '1', '',0, ''}          //Retorna os campos F6_TIPOGNU, F6_DOCORIG, F6_DETRECE, F6_CODPROD e F6_CODAREA de acordo com o c�digo de receita e sigla da UF da guia atual.
    EndIf

    If Alltrim(cReceita) $ '100102' .And. cUF $ 'GO' //Valida o C�digo de Receita e sigla da UF da guia atual
        aParam := {10, '1', '',0, ''}          //Retorna os campos F6_TIPOGNU, F6_DOCORIG, F6_DETRECE, F6_CODPROD e F6_CODAREA de acordo com o c�digo de receita e sigla da UF da guia atual.
    EndIf
    
    If Alltrim(cReceita) $ '100099' .And. cUF $ 'MA' //Valida o C�digo de Receita e sigla da UF da guia atual
        aParam := {10, '2', '',0, ''}          //Retorna os campos F6_TIPOGNU, F6_DOCORIG, F6_DETRECE, F6_CODPROD e F6_CODAREA de acordo com o c�digo de receita e sigla da UF da guia atual.
    EndIf

    If Alltrim(cReceita) $ '100102' .And. cUF $ 'MA' //Valida o C�digo de Receita e sigla da UF da guia atual
        aParam := {10, '2', '',0, ''}          //Retorna os campos F6_TIPOGNU, F6_DOCORIG, F6_DETRECE, F6_CODPROD e F6_CODAREA de acordo com o c�digo de receita e sigla da UF da guia atual.
    EndIf

    If Alltrim(cReceita) $ '100099' .And. cUF $ 'MG' //Valida o C�digo de Receita e sigla da UF da guia atual
        aParam := {10, '1', '',0, ''}          //Retorna os campos F6_TIPOGNU, F6_DOCORIG, F6_DETRECE, F6_CODPROD e F6_CODAREA de acordo com o c�digo de receita e sigla da UF da guia atual.
    EndIf

    If Alltrim(cReceita) $ '100102' .And. cUF $ 'MG' //Valida o C�digo de Receita e sigla da UF da guia atual
        aParam := {10, '1', '',0, ''}          //Retorna os campos F6_TIPOGNU, F6_DOCORIG, F6_DETRECE, F6_CODPROD e F6_CODAREA de acordo com o c�digo de receita e sigla da UF da guia atual.
    EndIf

    If Alltrim(cReceita) $ '100099' .And. cUF $ 'MS' //Valida o C�digo de Receita e sigla da UF da guia atual
        aParam := {10, '1', '',0, ''}          //Retorna os campos F6_TIPOGNU, F6_DOCORIG, F6_DETRECE, F6_CODPROD e F6_CODAREA de acordo com o c�digo de receita e sigla da UF da guia atual.
    EndIf

   /* If Alltrim(cReceita) $ '100102' .And. cUF $ 'MS' //Valida o C�digo de Receita e sigla da UF da guia atual
        aParam := {10, '1', '',0, ''}          //Retorna os campos F6_TIPOGNU, F6_DOCORIG, F6_DETRECE, F6_CODPROD e F6_CODAREA de acordo com o c�digo de receita e sigla da UF da guia atual.
    EndIf
    */

    If Alltrim(cReceita) $ '100099' .And. cUF $ 'MT' //Valida o C�digo de Receita e sigla da UF da guia atual
        aParam := {10, '1', '',0, ''}          //Retorna os campos F6_TIPOGNU, F6_DOCORIG, F6_DETRECE, F6_CODPROD e F6_CODAREA de acordo com o c�digo de receita e sigla da UF da guia atual.
    EndIf

    If Alltrim(cReceita) $ '100102' .And. cUF $ 'MT' //Valida o C�digo de Receita e sigla da UF da guia atual
        aParam := {10, '1', '',0, ''}          //Retorna os campos F6_TIPOGNU, F6_DOCORIG, F6_DETRECE, F6_CODPROD e F6_CODAREA de acordo com o c�digo de receita e sigla da UF da guia atual.
    EndIf

    If Alltrim(cReceita) $ '100099' .And. cUF $ 'PA' //Valida o C�digo de Receita e sigla da UF da guia atual
        aParam := {10, '1', '',0, ''}          //Retorna os campos F6_TIPOGNU, F6_DOCORIG, F6_DETRECE, F6_CODPROD e F6_CODAREA de acordo com o c�digo de receita e sigla da UF da guia atual.
    EndIf

    If Alltrim(cReceita) $ '100102' .And. cUF $ 'PA' //Valida o C�digo de Receita e sigla da UF da guia atual
        aParam := {10, '1', '',0, ''}          //Retorna os campos F6_TIPOGNU, F6_DOCORIG, F6_DETRECE, F6_CODPROD e F6_CODAREA de acordo com o c�digo de receita e sigla da UF da guia atual.
    EndIf

    If Alltrim(cReceita) $ '100099' .And. cUF $ 'PI' //Valida o C�digo de Receita e sigla da UF da guia atual
        aParam := {10, '1', '',0, ''}          //Retorna os campos F6_TIPOGNU, F6_DOCORIG, F6_DETRECE, F6_CODPROD e F6_CODAREA de acordo com o c�digo de receita e sigla da UF da guia atual.
    EndIf

    If Alltrim(cReceita) $ '100102' .And. cUF $ 'PI' //Valida o C�digo de Receita e sigla da UF da guia atual
        aParam := {10, '1', '',0, ''}          //Retorna os campos F6_TIPOGNU, F6_DOCORIG, F6_DETRECE, F6_CODPROD e F6_CODAREA de acordo com o c�digo de receita e sigla da UF da guia atual.
    EndIf

    If Alltrim(cReceita) $ '100099' .And. cUF $ 'PR' //Valida o C�digo de Receita e sigla da UF da guia atual
        aParam := {10, '1', '',0, ''}          //Retorna os campos F6_TIPOGNU, F6_DOCORIG, F6_DETRECE, F6_CODPROD e F6_CODAREA de acordo com o c�digo de receita e sigla da UF da guia atual.
    EndIf

    If Alltrim(cReceita) $ '100102' .And. cUF $ 'PR' //Valida o C�digo de Receita e sigla da UF da guia atual
        aParam := {10, '1', '',0, ''}          //Retorna os campos F6_TIPOGNU, F6_DOCORIG, F6_DETRECE, F6_CODPROD e F6_CODAREA de acordo com o c�digo de receita e sigla da UF da guia atual.
    EndIf

    If Alltrim(cReceita) $ '100099' .And. cUF $ 'RO' //Valida o C�digo de Receita e sigla da UF da guia atual
        aParam := {10, '2', '',0, ''}          //Retorna os campos F6_TIPOGNU, F6_DOCORIG, F6_DETRECE, F6_CODPROD e F6_CODAREA de acordo com o c�digo de receita e sigla da UF da guia atual.
    EndIf

    If Alltrim(cReceita) $ '100102' .And. cUF $ 'RO' //Valida o C�digo de Receita e sigla da UF da guia atual
        aParam := {10, '2', '',0, ''}          //Retorna os campos F6_TIPOGNU, F6_DOCORIG, F6_DETRECE, F6_CODPROD e F6_CODAREA de acordo com o c�digo de receita e sigla da UF da guia atual.
    EndIf

    If Alltrim(cReceita) $ '100099' .And. cUF $ 'RR' //Valida o C�digo de Receita e sigla da UF da guia atual
        aParam := {10, '1', '',0, ''}          //Retorna os campos F6_TIPOGNU, F6_DOCORIG, F6_DETRECE, F6_CODPROD e F6_CODAREA de acordo com o c�digo de receita e sigla da UF da guia atual.
    EndIf

    If Alltrim(cReceita) $ '100102' .And. cUF $ 'RR' //Valida o C�digo de Receita e sigla da UF da guia atual
        aParam := {10, '1', '',0, ''}          //Retorna os campos F6_TIPOGNU, F6_DOCORIG, F6_DETRECE, F6_CODPROD e F6_CODAREA de acordo com o c�digo de receita e sigla da UF da guia atual.
    EndIf

    If Alltrim(cReceita) $ '100099' .And. cUF $ 'SE' //Valida o C�digo de Receita e sigla da UF da guia atual
        aParam := {10, '2', '',0, ''}          //Retorna os campos F6_TIPOGNU, F6_DOCORIG, F6_DETRECE, F6_CODPROD e F6_CODAREA de acordo com o c�digo de receita e sigla da UF da guia atual.
    EndIf

    If Alltrim(cReceita) $ '100102' .And. cUF $ 'SE' //Valida o C�digo de Receita e sigla da UF da guia atual
        aParam := {24, '2', '',0, ''}          //Retorna os campos F6_TIPOGNU, F6_DOCORIG, F6_DETRECE, F6_CODPROD e F6_CODAREA de acordo com o c�digo de receita e sigla da UF da guia atual.
    EndIf

    If Alltrim(cReceita) $ '100102' .And. cUF $ 'PE' //Valida o C�digo de Receita e sigla da UF da guia atual
        aParam := {24, '2', '',0, ''}          //Retorna os campos F6_TIPOGNU, F6_DOCORIG, F6_DETRECE, F6_CODPROD e F6_CODAREA de acordo com o c�digo de receita e sigla da UF da guia atual.
    EndIf
   
    If Alltrim(cReceita) $ '100099' .And. cUF $ 'PE' //Valida o C�digo de Receita e sigla da UF da guia atual
        aParam := {22, '2', '',0, ''}          //Retorna os campos F6_TIPOGNU, F6_DOCORIG, F6_DETRECE, F6_CODPROD e F6_CODAREA de acordo com o c�digo de receita e sigla da UF da guia atual.
    EndIf

    If Alltrim(cReceita) $ '100102' .And. cUF $ 'SC' //Valida o C�digo de Receita e sigla da UF da guia atual
        aParam := {24, '2', '',0, ''}          //Retorna os campos F6_TIPOGNU, F6_DOCORIG, F6_DETRECE, F6_CODPROD e F6_CODAREA de acordo com o c�digo de receita e sigla da UF da guia atual.
    EndIf
   
    If Alltrim(cReceita) $ '100099' .And. cUF $ 'SC' //Valida o C�digo de Receita e sigla da UF da guia atual
        aParam := {22, '2', '',0, ''}          //Retorna os campos F6_TIPOGNU, F6_DOCORIG, F6_DETRECE, F6_CODPROD e F6_CODAREA de acordo com o c�digo de receita e sigla da UF da guia atual.
    EndIf

    If Alltrim(cReceita) $ '100102' .And. cUF $ 'DF' //Valida o C�digo de Receita e sigla da UF da guia atual
        aParam := {10, '1', '',0, ''}          //Retorna os campos F6_TIPOGNU, F6_DOCORIG, F6_DETRECE, F6_CODPROD e F6_CODAREA de acordo com o c�digo de receita e sigla da UF da guia atual.
    EndIf
   
    If Alltrim(cReceita) $ '100099' .And. cUF $ 'DF' //Valida o C�digo de Receita e sigla da UF da guia atual
        aParam := {10, '1', '',0, ''}          //Retorna os campos F6_TIPOGNU, F6_DOCORIG, F6_DETRECE, F6_CODPROD e F6_CODAREA de acordo com o c�digo de receita e sigla da UF da guia atual.
    EndIf


Return aParam
