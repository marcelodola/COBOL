*SV-CONSULTAS-CMC.                                                
    02 AREA-HEADER.                                               
      03  TRANCODE                       PIC X(10).               
      03  ACAO                           PIC X(70).               
      03  VERSAO-AREA                    PIC 9(05).               
      03  LIT-CMC1                       PIC X(15).               
      03  SESSAO-COMS                    PIC X(38).               
      03  CODIGO-RESULTADO               PIC 9(4).                
      03  MENSAGEM-RESULTADO             PIC X(158).              
      03  LIT-CMC2                       PIC X(200).              
*INFORMACOES ENVIADAS PELA BAIXA PLATAFORMA                       
    02 AREA-APLICATIVO.                                           
       03 PADRAO-CONTA                   PIC 9(01).               
       03 CTR-ENTRADA                    PIC 9(12).               
       03 UNO-SIDEC-ENTRADA              PIC 9(05).               
       03 CTA-SIDEC-ENTRADA              PIC 9(12).               
       03 CTA-NSGD-ENTRADA               PIC 9(12).               
    02 AREA-CONTROLE.                                             
       03 FLAG-FIM                       PIC X(01).               
       03 CONT-REG                       PIC 9(04).               
*INFORMACOES ENVIADAS PARA BAIXA PLATAFORMA                       
    02 TAB-REG.                                                   
       03 TAB-REG-CMC      OCCURS 300 TIMES.                      
            05 CON-IDENTIFICACAO              PIC 9(12).          
            05 SCN-UNO-SIDEC                  PIC 9(05).          
            05 SCN-CONTA-SIDEC                PIC 9(12).          
            05 SCN-UNO-NSGD                   PIC 9(05).          
            05 SCN-PRD-NSGD                   PIC 9(04).          
            05 SCN-CONTA-NSGD                 PIC 9(12).          
            05 SCN-DIGITO-NSGD                PIC 9(01).          
            05 SCN-TIPO-CONTA                 PIC X(05).          
            05 SCN-AG-DV                      PIC 9(05).          
            05 SCN-CONTA                      PIC 9(12).          
            05 SCN-DIGITO                     PIC 9(01).          
            05 SCN-ANO-MIGRACAO               PIC 9(02).          
            05 SCN-SEC-MIGRACAO               PIC 9(02).          
            05 SCN-MES-MIGRACAO               PIC 9(02).          
            05 SCN-DIA-MIGRACAO               PIC 9(02).          
            05 SCN-SEC-INCLUSAO               PIC 9(02).          
            05 SCN-ANO-INCLUSAO               PIC 9(02).          
            05 SCN-MES-INCLUSAO               PIC 9(02).          
            05 SCN-DIA-INCLUSAO               PIC 9(02).          
            05 SCN-SIGLA-BANCO                PIC X(03).          
            05 SCN-COD-TABELA                 PIC X(03).          
            05 SCN-IDENTIFICACAO              PIC X(14).          
            05 SCN-SITUACAO                   PIC 9(02).          
            05 SCN-CHAVE-TAB                  PIC X(80).          
                                                                  
