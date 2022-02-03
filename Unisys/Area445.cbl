000000*SV-CONSULTAS-CMC.                                                
000000    02 AREA-HEADER.                                               
000000      03  TRANCODE                       PIC X(10).               
000000      03  ACAO                           PIC X(70).               
000000      03  VERSAO-AREA                    PIC 9(05).               
000000      03  LIT-CMC1                       PIC X(15).               
000000      03  SESSAO-COMS                    PIC X(38).               
000000      03  CODIGO-RESULTADO               PIC 9(4).                
000000      03  MENSAGEM-RESULTADO             PIC X(158).              
000000      03  LIT-CMC2                       PIC X(200).              
000000*INFORMACOES ENVIADAS PELA BAIXA PLATAFORMA                       
000000    02 AREA-APLICATIVO.                                           
000000       03 PADRAO-CONTA                   PIC 9(01).               
000000       03 CTR-ENTRADA                    PIC 9(12).               
000000       03 UNO-SIDEC-ENTRADA              PIC 9(05).               
000000       03 CTA-SIDEC-ENTRADA              PIC 9(12).               
000000       03 CTA-NSGD-ENTRADA               PIC 9(12).               
000000    02 AREA-CONTROLE.                                             
000000       03 FLAG-FIM                       PIC X(01).               
000000       03 CONT-REG                       PIC 9(04).               
000000*INFORMACOES ENVIADAS PARA BAIXA PLATAFORMA                       
000000    02 TAB-REG.                                                   
000000       03 TAB-REG-CMC      OCCURS 300 TIMES.                      
000000            05 CON-IDENTIFICACAO              PIC 9(12).          
000000            05 SCN-UNO-SIDEC                  PIC 9(05).          
000000            05 SCN-CONTA-SIDEC                PIC 9(12).          
000000            05 SCN-UNO-NSGD                   PIC 9(05).          
000000            05 SCN-PRD-NSGD                   PIC 9(04).          
000000            05 SCN-CONTA-NSGD                 PIC 9(12).          
000000            05 SCN-DIGITO-NSGD                PIC 9(01).          
000000            05 SCN-TIPO-CONTA                 PIC X(05).          
000000            05 SCN-AG-DV                      PIC 9(05).          
000000            05 SCN-CONTA                      PIC 9(12).          
000000            05 SCN-DIGITO                     PIC 9(01).          
000000            05 SCN-ANO-MIGRACAO               PIC 9(02).          
000000            05 SCN-SEC-MIGRACAO               PIC 9(02).          
000000            05 SCN-MES-MIGRACAO               PIC 9(02).          
000000            05 SCN-DIA-MIGRACAO               PIC 9(02).          
000000            05 SCN-SEC-INCLUSAO               PIC 9(02).          
000000            05 SCN-ANO-INCLUSAO               PIC 9(02).          
000000            05 SCN-MES-INCLUSAO               PIC 9(02).          
000000            05 SCN-DIA-INCLUSAO               PIC 9(02).          
000000            05 SCN-SIGLA-BANCO                PIC X(03).          
000000            05 SCN-COD-TABELA                 PIC X(03).          
000000            05 SCN-IDENTIFICACAO              PIC X(14).          
000000            05 SCN-SITUACAO                   PIC 9(02).          
000000            05 SCN-CHAVE-TAB                  PIC X(80).          
000000                                                                  
000000