program NovoProjetoDelphi1;

uses
  System.StartUpCopy,
  FMX.Forms,
  frmLoginCadastro in 'frmLoginCadastro.pas' {fIniciar},
  UDM in 'UDM.pas' {DM: TDataModule},
  frmMenu in 'frmMenu.pas' {frmMenuu},
  frmPedido in 'frmPedido.pas' {frmPed},
  frmConta in 'frmConta.pas' {frmConta1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfIniciar, fIniciar);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmMenuu, frmMenuu);
  Application.CreateForm(TfrmPed, frmPed);
  Application.CreateForm(TfrmConta1, frmConta1);
  Application.Run;
end.
