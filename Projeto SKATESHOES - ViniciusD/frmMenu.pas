unit frmMenu;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.TabControl,
  FMX.Menus, FMX.Controls.Presentation, FMX.StdCtrls, FMX.ExtCtrls,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, FMX.MultiView, FMX.Objects, FMX.Layouts, FMX.Edit, FMX.Ani,
  System.Actions, FMX.ActnList;

type
  TfrmMenuu = class(TForm)
    ActionList1: TActionList;
    ChangeTabAction1: TChangeTabAction;
    MultiView1: TMultiView;
    LayoutMenuTopo: TLayout;
    CircleFoto: TCircle;
    LabelNomeUser: TLabel;
    VertScrollBox1: TVertScrollBox;
    RectConta: TRoundRect;
    Label1: TLabel;
    RoundPedidos: TRoundRect;
    LabelProfissionais: TLabel;
    rect_toolbar: TRectangle;
    img_busca: TImage;
    rect_busca: TRectangle;
    img_cancel_busca: TImage;
    AnimationBusca: TFloatAnimation;
    RoundRect1: TRoundRect;
    edt_busca: TEdit;
    btnMenu: TSpeedButton;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    Image1: TImage;
    TabItem2: TTabItem;
    Image2: TImage;
    Label2: TLabel;
    VertScrollBoxMinhaLista: TVertScrollBox;
    procedure RectContaClick(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure img_buscaClick(Sender: TObject);
    procedure AddItem(Sender: TObject);
    procedure RoundPedidosClick(Sender: TObject);
    private
    { Private declarations }
    procedure CarregarListaProdutos(
            id: integer;
            nome, descricao: string;
            valor: integer);

  public
    { Public declarations }
    procedure GetProdutosBase;
  end;




var
  frmMenuu: TfrmMenuu;

implementation

{$R *.fmx}

uses UDM, frmConta, frmPedido;


procedure TfrmMenuu.CarregarListaProdutos(id: integer; nome, descricao: string; valor: integer );
var
  rect, rect_barra: TRectangle;
  rect_icone: TCircle;
  lbl: TLabel;
  img: TImage;
  i, valorEstrela: integer;
  btn: TButton;
begin

  // fundo
  rect := TRectangle.Create(VertScrollBoxMinhaLista);
  with rect do
  begin
    Align := TAlignLayout.Top;
    Height := 110;
    Fill.Color := $FFFFFFFF;
    Stroke.Kind := TBrushKind.Solid;
    Stroke.Color := $FFD4D5D7;
    Margins.Top := 10;
    Margins.Left := 10;
    Margins.Right := 10;
    XRadius := 8;
    YRadius := 8;
    TagString := IntToStr(id);
  end;
  // Barra inferior...
  rect_barra := TRectangle.Create(rect);
  with rect_barra do
  begin
    Align := TAlignLayout.Bottom;
    Height := 45;
    Fill.Color := $FFF4F4F4;
    Stroke.Kind := TBrushKind.Solid;
    Stroke.Color := $FFD4D5D7;
    Sides := [TSide.Left, TSide.Bottom, TSide.Right];
    XRadius := 8;
    YRadius := 8;
    Corners := [TCorner.BottomLeft, TCorner.BottomRight];
    HitTest := False;
    rect.AddObject(rect_barra);
  end;

  lbl := TLabel.Create(rect);
  with lbl do
  begin
    StyledSettings := StyledSettings - [TStyledSetting.Size,
      TStyledSetting.FontColor, TStyledSetting.Style];
    TextSettings.FontColor := $FF333333;
    Text := nome;
    font.Size := 16;
    font.Style := [TFontStyle.fsBold];
    Position.x := 50;
    Position.Y := 10;
    Width := 200;
    rect.AddObject(lbl);
  end;
  lbl := TLabel.Create(rect_barra);
  with lbl do
  begin
    StyledSettings := StyledSettings - [TStyledSetting.Size,
    TStyledSetting.FontColor, TStyledSetting.Style];
    TextSettings.FontColor := $FFDF0B0B;
    Text := descricao;
    font.Size := 11;
    font.Style := [TFontStyle.fsBold];
    Position.x := 5;
    Position.Y := 70;
    Width := 500;
    rect.AddObject(lbl);
  end;
  lbl := TLabel.Create(rect);
  with lbl do
  begin
    StyledSettings := StyledSettings - [TStyledSetting.Size,
    TStyledSetting.FontColor, TStyledSetting.Style];
    TextSettings.FontColor := $FADF0B0B;
    Text := 'R$' + valor.ToString;
    font.Size := 20;
    font.Style := [TFontStyle.fsBold];
    Position.x := 200;
    Position.Y := 10;
    Width := 500;
    rect.AddObject(lbl);
  end;

  btn := TButton.Create(rect_barra);
  with btn do
  begin
    nome := 'btnAdd' + IntToStr(id);
    StyleLookup := 'additembutton';
    Position.x := 180;
    Position.Y := 85;
    Height := 25;
    Width := 25;
    TagString := IntToStr(id);
    OnClick := AddItem;
    rect.AddObject(btn);
  end;

  lbl := TLabel.Create(rect_barra);
  with lbl do
  begin
    StyledSettings := StyledSettings - [TStyledSetting.Size,
      TStyledSetting.FontColor, TStyledSetting.Style];
    TextSettings.FontColor := $FFDF0B0B;
    font.Size := 16;
    font.Style := [TFontStyle.fsBold];
    Position.x := 230;
    Position.Y := 85;
    Width := 30;
    Text := '0';
    nome := 'labelAdd' + IntToStr(id);
    rect.AddObject(lbl);
  end;

  btn := TButton.Create(rect_barra);
  with btn do
  begin
    nome := 'btnRemove' + IntToStr(id);
    StyleLookup := 'deleteitembutton';
    Position.x := 270;
    Position.Y := 85;
    Height := 25;
    Width := 25;
    TagString := IntToStr(id);
    //OnClick := RemoveItem;
    rect.AddObject(btn);
  end;



  VertScrollBoxMinhaLista.AddObject(rect);
end;

procedure TfrmMenuu.AddItem(Sender: TObject);
var
idpes: integer;
idprod: integer;
valorEdit: integer;
nome, descricao: string;

begin

 idpes :=  DM.FDQueryPessoaid.AsInteger;
 idprod :=  DM.FDQueryProdutoprodutoid.AsInteger;
 valorEdit :=  DM.FDQueryProdutovalor.AsInteger;
 nome :=  DM.FDQueryProdutonome.AsString;
 descricao :=  DM.FDQueryProdutodescricao.AsString;




  DM.FDQueryAddProd.ParamByName('pid').AsInteger := idprod;
  DM.FDQueryAddProd.ParamByName('pnome').AsString := nome;
  DM.FDQueryAddProd.ParamByName('pdescricao').AsString := descricao;
  DM.FDQueryAddProd.ParamByName('pvalor').AsInteger := valorEdit;
  DM.FDQueryAddProd.ParamByName('ppessoaid').AsInteger := idpes;


  DM.FDQueryAddProd.ExecSQL;

  frmMenuu.Release;
  frmMenuu:=nil;

  Application.CreateForm(TfrmPed, frmPed);
    frmPed.Show;

    frmPed.GetProdutosBase;


end;

 procedure TfrmMenuu.GetProdutosBase;
  begin
  DM.FDQueryProduto.Close;
  DM.FDQueryProduto.Open();
  while not DM.FDQueryProduto.Eof do
  begin
    CarregarListaProdutos(
    DM.FDQueryProdutoprodutoid.AsInteger,
    DM.FDQueryProdutonome.AsString,
    DM.FDQueryProdutodescricao.AsString,
    DM.FDQueryProdutovalor.AsInteger);
  end;
  end;

  procedure TfrmMenuu.Image1Click(Sender: TObject);
begin

ChangeTabAction1.Execute;
CarregarListaProdutos(
    DM.FDQueryProdutoprodutoid.AsInteger,
    DM.FDQueryProdutonome.AsString,
    DM.FDQueryProdutodescricao.AsString,
    DM.FDQueryProdutovalor.AsInteger);

end;




procedure TfrmMenuu.img_buscaClick(Sender: TObject);
begin

    Application.CreateForm(TfrmPed, frmPed);

    frmPed.Show;
    frmMenuu.Release;
    frmMenuu:=nil;

end;

procedure TfrmMenuu.RectContaClick(Sender: TObject);

begin


    Application.CreateForm(TfrmConta1, frmConta1);
    frmConta1.CarregarCampos;
    frmConta1.Show;
    frmMenuu.Release;
    frmMenuu:=nil;


end;


procedure TfrmMenuu.RoundPedidosClick(Sender: TObject);
begin

Application.CreateForm(TfrmPed, frmPed);

    frmPed.Show;
    frmMenuu.Release;
    frmMenuu:=nil;

end;

end.



